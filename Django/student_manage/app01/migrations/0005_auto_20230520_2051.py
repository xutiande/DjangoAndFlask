# Generated by Django 2.1.5 on 2023-05-20 12:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app01', '0004_auto_20230520_1657'),
    ]

    operations = [
        migrations.AlterField(
            model_name='studentdata',
            name='score',
            field=models.IntegerField(verbose_name='Python Web成绩'),
        ),
    ]
