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
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="shortcut icon" href="favicon.ico">

		<link href="${pageContext.request.contextPath}/css/font-awesome.css?v=4.4.0" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/style.css?v=4.1.0" rel="stylesheet">
		<meta charset="UTF-8">
	</head>

	<body class="gray-bg">

		<div class="wrapper wrapper-content">
			<div class="row">
				<div class="col-sm-12" > 
					<div class="ibox float-e-margins">
						<div class="ibox-content">
							<div class="file-manager">
								<p>邮箱：<input id="in1" type="text"  class="form-control" /></p>
								<p>电话：<input id="in1" type="text"   class="form-control"/></p>
								<button class="btn btn-primary btn-block">确定</button>
							</div>
						</div>
					</div>
				</div>
	</body>

</html>