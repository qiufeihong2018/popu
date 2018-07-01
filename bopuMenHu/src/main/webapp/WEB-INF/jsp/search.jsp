<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
  Created by IntelliJ IDEA.
  User: shiku
  Date: 2018/6/6
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>私信界面</title>

<!-- Bootstrap -->

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<!-- <link href="css/style.css?v=4.1.0" rel="stylesheet"> -->




</head>

<!--背景色-->

<body class="gray-bg">

	<!-- 引入header.jsp -->
	<jsp:include page="header.jsp" flush="true"></jsp:include>
	<!--中间内容-->
	<!--邮件-->
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>邮件</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i> <a
								class="close-link"> <i class="fa fa-times"></i>
							</a>
							</a>
						</div>
					</div>
					<div class="ibox-content">

						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>用户名</th>
									<th>邮件</th>
									<th>时间</th>
								</tr>
							</thead>
							<tbody id="content">
							<%-- 	<tr>
									<td>1</td>
									<td><a href="${pageContext.request.contextPath}/chat">张三</a></td>
									<td>未读</td>
									<td>2018/5/30</td>
								</tr>
								<tr>
									<td>2</td>
									<td><a href="${pageContext.request.contextPath}/chat">李四</a></td>
									<td>未读</td>
									<td>2018/5/30</td>
								</tr>
								<tr>
									<td>3</td>
									<td><a href="${pageContext.request.contextPath}/chat">王麻子</a></td>
									<td>已读</td>
									<td>2018/5/30</td>
								</tr> --%>
							</tbody>
						</table>

					</div>
				</div>
			</div>
			<!--搜索联系人-->

			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-sm-12">
						<p>联系人</p>
						<input type="text" id="myInput" onkeyup="search(this)"
							placeholder="手机号...">

						<ul id="myUL" hidden="hidden">
						</ul>
						<button id="okbtn" type="button" class="btn btn-default"
							style="background-color:#1572DD;border-color:#1572DD;color: white;width: 100%;">确定</button>


					</div>
				</div>
			</div>

			<%--<!-- 全局js -->
        <script src="js/jquery.min.js?v=2.1.4"></script>
        <script src="js/bootstrap.min.js?v=3.3.6"></script>

        <!-- Peity -->
        <script src="js/plugins/peity/jquery.peity.min.js"></script>

        <!-- 自定义js -->
        <script src="js/content.js?v=1.0.0"></script>

        <!-- iCheck -->
        <script src="js/plugins/iCheck/icheck.min.js"></script>

        <!-- Peity -->
        <script src="js/demo/peity-demo.js"></script>--%>
		</div>
	</div>
</body>

</html>
<style>
/*背景色*/
.gray-bg {
	background-color: #f3f3f4;
}
/*左右固定*/
html, body {
	overflow-x: hidden;
}

/*中间部分*/
.content {
	min-height: calc(100vh - 100px);
}
/*搜索按钮*/
#myInput {
	background-image:
		url('https://static.runoob.com/images/mix/searchicon.png');
	/* 搜索按钮 */
	background-position: 10px 12px;
	/* 定位搜索按钮 */
	background-repeat: no-repeat;
	/* 不重复图片*/
	width: 100%;
	font-size: 16px;
	/* 加大字体 */
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#myUL {
	/* 移除默认的列表样式 */
	list-style-type: none;
	padding: 0;
	margin: 0;
}

#myUL li a {
	border: 1px solid #ddd;
	/* 链接添加边框 */
	margin-top: -1px;
	background-color: #f6f6f6;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	color: black;
	display: block;
}

#myUL li a.header {
	background-color: #e2e2e2;
	cursor: default;
}

/*搜索按钮结束*/
.wrapper-content {
	padding: 20px;
}

.wrapper {
	padding: 0 20px;
}

body {
	font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 13px;
	color: #676a6c;
}

.ibox {
	clear: both;
	margin-bottom: 25px;
	margin-top: 0;
	padding: 0;
}

.ibox-title {
	-moz-border-bottom-colors: none;
	-moz-border-left-colors: none;
	-moz-border-right-colors: none;
	-moz-border-top-colors: none;
	background-color: #ffffff;
	border-color: #e7eaec;
	-webkit-border-image: none;
	-o-border-image: none;
	border-image: none;
	border-style: solid solid none;
	border-width: 4px 0px 0;
	color: inherit;
	margin-bottom: 0;
	padding: 14px 15px 7px;
	min-height: 48px;
}

.ibox-content {
	clear: both;
}

.ibox-content {
	background-color: #ffffff;
	color: inherit;
	padding: 15px 20px 20px 20px;
	border-color: #e7eaec;
	-webkit-border-image: none;
	-o-border-image: none;
	border-image: none;
	border-style: solid solid none;
	border-width: 1px 0px;
}

.ibox-tools {
	display: inline-block;
	float: right;
	margin-top: 0;
	position: relative;
	padding: 0;
}

.ibox-tools a {
	cursor: pointer;
	margin-left: 5px;
	color: #c4c4c4;
}

a {
	cursor: pointer;
}
</style>

<script>



	$(document).ready(function() {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/user/getDistinctUser",
			data : {
				receiver : "${user.name}"
			},
			dataType : "json",
			success : function(data) {
				var text = "";
				$.each(data, function(index, val) {
					var isread = "";
					if (val["readed"] == false) {
						isread = "未读";
					} else {
						isread = "已读";
					}
					text += '<tr><td>' + index + '</td><td>'+'<a href="${pageContext.request.contextPath}/user/chat?id=' + val["uid"] + '">' + val["sender"] + '</a>'+'</td><td>' + isread + '</td><td>' + val["time"] + '</td></tr>';
				});
				$("#content").html(text);
			}
		});
	});

	function search(input) {
		var text = $(input).val();
		if (text == null || text == "") {
			$("#myUL").hide();
			return;
		}
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/user/phoneSearch",
			data : {
				phone : text
			},
			dataType : "json",
			success : function(data) {
				console.log(data);
				var usersHtml = '<li><a class="header">' + text + '</a></li>';
				$.each(data, function(index, val) {
					usersHtml += '<li><a href="${pageContext.request.contextPath}/user/chat?id=' + val["id"] + '">' + val["name"] + '(' + val["phone"] + ')</a></li>';
				});
				$("#myUL").html(usersHtml);
				$("#myUL").show();
			}
		});
	}
</script>
