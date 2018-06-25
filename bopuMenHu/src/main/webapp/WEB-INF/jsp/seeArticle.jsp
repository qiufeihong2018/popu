<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Exler
  Date: 2018/6/5
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ArticleView</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-3.3.7.min.js"></script>
</head>
<style>
    /*中间部分*/
    .row {
        display: flex;
        /*使子项目水平居中*/
        justify-content: center;
    }

    /*背景色*/

    .gray-bg,
    .btn-link {
        background-color: #f3f3f4;
    }

    /*左右固定*/

    html,
    body {
        overflow-x: hidden;
    }

    /*头部样式*/

    header .navbar-default {
        background-color: #1572DD;
    }

    header .navbar-brand {
        color: #fff !important;
    }

    .navbar-default .navbar-toggle .icon-bar {
        background-color: #fff !important;
    }

    .navbar-default .navbar-nav > li > a {
        color: #fff !important;
    }

    .navbar-default .navbar-nav > li > a:focus,
    .navbar-default .navbar-nav > li > a:hover {
        color: #eee !important;
    }

    .img-top {
        width: 100%;
        height: 60px;
    }

    .img-top img {
        width: 100%;
        height: 100%;
    }

    .content {
        background-color: #FFFFFF;
        margin-bottom: 30px;

    }

    .detail {
        padding: 10px 40px 30px 40px;
    }

    .text {
        padding: 10px 20px 10px 20px;
    }

    .newbtn {
        padding: 10px;
        color: #FFFFFF;
        background-color: orangered;
        border-radius: 10px;
        border: none;
        margin-left: 30px;
    }

    /*评论*/
    /* Social feed */

    .social-feed-separated .social-feed-box {
        margin-left: 62px;
    }

    .social-feed-separated .social-avatar {
        float: left;
        padding: 0;
    }

    .social-feed-separated .social-avatar img {
        width: 52px;
        height: 52px;
        border: 1px solid #e7eaec;
    }

    .social-feed-separated .social-feed-box .social-avatar {
        padding: 15px 15px 0 15px;
        float: none;
    }

    .social-feed-box {
        /*padding: 15px;*/
        border: 1px solid #e7eaec;
        background: #fff;
        margin-bottom: 15px;
    }

    .article .social-feed-box {
        margin-bottom: 0;
        border-bottom: none;
    }

    .article .social-feed-box:last-child {
        margin-bottom: 0;
        border-bottom: 1px solid #e7eaec;
    }

    .article .social-feed-box p {
        font-size: 13px;
        line-height: 18px;
    }

    .social-avatar {
        padding: 15px 15px 0 15px;
    }

    .social-comment .social-comment {
        margin-left: 45px;
    }

    .social-avatar img {
        height: 40px;
        width: 40px;
        margin-right: 10px;
    }

    .social-avatar .media-body a {
        font-size: 14px;
        display: block;
    }

    .social-feed-separated .social-avatar {
        float: left;
        padding: 0;
    }

    .social-feed-separated .social-avatar img {
        width: 52px;
        height: 52px;
        border: 1px solid #e7eaec;
    }

    .social-feed-separated .social-feed-box .social-avatar {
        padding: 15px 15px 0 15px;
        float: none;
    }

    img {
        width: 100%;
    }
</style>
<script type="text/javascript">


    $(document).ready(function () {
        $.post("${pageContext.request.contextPath}/comment/list", {
            id:"${article.id}",
            currentPage: 1
        }, function (data) {
            var text='';
            console.log(data);
            $.each(data["obj"], function (index, val) {
            
            // 每次5条
            text += '<div class="social-feed-box">' +
                '                        <div class="social-avatar">' +
                '                            <a href="" class="pull-left">' +
                '                                <img alt="image" src="'+val["user"]["pic"]+'">' +
                '                            </a>' +
                '                            <div class="media-body">' +
                '                                <a href="#">' +
                '                                    '+val["user"]["name"]+'' +
                '                                </a>' +
                '                                <small class="text-muted"></small>' +
                '                            </div>' +
                '                        </div>' +
                '                        <div class="social-body">' +
                '                            <p>' +
                '                                '+val["comment"]["content"]+'' +
                '                            </p>' +
                '                        </div>' +
                '                    </div>';
            });
            $("#commentDiv").append(text);
        });
    });
    <c:if test="user!=null">
    function publish() {
        // alert();
        var content = $("#content").val();
        $.post("${pageContext.request.contextPath}/comment/publish", {
            articleid: ${article.id},
            userid: ${user.id},
            content: content
        }, function (result) {
            if (result["status"] == 200) {
                alert("success");
            } else {
                // 提交失败
            }
        });
    }
    </c:if>
</script>
<body class="gray-bg">
<!--导航栏-->
<header class="clearfix">
    <!-- 头部 -->

    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index">温州市波普大数据研究所</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#example-navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                <ul class="nav navbar-nav navbar-right">

                    <li>
                        <a href="私信界面.html">私信</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="个人中心.html">个人中心</a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
</header>

<div class="row">


    <!--主体-->
    <div class="col-md-11 col-xs-11">

        <!--文章内容-->
        <div class="content">
            <div class="detail">
                <h1>${article.title}</h1>
                <span style="background-color: rgb(255, 255, 255); color: rgb(119, 119, 119); font-size: 16px;float: right;margin-top: 15px">${article.type==2 ? '': article.author}</span>
            </div>
            <hr>
            <div class="detail">
                <h6><c:if test="${article.type == 2}">项目成员有: ${article.author}<br>项目地址:
                    <a href="${article.look}">${article.look}</a></c:if></h6>
                <h4>
                    内容填充
                    ${article.content}
                </h4>
            </div>
            <span style="background-color: rgb(255, 255, 255); color: rgb(119, 119, 119); font-size: 16px;float: right;margin-right: 20px;margin-bottom: 15px">${article.time}</span>
            <br>
            <hr>
            <%-- 分页 内容相似文章推荐 --%>
            <div class="text-center text">

            </div>
            <hr>
            <!--附加内容-->
            <div class="text-center text">
                <c:if test="${user != null}">
                <c:choose>
                <c:when test="${article.flag == 1}">
                <form role="form">
                    <div class="form-group">

                        <textarea class="form-control" rows="3" id="content"></textarea>
                    </div>
                </form>
                <div class="text-center">
                    <h4>想对作者说什么？
                        <button class="newbtn" onclick="publish()">评论</button>
                    </h4>
                </div>
            </div>
            <hr>
            <div class="row">
                <div id="commentDiv" class="col-lg-12">

                    <h2>评论：</h2>
                    <div class="social-feed-box">
                        <div class="social-avatar">

                            <a href="" class="pull-left">
                                <img alt="image" src="img/a1.jpg">
                            </a>

                            <div class="media-body">
                                <a href="#">
                                    逆光狂胜蔡舞娘
                                </a>
                                <small class="text-muted">17 小时前</small>
                            </div>
                        </div>
                        <div class="social-body">
                            <p>
                                好东西，我朝淘宝准备跟进，1折开卖
                            </p>
                        </div>
                    </div>

                    <div class="social-feed-box">
                        <div class="social-avatar">
                            <a href="" class="pull-left">
                                <img alt="image" src="img/a3.jpg">
                            </a>
                            <div class="media-body">
                                <a href="#">
                                    kamppi
                                </a>
                                <small class="text-muted"> 6 小时前</small>
                            </div>
                        </div>
                        <div class="social-body">
                            <p>
                                好美的装置艺术，第二个让我想起了海中缓缓游动的鲸鱼。
                            </p>
                        </div>
                    </div>
                </div>
                </c:when>
                <c:otherwise>
                    <h4>此文章无评论权限</h4>
                    <hr>
                </c:otherwise>
                </c:choose>
                </c:if>
            </div>
        </div>
    </div>


</div>

</body>

</html>