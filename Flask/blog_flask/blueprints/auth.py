# 授权
import random
import string

from flask import Blueprint, render_template, request, jsonify, redirect, url_for, \
    session  # 蓝图，模板，请求，返回json数据，重定向，视图函数转化为url,记录授权
from flask_mail import Message
from exts import mail, db
from models import EmailCaptchaModels, UserModel
from .forms import RegisterForm, loginForm
from werkzeug.security import generate_password_hash, check_password_hash  # 自动生成加密密码,加密后密码与先密码进行对比

# /auth
bp = Blueprint('auth', __name__, url_prefix="/auth")


# 例如
# /auth/login

# 登录
@bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'GET':
        return render_template('login.html')
    else:
        form = loginForm(request.form)
        if form.validate():
            email = form.email.data
            password = form.password.data
            user = UserModel.query.filter_by(email=email).first()
            if not user:
                print('邮箱在数据库中不存在')
                return redirect(url_for('auth.login'))
            if check_password_hash(user.password, password):
                # cookie：
                # cookie中不适合存储太多数据，只适合存储少量数据
                # cookie一般用来存储登录授权的对象
                # flask中的session，是经过加密存储在cookie中的
                session['user_id'] = user.id

                return redirect('/')  # 登录成功后跳转
            else:
                print('密码错误')
                return redirect(url_for('auth.login'))
        else:
            print(form.errors)
            return redirect(url_for('auth.login'))


# 退出登录
@bp.route("/logout")
def logout():
    session.clear()
    return redirect('/')


# 注册表
# GET:从服务器请求数据
# POST:将客户端数据提交给服务器
@bp.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'GET':
        return render_template('register.html')
    else:
        # 验证用户提交邮箱与验证码是否正确
        # 表单 验证:flask-wtf
        form = RegisterForm(request.form)  # 验证与RegisterForm类里面的数据
        if form.validate():  # validate会自动调用form里面的类与方法，验证是否正确
            email = form.email.data
            username = form.username.data
            password = form.password.data
            user = UserModel(email=email, username=username, password=generate_password_hash(password))  # 密码加密处理
            db.session.add(user)
            db.session.commit()
            return redirect(url_for("auth.login"))  # 跳转到login视图函数页面
        else:

            print(form.errors)

            # for mistake in form.errors:
            #     # if mistake
            #     print(''.join(mistake))

            return render_template('register.html',mistake='请检查输入是否正确！')  # render_template('register.html',a1=form.email.data)


# 邮箱验证码

@bp.route('/captcha/email')
def get_email_captcha():
    email = request.args.get('email')
    source = string.digits * 4  # 数字
    English_source = string.ascii_uppercase * 4  # 大写字母
    captcha = random.sample(source, 4)  # 随机取值
    captcha = "".join(captcha)
    print(captcha)
    message = Message(subject='验证码测试', recipients=[email], body=f'您的验证码是:{captcha}')  # 主题+收件人+内容
    mail.send(message)

    # 验证码存储到数据库中
    email_captcha = EmailCaptchaModels(email=email, captcha=captcha)
    db.session.add(email_captcha)
    db.session.commit()

    # 返回RESTful API格式的数据
    return jsonify({"code": 200, "message": "", "data": None})


# 邮箱
@bp.route('/mail/test')
def mail_test():
    message = Message(subject='邮箱测试', recipients=['@qq.com'], body='这是一条测试邮件')  # 主题+收件人+内容
    mail.send(message)
    return "邮件发送成功"
