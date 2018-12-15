#coding: utf-8
from flask import current_app, render_template, request, redirect, url_for, flash, abort, make_response, jsonify
from flask_login import login_required
from app.admin import admin
from app.admin.forms.user import *
from app.models.user import *
from app.models.ceshi import *
from app.models.tiaocan import *

from werkzeug.utils import secure_filename
import os
import json
import time
import codecs
from app.experiment.experiment1 import *
from app.admin.forms.ceshi import *

from datetime import timedelta

# 设置允许的文件格式
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'JPG', 'PNG', 'bmp'])


@admin.route("/ceshi", methods=["GET", "POST"])
@login_required
def ceshi():
    page = request.args.get("page", 1, type=int)
    per_page = current_app.config["PER_PAGE"]
    users = User.page(page, per_page)
    ceshi = Ceshi.get(1)

    if request.method == 'POST':
        f = request.files['file']

        if not (f and allowed_file(f.filename)):
            return jsonify({"error": 1001, "msg": "请检查上传的图片类型，仅限于png、PNG、jpg、JPG、bmp"})

        fname = f.filename
        ext = fname.rsplit('.', 1)[1]  # 获取文件后缀
        # filename = 'test' + '.' + ext
        unix_time = int(time.time())
        filename = str(unix_time) + '.' + ext  # 修改了上传的文件名

        ceshi = ceshi.get(1)
        ceshi.settingImgname(filename)

        user_input = request.form.get("name")

        basepath = os.path.dirname(__file__)  # 当前文件所在路径

        rootpath = basepath[:-12]

        upload_path = os.path.join(rootpath, 'static/resource/image/image', filename)
        ceshi.settingImgpath(upload_path)
        ceshi.updateByImg(1, filename, upload_path)

        # upload_path = os.path.join(rootpath, 'static/resource/image/image', secure_filename(f.filename))  # 注意：没有的文件夹一定要先创建，不然会提示没有该路径
        # upload_path = os.path.join(basepath, 'static/images','test.jpg')  #注意：没有的文件夹一定要先创建，不然会提示没有该路径
        f.save(upload_path)

        # # 使用Opencv转换一下图片格式和名称
        # img = cv2.imread(upload_path)
        # cv2.imwrite(os.path.join(basepath, 'static/resource/image/image', 'test.jpg'), img)

        return render_template('admin/ceshi/index.html', user=users, ceshi=ceshi, userinput=user_input)

    return  render_template("admin/ceshi/index.html", user=users, ceshi=ceshi)

@admin.route("/tiaocan", methods=["GET", "POST"])
@login_required
def tiaocan():
    page = request.args.get("page", 1, type=int)
    per_page = current_app.config["PER_PAGE"]
    users = User.page(page, per_page)
    ceshi = Ceshi.get(1)

    form = TiaocanForm()

    if request.method == 'POST':
        if form.validate_on_submit():
            ceshi.settingLearningrate(form.learningrate.data)
            ceshi.updateByLearningrate(1, form.learningrate.data)
            flash("修改成功")
            return redirect(url_for("admin.tiaocan"))

    return  render_template("admin/ceshi/tiaocan.html", user=users, ceshi=ceshi, form=form)



def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1] in ALLOWED_EXTENSIONS


# @app.route('/upload', methods=['POST', 'GET'])
@admin.route('/upload', methods=['POST', 'GET'])  # 添加路由
def upload():
    if request.method == 'POST':
        f = request.files['file']

        if not (f and allowed_file(f.filename)):
            return jsonify({"error": 1001, "msg": "请检查上传的图片类型，仅限于png、PNG、jpg、JPG、bmp"})

        fname = f.filename
        ext = fname.rsplit('.', 1)[1]  # 获取文件后缀
        filename = 'test3' + '.' + ext
        # unix_time = int(time.time())
        # filename = str(unix_time) + '.' + ext  # 修改了上传的文件名

        user_input = request.form.get("name")

        basepath = os.path.dirname(__file__)  # 当前文件所在路径

        rootpath = basepath[:-12]

        upload_path = os.path.join(rootpath, 'static/resource/image/image', filename)

        print(upload_path)


        with codecs.open(upload_path, 'a', 'utf-8') as ff:
            if(os.path.exists(upload_path)):
                os.remove(upload_path)


        f.save(upload_path)

        # # 使用Opencv转换一下图片格式和名称
        # img = cv2.imread(upload_path)
        # cv2.imwrite(os.path.join(basepath, 'static/resource/image/image', 'test.jpg'), img)

        return render_template('admin/ceshi/upload_ok.html', userinput=user_input)

    return render_template('admin/ceshi/upload.html')


@admin.route('/uploadOK', methods=['POST', 'GET'])
def uploadOK():
    return render_template('admin/ceshi/upload_ok.html')

@admin.route('/test', methods=['POST', 'GET'])
def test():
    page = request.args.get("page", 1, type=int)
    per_page = current_app.config["PER_PAGE"]
    users = User.page(page, per_page)
    ceshi = Ceshi.get(1)
    flash("开始测试")
    result = exp1test(ceshi.imgpath)
    ceshi.settingResult(result)
    ceshi.updateByResult(1, result)
    if(result is not None):
        flash("测试完成")
        return render_template("admin/ceshi/index.html", user=users, ceshi=ceshi)

    return render_template("admin/ceshi/index.html", user=users, ceshi=ceshi)



