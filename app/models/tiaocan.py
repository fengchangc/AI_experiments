#coding: utf-8
from app.models.model import *
from sqlalchemy.dialects.mysql import LONGTEXT


PREFIX = "tiaocan"


class Tiaocan(db.Model):
    """ Site table """
    __tablename__ = db.PREFIX + PREFIX
    __table_args__ = {
        "mysql_engine": "InnoDB",
        "mysql_charset": "utf8"
    }
    id = db.Column(db.Integer, primary_key = True, nullable = False)
    learningrate = db.Column(db.Float(188), nullable = False, index = True)


    @staticmethod
    def get(id):
        return Tiaocan.query.filter_by(id=id).first()
