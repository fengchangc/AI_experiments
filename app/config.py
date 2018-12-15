#coding: utf-8
from app.config_default import Config as DefaultConfig

class Config(DefaultConfig):
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:root@localhost/beibq?charset=utf8'

