# 项目配置文件

#cookie
SECRET_KEY='dasdafoafo;fasfsa'

# 数据库配置
HOSTNAME = '127.0.0.1'
USERNAME = 'root'
PASSWORD = '123456'
DATABASE = 'blog_flask'
PORT = '3306'
DB_URI = 'mysql+pymysql://{}:{}@{}:{}/{}?charset=utf8'.format(USERNAME, PASSWORD, HOSTNAME, PORT, DATABASE)
SQLALCHEMY_DATABASE_URI = DB_URI

# 邮箱配置

MAIL_SERVER = 'smtp.qq.com'
MAIL_USE_SSL = True
MAIL_PORT = 465
MAIL_USERNAME = '2546582616@qq.com'
MAIL_PASSWORD = 'szsvazqcthjreadh'
MAIL_DEFAULT_SENDER = '2546582616@qq.com'
