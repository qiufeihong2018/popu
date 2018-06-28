<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/10
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ArticleList</title>
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>


<body class="gray-bg">
	<!-- 引入header.jsp -->
	<jsp:include page="header.jsp" flush="true"></jsp:include>
	<!--置顶图片-->
	<div class="img-top">
		<c:choose>
			<c:when test="${pageBean.type.size() > 1 || pageBean.type == null}">
            全部文章
        </c:when>
			<c:otherwise>
				<c:if test="${pageBean.type.get(0) == 1}">最近活动</c:if>
				<c:if test="${pageBean.type.get(0) == 2}">实验项目简介及链接</c:if>
				<c:if test="${pageBean.type.get(0) == 3}">业内动态</c:if>
				<c:if test="${pageBean.type.get(0) == 4}">内部通知</c:if>
			</c:otherwise>
		</c:choose>

	</div>

	<div class="row">
		<div class="col-md-1 col-xs-1"></div>

		<div class="col-md-10 col-xs-10">
			<!--列表-->
			<a href="${pageContext.request.contextPath}/article/show?articleId="
				class="list-group-item ">
				<h4>List group item heading</h4>
				<p>...</p>
			</a>
			<c:forEach var="article" items="${pageBean.rows}">
				<a
					href="${pageContext.request.contextPath}/article/show?articleId=${article.id}"
					class="list-group-item ">
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
					<li><a href="javascript:void(0);" onclick="page(1)"
						aria-label="Previous"> <span aria-hidden="true">上一页</span>
					</a></li> &nbsp;&nbsp;&nbsp;&nbsp;
					<li><a href="javascript:void(0);" onclick="page(2)"
						aria-label="Next"> <span aria-hidden="true">下一页</span>
					</a></li>
				</ul>
			</nav>
		</div>

		<div class="col-md-1"></div>

	</div>
</body>
</html>
<style>
/*背景色*/
.gray-bg, .btn-link {
	background-color: #f3f3f4;
}

/*左右固定*/
html, body {
	overflow-x: hidden;
}

.img-top {
	width: 100%;
	height: 60px;
}

.img-top img {
	width: 100%;
	height: 100%;
}

.list-group-item {
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