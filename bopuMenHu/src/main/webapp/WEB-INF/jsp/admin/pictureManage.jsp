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
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script
            src="${pageContext.request.contextPath}/js/bootstrap-3.3.7.min.js"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/js/content.js"></script>
</head>
<!--图片上传结束-->
<body class="gray-bg">
<div class="wrapper wrapper-content" style="margin-left:37px">
    <div class="row">
        <!--图片开始-->
        <div class="col-sm-9 animated fadeInRight">
            <div class="row">
                <h1>轮播图:</h1>
                <hr>
                <div class="col-sm-12">
                    <c:forEach items="${contents}" var="content">
                        <c:if test="${content.categoryId == 2}">
                            <div class="file-box">
                                <div class="file">
                                    <a
                                            href="${pageContext.request.contextPath}${content.categoryId == 1 ? content.url: content.pic}">
                                        <span class="corner"></span>
                                        <div class="image">
                                            <img alt="image" class="img-responsive"
                                                 src="${pageContext.request.contextPath}${content.pic}">
                                        </div>
                                        <div class="file-name">
                                                ${content.title} <br/>
                                                <%--图片--%>
                                            <c:if test="${content.sort > 3}">
                                                <%--前三张图片只有替换，没有删除--%>
                                                <a onclick="del()"
                                                   href="${pageContext.request.contextPath}/content/delPic?sort=${content.sort}">删除</a>&nbsp;|
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/admin/uploadPicture?sort=${content.sort}&category=2">替换图片</a><br>
                                            选择的文章id为${content.url.split("=")[1]}
                                            <a onclick="$('#myModal').modal('show');getList(${content.id})">修改文章</a>
                                            <br/>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <br>
                <%--   <input type="button"
                     onclick="javascript:window.location.href='${pageContext.request.contextPath}/admin/uploadPicture?add=1&sort=${contents.size() - 2}'"
                     value="添加轮播图"> --%>
                <input type="button" class="btn btn-primary btn-sm" value="添加轮播图"
                       onclick="javascript:window.location.href='${pageContext.request.contextPath}/admin/uploadPicture?add=1&category=2&sort=${contents.size() - 2}'"/>
                <hr>
                <h1>文章:</h1>
                <hr>
                <div class="col-sm-12">
                    <c:forEach items="${contents}" var="content">
                        <c:if test="${content.categoryId == 1}">
                            <div class="file-box">
                                <div class="file">
                                    <a
                                            href="${pageContext.request.contextPath}${content.categoryId == 1 ? content.url: content.pic}">
                                        <span class="corner"></span>
                                        <div class="image">
                                            <img alt="image" class="img-responsive"
                                                 src="${pageContext.request.contextPath}${content.pic}">
                                        </div>
                                        <div class="file-name">
                                                ${content.title} <br/>
                                                <%-- 文章--%>
                                                <%-- 后台需要参数 图片 文章 序号 --%>
                                                <%--<a href="#{pageContext.request.contextPath}/content/updateArticle?sort=${content.sort}">替换</a>--%>
                                            <a href="${pageContext.request.contextPath}/admin/uploadPicture?sort=${content.sort}&category=1">替换图片</a><br>
                                            选择的文章id为${content.url.split("=")[1]}
                                            <a onclick="$('#myModal').modal('show');getList(${content.id})">修改文章</a>
                                            <br/>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="col-sm-3 animated fadeInRight"
             style="background-color:#fff;height: 500px;
margin-top: 20px;margin-left: -45px;">
            <h1>操作说明</h1>

            <div class="file">
                <p>1.前三个轮播图不可删除，只能进行替换操作</p>
                <p><font style="color: #ff0000;">2.图片替换，所需等待时间较久，大致在一分钟内</font></p>
                <p>3.请在文章管理中修改简介</p>
            </div>
            <h4>若重置数据库，请保证content表中category_id=1有三条数据，否则首页图片文章无法显示</h4>

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
                <button type="button" class="btn btn-default"
                        onclick="prePage(this)">上一页
                </button>
                <button type="button" class="btn btn-primary"
                        onclick="nextPage(this)">下一页
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="getValue()">选定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>
<script type="text/javascript">

    $(document).ready(function () {
        $('.file-box').each(function () {
            animationHover(this, 'pulse');
        });
    });

    var a = new Array();
    var id = -1;
    var articleId = -1;

    function getValue(contentId) {
        $('#myModal').modal('hide')
        var cks = document.getElementsByName("ck");
        for (var i = 0; i < cks.length; i++) {
            if (cks[i].checked == true) {
                a.push(cks[i].value);
                break;
            }
        }
        $.post("${pageContext.request.contextPath}/content/updateArt",
            {
                id: id,
                articleId: a[0]
            }
            , function (data) {
                top.location.href = "${pageContext.request.contextPath}/admin/home";
            });
        a.pop();
    }

    var page = 1;
    var totalPage = 0;


    function prePage(obj) {
        if (page <= 1) {
            return;
        } else {
            page -= 1;
            getList();
        }

        if (page <= 1) {
            $(obj).attr("class", "btn btn-default");
        } else {
            $(obj).attr("class", "btn btn-primary");
        }
    }

    function nextPage(obj) {
        if (page >= totalPage) {
            return;
        } else {
            page += 1;
            getList();
        }
        if (page >= totalPage) {
            $(obj).attr("class", "btn btn-default");
        } else {
            $(obj).attr("class", "btn btn-primary");
        }
    }

    function getList(contentId) {
        id = contentId;
        $.post("${pageContext.request.contextPath}/article/getlist",
            {currentPage: page}
            , function (data) {
                var text = '<tr>' +
                    '                        <td>选择</td>' +
                    '<td>文章id</td>' +
                    '                        <td>文章标题</td>' +
                    '                    </tr>';
                $.each(data["obj"]["rows"], function (index, val) {
                    text += '<tr>' +
                        '                        <td><input name="ck" value="' + val["id"] + '" type="checkbox"/></td>' +
                        '<td>' + val["id"] + '</td>' +
                        '                        <td>' + val["title"] + '</td>' +
                        '                    </tr>';
                });
                $("#list-table").html(text);
                totalPage = data["obj"]["totalPage"];
            });
    }

    function del() {
        parent.layer.alert("是否删除");
    }
</script>

<script type="text/javascript"
        src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<!--统计代码，可删除-->
<!-- layui -->

</body>

</html>