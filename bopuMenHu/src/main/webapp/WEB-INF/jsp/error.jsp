<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>简介</title>
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body class="gray-bg">
	<!-- 	<header class="clearfix">
			头部

			<nav class="navbar navbar-default" role="navigation">
				<div class="container-fluid">
					<div class="navbar-header">

						<a class="navbar-brand" href="#">温州市波普大数据研究院</a>
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
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
		</header> -->
	<jsp:include page="header.jsp" flush="true"></jsp:include>
	<br>
	<main class="content">

		<div class="middle-box text-center animated fadeInDown">

			<img src="img/404_2.JPG" /> <br> <br>

			<div class="error-desc">
				我们正在联系最牛的程序员为您搬家，要返回静心等待哟~ <br> <br>
				<div class="form-group">
					<div class="row">
						<div class="col-xs-6  col-sm-6 col-md-6 col-lg-6">
							<input type="button" class="btn btn-success" value="返回首页">
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">

							<!-- 	<a href="#"><input id="btnChuang" type="submit" class="btn btn-success" value="搜索" /></a>	 -->
							<input type="button" class="btn btn-success" value="返回上一级">
						</div>
					</div>


				</div>


			</div>
		</div>

	</main>
	<br>
	
	<footer class="center-block footer">
		<div class="container">
			<div class="row center-block">
				<div class="col-md-6">
					<span>反馈邮箱：12345678@163.com &nbsp; &nbsp;
						&nbsp;联系方式：12345678911</span>
				</div>
				<div class="col-md-6">
					<span>@2018-2020 Wenzhou Demo Worker</span>
				</div>
			</div>
		</div>
	</footer>
</body>

</html>


<!-- 全局js -->
<!--     <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
	<link rel="shortcut icon" href="favicon.ico"> 		  	
	<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet"> -->
<!--     <link href="css/style.css?v=4.1.0" rel="stylesheet">		 -->
<!--图标-->
<link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

<style type="text/css">
/*查看更多*/
#btnChuang {
	color: white;
	background-color: #1572DD;
	height: 34px;
	border-color: #1572DD;
	border-radius: 3px;
}
/*背景色*/
.gray-bg {
	background-color: #f3f3f4;
}
/*左右固定*/
html, body {
	overflow-x: hidden;
}
/*头部样式*/

/* 	header .navbar-default {
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
			 */
.content {
	min-height: calc(100vh - 100px);
}
/*底部栏*/
.footer {
	background-color: #1572DD;
	height: 150px;
	padding: 30px;
	display: flex;
	/*使子项目水平居中*/
	justify-content: center;
	/*使子项目垂直居中*/
	align-items: center;
}

.footer span {
	color: #fff;
	font-size: 16px;
}
/*图片*/
img {
	vertical-align: middle;
	width: 1000px;
}

@media screen and (max-width:320px) {
	img {
		width: 300px;
		vertical-align: middle;
	}
}

.btn-success {
	color: #fff;
	background-color: #1572DD;
	border-color: #1572DD;
}

.btn-success:hover {
	color: #fff;
	background-color: #1572DD;
	border-color: #1572DD;
}
</style>