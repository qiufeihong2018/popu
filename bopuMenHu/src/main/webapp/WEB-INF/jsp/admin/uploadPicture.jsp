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
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css"
          rel="stylesheet">
    <!--上传图片的css样式-->
    <link
            href="${pageContext.request.contextPath}/css/plugins/dropzone/basic.css"
            rel="stylesheet">
    <link
            href="${pageContext.request.contextPath}/css/plugins/dropzone/dropzone.css"
            rel="stylesheet">

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script
            src="${pageContext.request.contextPath}/js/bootstrap-3.3.7.min.js"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/js/content.js"></script>
    <!-- DROPZONE -->
    <script
            src="${pageContext.request.contextPath}/js/plugins/dropzone/dropzone.js"></script>
</head>
<script>

    $(function () {
        if (!<%="1".equals(request.getParameter("add"))%>) {
            $.post("${pageContext.request.contextPath}/content/showContent",
                {
                    sort: <%=request.getParameter("sort")!=null?request.getParameter("sort"):""%>,
                    category:<%=request.getParameter("category")!=null?request.getParameter("category"):""%>
                }
                , function (data) {
                    var arr = data["obj"]["url"].split("=");
                    setNum(arr[1]);
                    var pic = document.getElementById("pic");
                    pic.innerHTML = "<img src='${pageContext.request.contextPath}" + data["obj"]["pic"] + "'>";
                });
        }
    });

    function setNum(num) {
        var article = document.getElementById("article");
        var articleId = document.getElementById("articleId");
        article.innerText = num;
        articleId.value = num;
    }

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
                    top.location.href = ("${pageContext.request.contextPath}/admin/home");
                });
                this.on("errormultiple", function (files, response) {
                });
            }
        }
    });

    var a = new Array();

    function getValue() {
        $('#myModal').modal('hide')
        var cks = document.getElementsByName("ck");
        for (var i = 0; i < cks.length; i++) {
            if (cks[i].checked == true) {
                a.push(cks[i].value);
                break;
            }
        }
        setNum(a[0]);
        a.pop();
    }

    var page = 1;
    var totalPage = 0;

    function prePage() {
        if (page <= 1) {
            return;
        } else {
            page -= 1;
            getList();
        }

        if (page <= 1) {
            $("#pre").attr("class", "btn btn-default");
        } else {
            $("#pre").attr("class", "btn btn-primary");
        }

        if (page >= totalPage) {
            $("#next").attr("class", "btn btn-default");
        } else {
            $("#next").attr("class", "btn btn-primary");
        }

    }

    function nextPage() {
        if (page >= totalPage) {
            return;
        } else {
            page += 1;
            getList();
        }
        if (page >= totalPage) {
            $("#next").attr("class", "btn btn-default");
        } else {
            $("#next").attr("class", "btn btn-primary");
        }

        if (page <= 1) {
            $("#pre").attr("class", "btn btn-default");
        } else {
            $("#pre").attr("class", "btn btn-primary");
        }
    }

    function getList() {
        $.post("${pageContext.request.contextPath}/article/getlist",
            {currentPage: page}
            , function (data) {
                var text = "";
                $.each(data["obj"]["rows"], function (index, val) {
                    text += '<tr>' +
                        '                        <td><input name="ck" value="' + val["id"] + '" type="checkbox"/></td>' +
                        '                        <td>' + val["title"] + '</td>' +
                        '                    </tr>';
                });
                $("#list-table").html(text);
                totalPage = data["obj"]["totalPage"];
            });
    }
</script>
<!--图片上传结束-->
<body class="gray-bg">

<div class="wrapper wrapper-content" style="margin-left:7px">
    <div>
        <h1><%="1".equals(request.getParameter("category")) ? "文章" : "图片"%>
        </h1>
    </div>
    <div></div>
    <br>
    <h3>
        您选择的文章id 是: <span id="article"></span>
    </h3>
    <br>
    <%
        if ("1".equals(request.getParameter("add"))) {
            out.print("        <div class=\"col-xs-6  col-sm-6 col-md-6 col-lg-6\">\n" +
                    "            <button class=\"btn btn-primary btn-sm\" data-toggle=\"modal\" data-target=\"#myModal\" onclick=\"getList()\">选择文章\n" +
                    "            </button>\n" +
                    "        </div>    <br> <br> <br>\n");
        } else {
            out.print("");
        }
    %>
    <h3>请上传jpg格式的图片</h3>
    <br>
    <div id="pic"></div>
    <div class="row">
        <!--图片上传开始-->
        <div class="wrapper wrapper-content animated fadeIn">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>图片上传</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link"> <i class="fa fa-chevron-up"></i>
                                </a> <a class="close-link"> <i class="fa fa-times"></i>
                            </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <form id="my-awesome-dropzone" class="dropzone"
                                  action="${pageContext.request.contextPath}<%="1".equals(request.getParameter("add"))?"/content/uploadPic":"/content/updatePic"%>">
                                <input type="hidden" name="category"
                                       value="<%=request.getParameter("category")!=null?request.getParameter("category"):""%>">
                                <input type="hidden" name="sort"
                                       value="<%=request.getParameter("sort")!=null?request.getParameter("sort"):""%>">
                                <input type="hidden" name="articleId" id="articleId">
                                <div class="row">
                                    <button type="submit" class="btn btn-primary pull-right btn-sm">
                                        上传
                                    </button>
                                    <center><h1 style="margin-top: 100px;">点击上传图片</h1></center>
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
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="myModalLabel">文章列表</h4>
            </div>
            <div class="modal-body">
                <table id="list-table">
                </table>
            </div>
            <div class="modal-footer">
                <button id="pre" type="button" class="btn btn-default"
                        onclick="prePage()">上一页
                </button>
                <button id="next" type="button" class="btn btn-primary"
                        onclick="nextPage()">下一页
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="getValue()">选定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>

<script>
    $(document).ready(function () {
        $('.file-box').each(function () {
            animationHover(this, 'pulse');
        });
    });
</script>

<script type="text/javascript"
        src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<!--统计代码，可删除-->

</body>

</html>
<style>
    .dropzone .dz-default.dz-message {
        margin-top: 3.5px;
    }

    img {
        vertical-align: middle;
        height: 400px;
        width: 600px;
    }

    @media screen and ( max-width: 500px) {
        img {
            vertical-align: middle;
            height: 200px;
            width: 273px;
        }
    }

    .dropzone .dz-default.dz-message {
        opacity: 1;
        -ms-filter: none;
        filter: none;
        -webkit-transition: opacity 0.3s ease-in-out;
        -moz-transition: opacity 0.3s ease-in-out;
        -o-transition: opacity 0.3s ease-in-out;
        -ms-transition: opacity 0.3s ease-in-out;
        transition: opacity 0.3s ease-in-out;
        background-image: none;
        background-repeat: no-repeat;
        background-position: 0 0;
        position: absolute;
        width: 446px;
        height: 141px;
        margin-left: -214px;
        margin-top: -61.5px;
        top: 50%;
        left: 50%;
    }
</style>