from wtforms.validators import Email, Length, EqualTo, InputRequired
import wtforms
from models import UserModel, EmailCaptchaModels


# Email依赖于email_validator包


class RegisterForm(wtforms.Form):
    email = wtforms.StringField(validators=[Email(message="邮箱格式错误!")])
    captcha = wtforms.StringField(validators=[Length(min=4, max=4, message="验证码格式错误!")])
    username = wtforms.StringField(validators=[Length(min=6, max=20, message="用户名密码错误!")])
    password = wtforms.StringField(validators=[Length(min=6, max=20, message="密码格式错误！")])
    password_confirm = wtforms.StringField(validators=[EqualTo("password", message="密码要保持一致！")])

    # 自定义验证
    # 1，验证邮箱是否已经被注册

    def validate_email(self, filed):
        email = filed.data
        user = UserModel.query.filter_by(email=email).first()
        if user:
            raise wtforms.ValidationError(message="该邮箱已经被注册!")


    # 2，验证码是否正确
    def validata_captcha(self, filed):
        captcha = filed.data
        email = self.email.data
        captcha_model = EmailCaptchaModels.query.filter_by(email=email, captcha=captcha).first()
        if not captcha_model:
            raise wtforms.ValidationError(message="邮箱或者验证码错误!")



# 登录表单

class loginForm(wtforms.Form):
    email = wtforms.StringField(validators=[Email(message='邮箱格式错误!')])
    password = wtforms.StringField(validators=[Length(min=6, max=20, message="密码格式错误!")])


# 文章验证
class QuestionForm(wtforms.Form):
    title = wtforms.StringField(validators=[Length(min=3, max=100, message="标题格式错误!")])
    content = wtforms.StringField(validators=[Length(min=3, message="内容格式错误!")])


# 评论验证
class AnswerForm(wtforms.Form):
    content = wtforms.StringField(validators=[Length(min=3, message="内容格式错误!")])
    question_id = wtforms.IntegerField(validators=[InputRequired(message='必须要传入id!')])
