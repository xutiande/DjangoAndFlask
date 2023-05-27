from django.http import HttpResponse
from django.shortcuts import render, redirect
from . import models, spider_download
from django.core.exceptions import ValidationError
from django.utils.safestring import mark_safe
import pandas as pd
from django.contrib import messages
import matplotlib.pyplot as plt
from matplotlib.font_manager import FontProperties
from django.http import HttpResponse
from io import BytesIO
import base64
from app01 import forms
from app01.utils.code import check_code


# Create your views here.


# 首页
def index(request):
    if request.method == 'GET':
        return render(request, 'index.html')


# -----------------老师-----------------------
# 老师列表
def teacher_list(request):
    data = models.TeacherData.objects.all()
    return render(request, 'teacher_list.html', {'data': data})


# 添加老师
def teacher_add(request):
    if request.method == 'GET':
        form = forms.TeacherModelForm()
        return render(request, 'teacher_add.html', {'form': form})
    form = forms.TeacherModelForm(request.POST)
    # 判断提交是否成功,成功则存储数据库
    if form.is_valid():
        form.save()
        return redirect('/teacher/list/')
    # 错误则打印错原因
    return render(request, 'teacher_add.html', {'form': form})


# 编辑老师
def teacher_edit(request, nid):
    row_object = models.TeacherData.objects.filter(id=nid).first()

    if request.method == 'GET':
        form = forms.TeacherModelForm(instance=row_object)
        return render(request, 'teacher_edit.html', {'form': form})
    form = forms.TeacherModelForm(request.POST, instance=row_object)
    if form.is_valid():
        # print(form.cleaned_data)
        form.save()
        return redirect('/teacher/list/')

    return render(request, 'teacher_edit.html', {'form': form})


# 删除老师
def teacher_delete(request, nid):
    models.TeacherData.objects.filter(id=nid).delete()
    return redirect('/teacher/list/')


# -----------------学生-----------------------

# 学生列表
def student_list(request):
    # for i in range(100):
    #     models.StudentData.objects.create(student_id=f'202151020900{i}', student_class='智能2101', name=f'徐天德{i}',
    #                                       age=18,
    #                                       gender=1, score=i, teacher_id=1)

    # 通过get请求获取url的q值
    data_list = {}
    search_data = request.GET.get("search", '')
    # 有数据则是True
    if search_data:
        data_list["name__contains"] = search_data

    # 当前页显示数据条数
    page = int(request.GET.get('page', 1))  # 当前页码
    page_size = 10  # 每页显示多少条数据
    start = (page - 1) * page_size  # 起始值
    end = page * page_size  # 结束值

    # 分页
    total_count = models.StudentData.objects.filter(**data_list).count()  # 获取数据库中的总数量条数

    total_page_count = (total_count // page_size) + 1  # 取整，为页码标签的数量
    start_page = page - 2  # 前两个页码
    end_page = page + 2  # 后两个页码

    # 解决页码为负数
    if start_page <= 1:
        start_page = 1

    # 存放a标签的列表
    page_string_list = []
    for i in range(start_page, end_page + 1):
        if i <= total_page_count:  # 解决超过总页码数
            if i == page:
                page_a = f'<li class="page-item active"><a class="page-link " href="?page={i}">{i}</a></li>'
            else:
                page_a = f'<li class="page-item"><a class="page-link " href="?page={i}">{i}</a></li>'
            page_string_list.append(page_a)
    page_string = mark_safe("".join(page_string_list))

    if request.method == 'GET':
        queryset = models.StudentData.objects.filter(**data_list)[start:end]
        return render(request, 'student_list.html',
                      {'data': queryset, 'page_string': page_string, "total_page_count": total_page_count})

    # 页码标签右侧输入跳转
    page_all = request.POST.get('go_page')
    if int(page_all) <= total_page_count:
        return redirect(f'/student/list/?page={page_all}')
    # 超出总页码范围会重定向到当前页面
    return redirect(f'/student/list/?page={page}')


# 添加学生
def student_add(request):
    if request.method == 'GET':
        form = forms.StudentEditModelForm
        return render(request, 'student_add.html', {"form": form})
    form = forms.StudentEditModelForm(request.POST)
    if form.is_valid():
        form.save()
        return redirect('/student/list/')

    return render(request, 'student_edit.html', {'form': form})


# 编辑学生
def student_edit(request, nid):
    # 根据id获取到数据库中的数据

    now_object = models.StudentData.objects.filter(id=nid).first()

    if request.method == 'GET':
        # instance显示原始数据
        form = forms.StudentEditModelForm(instance=now_object)
        return render(request, 'student_edit.html', {"form": form})
    # 验证提交信息是否正确,有instance=now_object则刷新数据,没有则新增
    form = forms.StudentEditModelForm(request.POST, instance=now_object)

    # 无误
    if form.is_valid():
        form.save()
        print(form.cleaned_data)
        return redirect('/student/list/')
    # 错误则执行
    return render(request, 'student_edit.html', {'form': form})


# 删除学生
def student_delete(request, nid):
    models.StudentData.objects.filter(id=nid).delete()
    return redirect('/student/list/')


# 降序排序
def student_score_sort_jiang(request):
    if request.method == 'GET':
        queryset = models.StudentData.objects.all().order_by('-score')
        return render(request, 'student_list.html', {'data': queryset})


def student_score_sort_sheng(request):
    queryset = models.StudentData.objects.all().order_by('score')
    return render(request, 'student_list.html', {'data': queryset})


# ------------------------------爬虫功能实现-----------------------------------


# 爬虫
def spider_html(request):
    if request.method == 'GET':
        return render(request, 'spider.html')


# 运行爬虫程序
def run_spider(request):
    spider_download.main()
    message = '爬虫下载完成！'
    return render(request, 'spider.html', {'message': message})


context = {}


# 数据分析
def data_analyse(request):
    global context
    path = r'D:\各语言开发目录\django\student_manage\student_data.csv'

    # 读取CSV文件
    df = pd.read_csv(path, encoding='gb18030')

    # 成绩按照范围分类
    ranges = [
        (0, 60),
        (60, 70),
        (70, 80),
        (80, 90),
        (90, 100)
    ]

    def classify_score(score):
        for r in ranges:
            if r[0] <= score < r[1]:
                return f'{r[0]}-{r[1]}'
        return '未知范围'

    df['成绩范围'] = df['成绩'].apply(classify_score)

    # 计算每个范围的百分比
    percentage = df['成绩范围'].value_counts(normalize=True) * 100
    # 按范围从高到低排序
    sorted_percentage = percentage.sort_values(ascending=False)

    # 将处理后的数据和排序后的百分比传递给模板
    context = {
        'percentage': sorted_percentage
    }

    # 输出每个范围的百分比
    return render(request, 'spider.html', context)


# 可视化
def data_chart(request):
    global context
    font = FontProperties(fname=r'C:\Windows\Fonts\Deng.ttf', size=14)

    i_list = []
    for i in context.get('percentage'):
        i_list.append(i)
    # 定义数据
    data = {'0-60': i_list[0],
            '90-100': i_list[1],
            '70-80': i_list[2],
            '60-70': i_list[3],
            '80-90': i_list[4]
            }

    # 设置颜色和样式
    colors = ['skyblue', 'lightgreen', 'orange', 'lightcoral', 'lightsalmon']
    wedgeprops = {'linewidth': 1, 'edgecolor': 'white'}

    # 绘制饼状图
    plt.pie(data.values(), labels=data.keys(), autopct='%1.1f%%', colors=colors, wedgeprops=wedgeprops, shadow=True)
    plt.title('成绩范围分布', fontproperties=font)
    plt.axis('equal')

    # 将图形转换为字节流
    buffer = BytesIO()
    plt.savefig(buffer, format='png')
    buffer.seek(0)

    image_base64 = base64.b64encode(buffer.getvalue()).decode('utf-8')

    plt.clf()  # 清除图形缓存

    # 返回渲染的HTML响应
    return render(request, 'spider.html', {'image_base64': image_base64})


# ---------------------------登录与注册功能--------------------------------
# 注册功能
def Registered(request):
    if request.method == 'GET':
        form = forms.RegisteredModelForm()
        return render(request, 'registered.html', {"form": form})

    form = forms.RegisteredModelForm(data=request.POST)  # 获取POST请求的数据
    # 将用户信息存到到sesson上

    # 信息验证成功则
    if form.is_valid():
        # form.save()
        # 获取session中的验证码与用户输入的验证码
        session_code = request.session.get('image_code', '')
        user_info_code = form.cleaned_data.get('code', '')
        # 判断
        if user_info_code.upper() != session_code.upper():
            form.add_error('code', '验证码错误')
            return render(request, 'registered.html', {"form": form})
        # 验证码验证成功
        user_info_username = form.cleaned_data.get('username')
        exits = models.Registered.objects.filter(username=user_info_username).exists()  # 判断是否存在
        if not exits:
            form.save()
            # 将用户名提交到session中
            request.session['username'] = {"username": form.cleaned_data.get('username')}
            return redirect('/login/')
        # 如果存在
        form.add_error('username', '用户名已经存在！')
        return render(request, 'registered.html', {"form": form})
    # 否则
    # print(form.errors)
    return render(request, 'registered.html', {"form": form})


# 登录功能
def login(request):
    if request.method == 'GET':
        form = forms.LoginModelForm()
        return render(request, 'login.html', {"form": form})

    # POST获取用户输入的数据
    form = forms.LoginModelForm(data=request.POST)
    if form.is_valid():

        # {'username': 'xutiande', 'password': '73e5e52d64db3937a406d950eb78a2d3', 'code': 'ZGPEL'}
        user_info_code = form.cleaned_data.pop('code')  # 获取字典最后的字符
        session_code = request.session.get('image_code', '')
        # print(user_info_code)
        # print(session_code)
        # 验证码不正确
        if user_info_code != session_code:
            # print(form.cleaned_data)
            form.add_error('code', '验证码错误')
            return render(request, 'login.html', {"form": form})
        # 验证码正确
        login_object = models.Registered.objects.filter(**form.cleaned_data).first()
        if login_object:
            request.session['info'] = form.cleaned_data.get('username')
            print(request.session.get('info'), request.session.get("image_code"))
            return redirect('/')
        form.add_error('username', '用户名不存在')
        return render(request, 'login.html', {"form": form})
    return render(request, 'login.html', {"form": form})


# 注销
def logout(request):
    request.session.clear()
    return render(request, 'index.html')


# 随机验证码生成
def image_code(request):
    img, code_string = check_code()
    # 存储session
    request.session['image_code'] = code_string
    request.session.set_expiry(60)

    stream = BytesIO()
    img.save(stream, 'png')
    return HttpResponse(stream.getvalue())
    # img为验证码，code_string为验证码数值
