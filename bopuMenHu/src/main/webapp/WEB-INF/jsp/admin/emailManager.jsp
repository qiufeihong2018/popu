<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%--
  Created by IntelliJ IDEA.
  User: shiku
  Date: 2018/7/01
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>波普后台邮箱管理</title>
<link rel="shortcut icon" href="favicon.ico">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
	<!-- layui -->
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 全局js -->
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap-3.3.7.min.js"></script>

<!-- 自定义js -->
<script src="${pageContext.request.contextPath}/js/content.js"></script>
</head>
<!--图片上传结束-->
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="wrapper wrapper-content">
			<div class="row">
				<div class="col-sm-12">
					<div class="ibox float-e-margins">
						<div class="ibox-content">
							<div class="file-manager">
								<p>
									邮箱账号：<input id="emailAccount" type="text"
										value="${MY_EMAIL_ACCOUNT}" class="form-control" />
								</p>
								<p>
									邮箱密码：<input id="emailPwd" type="text"
										value="${MY_EMAIL_PASSWORD}" class="form-control" />
								</p>
								<p>
									SMTP服务器：<input id="emailSMTP" type="text"
										value="${My_Email_SMTP_Host}" class="form-control" />
								</p>
								<button onclick="changeEmail()"
									class="btn btn-primary btn-block">确定</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script>
    function changeEmail() {

    if($("#emailAccount").val()==""){
  parent.layer.alert("邮箱账号不能为空");
    $("#emailAccount").focus();
    }else if($("#emailPwd").val()==""){
   parent.layer.alert("邮箱密码不能为空");
    $("#emailPwd").focus();
    }else if($("#emailSMTP").val()==""){
    parent.layer.alert("SMTP服务器不能为空");
    $("#emailSMTP").focus();
    }
    else{
        var account = $("#emailAccount").val();
        var pwd = $("#emailPwd").val();
        var SMTP = $("#emailSMTP").val();
        console.log(account);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/admin/email",
            data: {MY_EMAIL_ACCOUNT:account,MY_EMAIL_PASSWORD:pwd,My_Email_SMTP_Host:SMTP},
            dataType: "json",
            success: function (data) {
                console.log(data);
                if(data["status"]==200){
                   parent.layer.alert("修改成功");
                }else {
                  parent.layer.alert(data["message"]);
                }
            },error: function (data) {
               parent.layer.alert("error");
            }
        });
   }
    }
</script>

	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
	<!--统计代码，可删除-->

</body>

</html>