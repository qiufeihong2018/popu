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
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="favicon.ico">

<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
<meta charset="UTF-8">
</head>

<body class="gray-bg">

	<div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-sm-10">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<div class="file-manager">
							<p>
								邮箱：<input id="email" type="text" class="form-control" />
							</p>
							<p>
								电话：<input id="phone" type="text" class="form-control" />
							</p>
							
								<input id="btnOk" class="btn btn-success" type="submit" value="确定" />
						</div>
					</div>
				</div>
			</div>
</body>

</html>
<style>
.row {
	display: flex;
	/*使子项目水平居中*/
	justify-content: center;
	/*使子项目垂直居中*/
	align-items: center;
}
	/*确定*/
	
	#btnOk {
		color: white;
		background-color: #1572DD;
		height: 40px;
	width:auto;
		border-color: #1572DD;
		border-radius: 3px;
		float:right;
	}
</style>