<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- <head> -->
<style>
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
/* 个人中心样式 */
.navbar-default .navbar-nav>.open>a, .navbar-default .navbar-nav>.open>a:focus,
	.navbar-default .navbar-nav>.open>a:hover {
	color: #555;
	background-color: #1572DD;
}
/* 私信和个人中心点击白色 */
.navbar-default .navbar-nav .open .dropdown-menu>li>a {
	color: #fff;
}
/* 3修改点击白色 */
.navbar-default .navbar-nav .open .dropdown-menu>li>a:focus,
	.navbar-default .navbar-nav .open .dropdown-menu>li>a:hover {
	color: #fff;
	background-color: transparent;
}

/* 大屏下拉蓝色 */
.navbar-nav>li>.dropdown-menu {
	background-color: #1572DD;
}
</style>
</head>


<header class="clearfix">
	<!-- 头部 -->

	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">

				<a class="navbar-brand" href="${pageContext.request.contextPath}/">温州市波普大数据研究院</a>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#example-navbar-collapse">
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="example-navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/introduction">简介</a></li><li class="divider"></li>
					<li><a href="${pageContext.request.contextPath}/article/detailList?type=1">最近活动</a></li><li class="divider"></li>
					<li><a href="${pageContext.request.contextPath}/article/detailList?type=2">研究成果</a></li><li class="divider"></li>
					<li><a href="${pageContext.request.contextPath}/article/detailList?type=3">业内动态</a></li><li class="divider"></li>
					<li><a href="${pageContext.request.contextPath}/contactUs">联系我们</a>
					<c:if test="${sessionScope.user!=null}">
					<li><a href="${pageContext.request.contextPath}/search">私信</a></li>
					<li class="divider"></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">个人中心 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/passwordChange">修改密码</a></li>
							<li><a
								href="${pageContext.request.contextPath}/personChange">修改信息</a></li>
							<li><a href="${pageContext.request.contextPath}/picChange">修改头像</a></li>
						</ul></li>

					</c:if>
				</ul>
			</div>
		</div>
	</nav>
</header>

