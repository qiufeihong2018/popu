<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/10
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ArticleList</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<style>
    /*背景色*/

    .gray-bg,.btn-link{
        background-color: #f3f3f4;
    }
    /*左右固定*/
    html,body {
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

    .navbar-default .navbar-nav>li>a {
        color: #fff !important;
    }

    .navbar-default .navbar-nav>li>a:focus,
    .navbar-default .navbar-nav>li>a:hover {
        color: #eee !important;
    }


    .img-top{
        width:100%;
        height:60px;
    }

    .img-top img{
        width:100%;
        height:100%;
    }

    .list-group-item{
        position: relative;
        display: block;
        padding: 20px 40px 25px 40px;
        background-color: #FFFFFF;
    }

</style>
<script type="text/javascript">
    function page(a) {
        var currentPage = ${pageBean.currentPage};
        var totalPage = Math.ceil(${pageBean.total / pageBean.pageSize})
        if (a == 1) {
            if (currentPage > 1) {
                window.location.href = "${pageContext.request.contextPath}/article/detailList?currentPage=${pageBean.currentPage - 1}&type=${pageBean.type.size() == 3 ? null : pageBean.type.get(0)}";
            }
        } else {
            if (currentPage < totalPage) {
                window.location.href = "${pageContext.request.contextPath}/article/detailList?currentPage=${pageBean.currentPage + 1}&type=${pageBean.type.size() == 3 ? null : pageBean.type.get(0)}";
            }
        }

    }
</script>
<body class="gray-bg">

<!--导航栏-->
<header class="clearfix"><!-- 头部 -->

    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">

                <a class="navbar-brand" href="主页.html">温州市波普大数据研究所</a>
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

<!--置顶图片-->
<div class="img-top" >

   标题

</div>

<div class="row">
    <div class="col-md-1 col-xs-1"></div>

    <div class="col-md-10 col-xs-10">
        <!--列表-->
        <a href="${pageContext.request.contextPath}/article/show?articleId=" class="list-group-item ">
            <h4>List group item heading</h4>
            <p>...</p>
        </a>
        <c:forEach var="article" items="${pageBean.rows}">
            <a href="${pageContext.request.contextPath}/article/show?articleId=${article.id}" class="list-group-item ">
                <h4>${article.title}</h4>
                <p>${article.time}</p>
            </a>
        </c:forEach>
    </div>
    <div class="col-md-1 col-xs-1"></div>
</div>

<div class="row">
    <div class="col-md-1"></div>

    <div class="col-md-10 col-xs-12 text-center">
        <!--分页-->
        <nav aria-label="navigation">
            <ul class="pagination ">
                <li>
                    <a href="javascript:void(0);" onclick="page(1)" aria-label="Previous">
                        <span aria-hidden="true">上一页</span>
                    </a>
                </li>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <li>
                    <a href="javascript:void(0);" onclick="page(2)" aria-label="Next">
                        <span aria-hidden="true">下一页</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <div class="col-md-1"></div>

</div>
</body>
</html>