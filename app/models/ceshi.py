#coding: utf-8
from app.models.model import *
from flask import current_app
from sqlalchemy.dialects.mysql import LONGTEXT


PREFIX = "ceshi"


class Ceshi(db.Model):
    """ Site table """
    __tablename__ = db.PREFIX + PREFIX
    __table_args__ = {
        "mysql_engine": "InnoDB",
        "mysql_charset": "utf8"
    }
    id = db.Column(db.Integer, primary_key = True, nullable = False)
    imgname = db.Column(db.String(255), nullable = False, index = True)
    imgpath = db.Column(db.String(255), nullable = False, index = True)
    result = db.Column(db.String(255), nullable = False, index = True)
    learningrate = db.Column(db.String(255), nullable=False, index=True)

    @staticmethod
    def get(id):
        return Ceshi.query.filter_by(id=id).first()

    @staticmethod
    def getbyimgname(imgname):
        return Ceshi.query.filter_by(imgname=imgname).first()

    @staticmethod
    def getByImgpath(imgpath):
        return Ceshi.query.filter_by(imgpath=imgpath).first()

    @staticmethod
    def getResult(id):
        return Ceshi.query.filter_by(id=id).options(db.undefer("result")).first()

    def getImage(self):
        image_path = current_app.config["IMAGE_PATH"]
        return "/".join([image_path, self.imgname])

    def settingImgname(self, imgname):
        self.imgname = imgname

    def settingImgpath(self, imgpath):
        self.imgpath = imgpath

    def settingResult(self, result):
        self.result = result

    def settingLearningrate(self, learningrate):
        self.learningrate = learningrate

    @staticmethod
    def updateByImg(id, imgName, imgPath):
        ceshi = Ceshi.query.filter_by(id=id).first()
        if ceshi is not None:
            return
        ceshi.imgName = imgName
        ceshi.imgPath = imgPath
        db.session.commit()
        return ceshi

    @staticmethod
    def updateByResult(id, result):
        ceshi = Ceshi.query.filter_by(id=id).first()
        if ceshi is not None:
            return
        ceshi.result = result
        db.session.commit()
        return ceshi

    @staticmethod
    def updateByLearningrate(id, learningrate):
        ceshi = Ceshi.query.filter_by(id=id).first()
        if ceshi is not None:
            return
        ceshi.learningrate = learningrate
        db.session.commit()
        return ceshi