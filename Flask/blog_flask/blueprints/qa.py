# 问答
from flask import Blueprint, request, render_template, g, redirect, url_for
from .forms import QuestionForm, AnswerForm
from models import QuestionModel, AnswerModel
from exts import db
from ducorators import login_required  # 引用装饰器

bp = Blueprint('qa', __name__, url_prefix="/")


# http://127.0.0.1:5000

# 文章首页
@bp.route("/")
def index():
    question = QuestionModel.query.order_by(QuestionModel.create_time.desc()).all()  #

    return render_template('index.html')


# 发布页面
@bp.route("/qa/public/", methods=['GET', 'POST'])
@login_required  # 使用装饰器
def public_question():
    if request.method == 'GET':
        return render_template('public_question.html')
    form = QuestionForm(request.form)
    if form.validate():
        title = form.title.data
        content = form.content.data
        question = QuestionModel(title=title, content=content, author=g.user)  # 登录用户名绑定在g上
        db.session.add(question)
        db.session.commit()
        # todo:跳转到首页
        return redirect(url_for("qa.class_question"))
    else:
        print(form.errors)
        return redirect(url_for("qa.class_question"))


# 文章详情页
@bp.route('/qa/detail/<qa_id>/')
def qa_detail(qa_id):
    question = QuestionModel.query.get(qa_id)
    # print(question.author.username)         author是QuestionModel中绑定Usermodel的变量

    return render_template('detail.html', question=question)


# 回复文章评论
# 也需要进行表单验证

# @bp.route("/answer/public",methods=['POST'])  等于下方
@bp.post("/answer/public/")  # 提交表单POST请求
@login_required  # 是否登录验证
def public_answer():
    form = AnswerForm(request.form)
    if form.validate():  # 登陆成功则
        content = form.content.data
        question_id = form.question_id.data
        answer = AnswerModel(content=content, question_id=question_id, author_id=g.user.id)
        db.session.add(answer)
        db.session.commit()
        return redirect(url_for("qa.qa_detail", qa_id=question_id))
    else:  # 否则
        print(form.errors)
        return redirect(url_for("qa.qa_detail", qa_id=request.form.get("question_id")))


# 介绍
@bp.route('/introduce/')
def introduce_project():
    return render_template('introduce.html')


# 搜索

@bp.route("/search/")
def search():
    # serach?q=flask
    q = request.args.get('q', '')

    question = QuestionModel.query.filter(QuestionModel.title.contains(q)).all()
    return render_template("class.html", question=question)


# 分类
@bp.route("/class/")
def class_question():
    question = QuestionModel.query.order_by(QuestionModel.create_time.desc()).all()  #
    return render_template('class.html', question=question)


# 编辑
@bp.route("/class/qa_edit/<qa_id>/", methods=['GET', 'POST'])
def class_edit(qa_id):
    questions = QuestionModel.query.get(qa_id)

    if request.method == 'GET':
        return render_template('revise_note.html', question=questions)
    form = QuestionForm(request.form)
    if form.validate():
        title = form.title.data
        content = form.content.data
        question = QuestionModel(title=title, content=content, author=g.user)  # 登录用户名绑定在g上
        db.session.merge(question)
        db.session.commit()
        # todo:跳转到首页
        return redirect(url_for("qa.class_question"))
    else:
        print(form.errors)
        return redirect(url_for("qa.class_question"))


# 删除
@bp.route("/class/delete/<qa_id>/")
def class_delete(qa_id):
    # 查找数据库中的字段
    question = QuestionModel.query.filter_by(id=qa_id).first()
    if question:
        db.session.delete(question)  # 删除
        db.session.commit()  # 重新提交
    return redirect(url_for("qa.class_question"))
