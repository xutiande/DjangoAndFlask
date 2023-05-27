# -*- coding: utf-8 -*-
# @Author: XuTianDe
# @Date: 2023-05-20 17:54:41
from django import forms
from django.core.validators import RegexValidator

from . import models

from django.core.exceptions import ValidationError
from app01.utils.bootstarp import BootStrapModelForm, LoginBootStrapModelForm
from .utils.encrypt import md5


class TeacherModelForm(BootStrapModelForm):
    name = forms.CharField(min_length=2, max_length=5, label='姓名')
    subjects = forms.CharField(max_length=16, label='科目')

    class Meta:
        model = models.TeacherData
        fields = ['name', 'subjects']


# 学生表单类验证
class StudentModelForm(BootStrapModelForm):
    # 验证
    student_id = forms.CharField(label='学号',
                                 validators=[RegexValidator(r'^202151020900[0-9]+$', '学号以202151020900开头！')])
    score = forms.CharField(label='分数', validators=[RegexValidator(r'^([0-9]|[0-9]\d|100)$', '请输入100以内的数！')])

    class Meta:
        model = models.StudentData
        fields = '__all__'


# 学生表单类验证
class StudentEditModelForm(BootStrapModelForm):
    # 验证
    student_id = forms.CharField(label='学号',
                                 validators=[RegexValidator(r'^202151020900[0-9]+$', '学号以202151020900开头！')])
    score = forms.CharField(label='分数', validators=[RegexValidator(r'^([0-9]|[0-9]\d|100)$', '请输入100以内的数！')])

    class Meta:
        model = models.StudentData
        fields = '__all__'

    # 钩子函数判断手机号是否存在
    def clean_student_id(self):
        # 当前编辑的ID，pk=primary_key  主键
        now_id = self.instance.pk
        print(now_id)
        txt_mobile = self.cleaned_data['student_id']
        # exclude为排除这个id，后面接着是查找除了这个id以外的所有手机号
        exits = models.StudentData.objects.exclude(id=now_id).filter(student_id=txt_mobile).exists()
        if exits:
            raise ValidationError('该学号已存在!')
        return txt_mobile


# 注册
class RegisteredModelForm(LoginBootStrapModelForm):
    confirm_password = forms.CharField(label='确认密码', max_length=64, validators=[RegexValidator(r'^[a-zA-Z0-9]+$','用户名格式错误！')])  # 确认密码
    code = forms.CharField(label='验证码', max_length=6)

    class Meta:
        model = models.Registered
        fields = "__all__"

    # 钩子函数,返回加密后的密码,第一个输入的密码
    def clean_password(self):
        password = self.cleaned_data.get('password')
        return md5(password)

    # 第二个输入密码判断是否一致
    def clean_confirm_password(self):
        password = self.cleaned_data.get('password')
        confirm_password = md5(self.cleaned_data.get('confirm_password'))  # 加密后的第二次输入的密码
        if confirm_password != password:
            raise ValidationError("两次密码不一致")
        return confirm_password


# 登录功能


class LoginModelForm(LoginBootStrapModelForm):
    code = forms.CharField(label='验证码', max_length=6)

    class Meta:
        model = models.Login
        fields = "__all__"

    # 钩子函数,返回加密后的密码
    def clean_password(self):
        password = self.cleaned_data.get('password')
        return md5(password)
