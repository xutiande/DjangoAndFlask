# 模型文件
from exts import db
from datetime import datetime


# 用户登录表
class UserModel(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)  # 主键，自增
    username = db.Column(db.String(100), nullable=False)
    password = db.Column(db.String(200), nullable=False)
    email = db.Column(db.String(100), nullable=False, unique=True)  # 唯一的（不能出现相同的）
    join_time = db.Column(db.DateTime, default=datetime.now)  # 用户当前时间


# 邮箱与邮箱验证码表
class EmailCaptchaModels(db.Model):
    __tablename__ = 'email_captcha'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)  # 主键，自增
    email = db.Column(db.String(100), nullable=False)
    captcha = db.Column(db.String(100), nullable=False)


# 文章
class QuestionModel(db.Model):
    __tablename__ = 'question'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String(100), nullable=False)
    content = db.Column(db.Text, nullable=False)
    create_time = db.Column(db.DateTime, default=datetime.now)

    # 添加外键，引用UserModel中的id作为外键
    # author对应user表的id，形成多对一关系，例如一个作者对应很多文章
    author_id = db.Column(db.Integer, db.ForeignKey("user.id"))  # ForeignKey创建外键，等于user表的id
    author = db.relationship(UserModel, backref='question')  # db.relationship()用于在两个表之间建立一对多关系


# 评论区

class AnswerModel(db.Model):
    __tablename__ = 'answer'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    content = db.Column(db.Text, nullable=False)
    create_time = db.Column(db.DateTime, default=datetime.now)

    # 外键
    question_id = db.Column(db.Integer, db.ForeignKey('question.id'))  # question表的id
    author_id = db.Column(db.Integer, db.ForeignKey("user.id"))

    # 关系
    # answer与QuestionModel创建关系，answer表按照发布时间降序排序
    question = db.relationship(QuestionModel, backref=db.backref("answer", order_by=create_time.desc()))
    # 作者
    author = db.relationship(UserModel, backref="answer")
