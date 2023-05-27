# 装饰器
#不登陆情况下不能发布文章
from functools import wraps
from flask import g,redirect,url_for


def login_required(func):
    # 保留func信息
    @wraps(func)
    def inner(*args,**kwargs):          #万能参数（1，2，3）=1，2=*args.3=**kwargs
        if g.user:
            return func(*args,**kwargs)
        else:
            return redirect(url_for('auth.login'))
    return inner

# 引用例子
# @login_required
# def public_question(question_id):
#     pass