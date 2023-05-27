# -*- coding: utf-8 -*-
# @Author: XuTianDe
# @Date: 2023-05-21 09:59:24
import csv

import requests
from lxml import etree


def main():
    # 存放数据列表
    student_id_list = []
    student_class_list = []
    name_list = []
    score_list = []
    for page in range(1, 6):  # 爬取五页数据
        url = f'http://127.0.0.1:8000/student/list/?page={page}'
        response = requests.get(url).content.decode('utf-8')
        tree = etree.HTML(response)  # 解析
        tr_list = tree.xpath("/html/body/div/div/table/tbody/tr")
        for i in range(1, len(tr_list) + 1):
            student_id = tree.xpath(f"/html/body/div/div/table/tbody/tr[{i}]/td[1]/text()")[0]  # 学号
            student_id_list.append(student_id)
            student_class = tree.xpath(f'/html/body/div/div/table/tbody/tr[{i}]/td[2]/text()')[0]  # 班级
            student_class_list.append(student_class)
            name = tree.xpath(f'/html/body/div/div/table/tbody/tr[{i}]/td[3]/text()')[0]  # 姓名
            name_list.append(name)
            score = tree.xpath(f'/html/body/div/div/table/tbody/tr[{i}]/td[6]/text()')[0]
            score_list.append(score)

    with open('student_data.csv', 'w', encoding='gb18030', newline="") as f:  # 将每个页面的url地址存储进csv文件中
        filename = ['学号', '班级', '姓名', '成绩']  # 表头
        f_csv = csv.DictWriter(f, fieldnames=filename)  # 插入表头
        f_csv.writeheader()
        try:
            for info in range(0, len(student_id_list)):
                f_csv.writerow(
                    {
                        '学号': student_id_list[info],  # 插入数据
                        '班级': student_class_list[info],
                        '姓名': name_list[info],
                        '成绩': score_list[info]

                    }
                )
        except Exception as e:
            print('文件写入错误！')
