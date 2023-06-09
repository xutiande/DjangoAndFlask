from flask import Flask,session,g           #g=globas
import config
from exts import db,mail
from models import UserModel
from blueprints.auth import bp as auth_bp
from blueprints.qa import bp as qa_bp
from blueprints.my import bp as my_bp
from flask_migrate import Migrate           #映射到数据库：1、导入包


app = Flask(__name__)
migrate=Migrate(app,db)         #(flask对象实例，flask_sqlalchemy数据库实例)      创建数据库迁移工具对象

# 绑定配置文件
app.config.from_object(config)

#初始化对象
db.init_app(app)        #（先创建exts中的db对象，后再绑定），，db配置app绑定的数据库
mail.init_app(app)


#绑定蓝图
app.register_blueprint(auth_bp)
app.register_blueprint(qa_bp)
app.register_blueprint(my_bp)
# 钩子函数
#before_request/before_first_request/after_request
@app.before_request
def my_before_request():
    user_id=session.get("user_id")
    if user_id:
        user=UserModel.query.get(user_id)
        setattr(g,"user",user)          #给user设置全局属性，属性值为user
    else:
        setattr(g,'user',None)          #没有则默认值为空

# 上下文
@app.context_processor
def my_context_processor():
    return {'user':g.user}



if __name__ == '__main__':
    app.run(debug=True)
