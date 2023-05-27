from django.db import models


# Create your models here.

# 老师信息
class TeacherData(models.Model):
    name = models.CharField(verbose_name='姓名', max_length=8, unique=True)  # 老师信息
    subjects = models.CharField(verbose_name='科目', max_length=16)  # 教的科目

    # 魔术方法
    def __str__(self):
        return self.name


# 存放学生信息
class StudentData(models.Model):
    """学生信息表"""

    student_id = models.CharField(verbose_name='学号', max_length=32)  # 最大值为32
    student_class = models.CharField(verbose_name='班级', max_length=8)  # 班级
    name = models.CharField(verbose_name='姓名', max_length=8)  # 姓名
    age = models.IntegerField(verbose_name='年龄')  # 年龄
    gender_choices = (
        (0, '男'),
        (1, '女')
    )
    gender = models.SmallIntegerField(verbose_name='性别', choices=gender_choices)  # 性别
    score = models.IntegerField(verbose_name='Python Web成绩')  # 分数
    teacher = models.ForeignKey(verbose_name='任课老师', to='TeacherData', to_field='id',
                                on_delete=models.CASCADE)  # 添加外键:老师

# 登录
class Login(models.Model):
    username=models.CharField(verbose_name='用户名',max_length=32)
    password=models.CharField(verbose_name='密码',max_length=64)


# 注册
class Registered(models.Model):
    username=models.CharField(verbose_name='用户名',max_length=32)
    password=models.CharField(verbose_name='密码',max_length=64)