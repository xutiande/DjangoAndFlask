"""student_manage URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from app01 import views

urlpatterns = [
    path('', views.index),
    # 老师
    path('teacher/list/', views.teacher_list),
    path('teacher/add/', views.teacher_add),
    path('teacher/<int:nid>/edit/', views.teacher_edit),
    path('teacher/<int:nid>/delete/', views.teacher_delete),

    # 学生
    path('student/list/', views.student_list),
    path('student/add/', views.student_add),
    path('student/<int:nid>/edit/', views.student_edit),
    path('student/<int:nid>/delete/', views.student_delete),

    # 分数,降序排序
    path('student/sort/jiang/', views.student_score_sort_jiang),
    # 分数,升序排序
    path('student/sort/sheng/', views.student_score_sort_sheng),

    # 爬虫下载
    path('spider/', views.spider_html),
    path('spider/download/', views.run_spider),
    path('spider/data/analyse/', views.data_analyse),
    path('spider/data/chart/', views.data_chart, name='pie_chart'),

    # 登录与注册
    path("registered/", views.Registered),
    path("login/", views.login),
    path("logout/",views.logout),
    # 验证码
    path("image/code/", views.image_code)
]
