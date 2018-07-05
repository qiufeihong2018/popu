<%--
  Created by IntelliJ IDEA.
  User: Exler
  Date: 2018/6/5
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<link rel="shortcut icon" href="favicon.ico">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">

</head>

<body class="fixed-sidebar full-height-layout gray-bg"
	style="overflow:hidden">
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<span><img alt="image" class="img-circle"
								src="../img/1.jpg" style="height:50px;width:50px" /></span> <a
								data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
								class="clear"> <span class="block m-t-xs"><strong
										class="font-bold">Beaut-zihan</strong></span> <span
									class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
							</span>
							</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li><a href="${pageContext.request.contentType}/bopuMenHu/index">安全退出</a></li>
							</ul>
						</div>
						<div class="logo-element">BoPu</div>
					</li>

					<li><a class="J_menuItem"
						href="${pageContext.request.contextPath}/content/managerPA"><i
							class="fa fa-map"></i><span class="nav-label">轮播图管理</span></a></li>
					<li><a class="J_menuItem"
						href="${pageContext.request.contextPath}/admin/uploadArticle"><i
							class="fa fa-recycle"></i><span class="nav-label">文章发布</span></a></li>

					<li><a class="J_menuItem"
						href="${pageContext.request.contextPath}/article/list"><i
							class="fa fa-file-text-o"></i><span class="nav-label">文章管理</span></a>
					</li>
					<li><a class="J_menuItem"
						href="${pageContext.request.contextPath}/admin/aboutOur"><i
							class="fa fa-columns"></i><span class="nav-label">关于我们管理</span></a></li>
					<li><a class="J_menuItem"
						   href="${pageContext.request.contextPath}/admin/emailChange"><i
							class="fa fa-columns"></i><span class="nav-label">邮箱管理</span></a></li>

				</ul>
			</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="#"><i class="fa fa-bars"></i> </a>
						<form role="search" class="navbar-form-custom" method="post"
							action="search_results.html">
							<div class="form-group">
							</div>
						</form>
					</div>
				</nav>
			</div>
			<div class="row content-tabs">
				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content"></div>
				</nav>
				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">
						关闭操作<span class="caret"></span>

					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive"><a>定位当前选项卡</a></li>
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
					</ul>
				</div>
				<a href="${pageContext.request.contextPath}/index" class="roll-nav roll-right J_tabExit"><i
					class="fa fa fa-sign-out"></i> 退出</a>
			</div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" id="iframe" name="iframe0" width="100%" height="100%"
					src="${pageContext.request.contextPath}/content/managerPA" frameborder="0" data-id="\波普3\轮播图管理.html"
					seamless></iframe>
			</div>

		</div>
		<!--右侧部分结束-->

	</div>

	<!-- 全局js -->
	<script type="text/javascript">

            function ifrmLoaded(obj) {
                obj.childFunction();
            }
	</script>
	<script
		src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap-3.3.7.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/plugins/layer/layer.min.js"></script>

	<!-- 自定义js -->
	<script src="${pageContext.request.contextPath}/js/hplus.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/contabs.js"></script>

	<!-- 第三方插件 -->
	<script
		src="${pageContext.request.contextPath}/js/plugins/pace/pace.min.js"></script>

</body>

</html>