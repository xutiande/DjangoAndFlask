# Generated by Django 2.1.5 on 2023-05-20 08:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app01', '0003_auto_20230520_1645'),
    ]

    operations = [
        migrations.AlterField(
            model_name='studentdata',
            name='student_id',
            field=models.CharField(max_length=32, verbose_name='学号'),
        ),
    ]