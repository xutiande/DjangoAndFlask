from flask import Blueprint, render_template
from flask import Flask, render_template


bp = Blueprint('my', __name__, url_prefix='/my')


# 我的页面

@bp.route('/my_question/')
def question():
    return render_template('my.html')



