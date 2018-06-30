<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Exler
  Date: 2018/6/06
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>波普后台轮播图管理</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <!--上传图片的css样式-->
    <link href="${pageContext.request.contextPath}/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/dropzone/dropzone.css" rel="stylesheet">

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-3.3.7.min.js"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/js/content.js"></script>
    <!-- DROPZONE -->
    <script src="${pageContext.request.contextPath}/js/plugins/dropzone/dropzone.js"></script>
</head>
<script>
    $(document).ready(function () {
        Dropzone.options.myAwesomeDropzone = {
            autoProcessQueue: false,
            uploadMultiple: true,
            parallelUploads: 100,
            maxFiles: 100,
            parallelUploads: 1,//一次上传的文件数量
            dictMaxFilesExceeded: "您最多只能上传1个文件！",
            dictResponseError: '文件上传失败!',
            dictRemoveLinks: "删除",
            dictCancelUpload: "取消",
            // Dropzone settings
            init: function () {
                var myDropzone = this;
                this.element.querySelector("button[type=submit]").addEventListener("click", function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    myDropzone.processQueue();
                });
                this.on("sendingmultiple", function () {
                });
                this.on("successmultiple", function (files, response) {
                    // 上传页面成功后刷新页面
                    location.replace("${pageContext.request.contextPath}/admin/home")
                });
                this.on("errormultiple", function (files, response) {
                });
            }
        }
    });
</script>
<!--图片上传结束-->
<body class="gray-bg">
<div class="wrapper wrapper-content">
    请上传jpg格式的图片
    <div class="row">
        <!--图片上传开始-->
        <div class="wrapper wrapper-content animated fadeIn">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>图片上传</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                                <a class="close-link">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <form id="my-awesome-dropzone" class="dropzone"
                                  action="${pageContext.request.contextPath}<%="1".equals(request.getParameter("add"))?"/content/uploadPic":"/content/updatePic"%>">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <label><%="1".equals(request.getParameter("category"))? "文章" : "图片"%>序号:</label>
                                    </div>
                                    <div >
                                        <input type="hidden" name="categoryId" value="<%=request.getParameter("category")%>">
                                        <input type="text" class="form-control" name="sort"
                                               value="<%=request.getParameter("sort")!=null?request.getParameter("sort"):""%>">
                                    </div>
                                    <div>
                                        <input type="button" value="选择文章" onclick="window.open('http;//www.jb51.net')"/>
                                    </div>
                                    <div class="col-xs-4  col-sm-4 col-md-4 col-lg-4">
                                        <button type="submit" class="btn btn-primary pull-right">上传</button>
                                    </div>
                                </div>
                                <div class="dropzone-previews"></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('.file-box').each(function () {
            animationHover(this, 'pulse');
        });
    });
</script>

<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<!--统计代码，可删除-->

</body>

</html>