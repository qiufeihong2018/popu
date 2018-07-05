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
	<!-- layui -->
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<link rel="shortcut icon" href="favicon.ico">

<link
	href="${pageContext.request.contextPath}/css/font-awesome.css?v=4.4.0"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css?v=4.1.0"
	rel="stylesheet">
<meta charset="UTF-8">
</head>
<script type="text/javascript">
	// 访问 url content/showAbout
	$(function() {
		$.post("${pageContext.request.contextPath}/content/showAbout", function(data) {
		    console.log(data);
		    $("#in1").val(data["obj"][0]["url"]);
		    $("#in2").val(data["obj"][1]["url"]);
		})
	});
</script>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<div class="file-manager">
							<form
								action="${pageContext.request.contextPath}/admin/content/setAbout">
								<p>
									邮箱：<input id="in1" name="email" type="text"
										class="form-control" />
								</p>
								<p>
									电话：<input id="in2" name="phone" type="text"
										class="form-control" />
								</p>
								<input type="submit" class="btn btn-primary btn-block"
									onclick="sub()"></input>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>

<script>


	function sub() {
		if ($("#in1").val() == "") {
		parent.layer.alert("邮箱不能为空");
			$("#in1").focus();

		} else if ($("#in2").val() == "") {
		parent.layer.alert("电话不能为空");
			$("#in2").focus();
		}
	}
</script>