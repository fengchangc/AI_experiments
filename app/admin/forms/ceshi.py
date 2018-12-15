#coding: utf-8
from flask_wtf import Form
from wtforms import StringField
from wtforms.validators import DataRequired, Length


class CeshiForm(Form):
    imgname = StringField("图片名称")
    imgpath = StringField("图片路径")

class TiaocanForm(Form):
    learningrate = StringField("学习率")
