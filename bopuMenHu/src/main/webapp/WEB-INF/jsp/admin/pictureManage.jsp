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

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-3.3.7.min.js"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/js/content.js"></script>
</head>
<!--图片上传结束-->
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <!--图片开始-->
        <div class="col-sm-9 animated fadeInRight">
            <div class="row">
               <h3>轮播图:</h3> 
                <hr>
                <div class="col-sm-12">
                    <c:forEach items="${contents}" var="content">
                        <c:if test="${content.categoryId == 2}">
                            <div class="file-box">
                                <div class="file">
                                    <a href="${pageContext.request.contextPath}${content.categoryId == 1 ? content.url: content.pic}">
                                        <span class="corner"></span>
                                        <div class="image">
                                            <img alt="image" class="img-responsive"
                                                 src="${pageContext.request.contextPath}${content.pic}">
                                        </div>
                                        <div class="file-name">
                                                ${content.title}
                                            <br/>
                                                <%--图片--%>
                                            <c:if test="${content.sort > 3}">
                                                <%--前三张图片只有替换，没有删除--%>
                                                <a href="${pageContext.request.contextPath}/content/delPic?sort=${content.sort}">删除</a>&nbsp;|
                                            </c:if>
                                                <%--<a href="${pageContext.request.contextPath}/content/updatePic?sort=${content.sort}">替换</a>--%>
                                            <a href="${pageContext.request.contextPath}/admin/uploadPicture?sort=${content.sort}&category=2">替换</a>
                                            <br/>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
              <%--   <input type="button"
                       onclick="javascript:window.location.href='${pageContext.request.contextPath}/admin/uploadPicture?add=1&sort=${contents.size() - 2}'"
                       value="添加轮播图"> --%>
                       <input type="button" class="btn btn-primary" value="添加轮播图"
												onclick="javascript:window.location.href='${pageContext.request.contextPath}/admin/uploadPicture?add=1&sort=${contents.size() - 2}'" />
                <hr>
                <h3>文章:</h3>
                <hr>
                <div class="col-sm-12">
                    <c:forEach items="${contents}" var="content">
                        <c:if test="${content.categoryId == 1}">
                            <div class="file-box">
                                <div class="file">
                                    <a href="${pageContext.request.contextPath}${content.categoryId == 1 ? content.url: content.pic}">
                                        <span class="corner"></span>
                                        <div class="image">
                                            <img alt="image" class="img-responsive"
                                                 src="${pageContext.request.contextPath}${content.pic}">
                                        </div>
                                        <div class="file-name">
                                                ${content.title}
                                            <br/>
                                                <%-- 文章--%>
                                                <%-- 后台需要参数 图片 文章 序号 --%>
                                                <%--<a href="#{pageContext.request.contextPath}/content/updateArticle?sort=${content.sort}">替换</a>--%>
                                            <a href="${pageContext.request.contextPath}/admin/uploadPicture?sort=${content.sort}&category=1">替换</a>
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