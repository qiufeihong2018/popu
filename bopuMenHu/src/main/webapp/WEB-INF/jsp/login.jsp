<%--
  Created by IntelliJ IDEA.
  User: shiku
  Date: 2018/5/27
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DengLu</title>
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 腾讯验证码 -->
<script src="https://ssl.captcha.qq.com/TCaptcha.js"></script>
<%-- <!--     引入表单校验jquery插件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script> --%>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
</head>
<body class="gray-bg">
	<jsp:include page="header.jsp"/>

	<main class="content">
		<div id="biaodan">
			<form action="${pageContext.request.contextPath}/user/login"
				method="post" name="form1" target="_self" id="form1"
				onSubmit="return check_login()">

				<br> <br> <br> <br>
				<h1>登录</h1>
				<!--账号-->
				<label style="margin-left: -35px;">账号</label> <input
					id="username" type="text" name="account" value="${account}"
					class="form-control" placeholder="手机/邮箱/用户名"
					onfocus="showTips('username','手机/邮箱/用户名必填！')"
					onblur="check('username','手机/邮箱/用户名不能为空！')" /> <br> <span
					class="msg" id="usernamespan" style="margin-left: -110px;">${fail}</span>
				<br>
				<!-- 	密码 -->
				<label style="margin-left: -35px;">密码</label> <input id="password"
					type="password" name="password" class="form-control"
					placeholder="密码" onfocus="showTips('password','密码必填！')"
					onblur="check('password','密码不能为空！')" /> <br> <span
					class="msg" id="passwordspan" style="margin-left: -180px;"></span>
				<br>
				<input id="TencentCaptcha" data-appid="2056056228" style="display: none"
					   data-cbfn="callback" class="btn btn-success" type="button"
					   value="确定"  />
				<br> <input id="TencentCaptcha1" data-appid="2056056228"
							class="btn btn-success" type="button"
					value="确定" onclick="checkInput()"  /> <br> <br> <input
					id="lianjie1"
					onclick="javascript:window.location.href='${pageContext.request.contextPath}/register'"
					type="button" value="注册" class="btn btn-link"> <input
					id="lianjie2"
					onclick="javascript:window.location.href='${pageContext.request.contextPath}/searchAccount'"
					type="button" value="忘记密码" class="btn btn-link" />

			</form>
		</div>
	</main>
</body>
</html>

<style type="text/css">
/*输入验证码*/
#yanzhengma {
	text-indent: 4px;
	width: 189px;
	font-size: 14px;
}

.add {
	height: 34px;
	cursor: pointer;
	margin-right: 253px;
	float: right;
	margin-left: -251px;
}

.input-code {
	font-family: Arial;
	font-style: italic;
	cursor: pointer;
	text-indent: 0;
}
/*蓝框验证码*/
.phoKey {
	width: 98px;
	background: #1572DD;
	text-align: center;
	font-size: 18px;
	color: #fff;
	letter-spacing: 3px;
	padding: 5px;
	border-radius: 3px;
}
/* 
.error {
	margin-left: -87px;
	display: block;
	color: red;
	margin-bottom: -10px;
} */
.error {
	color: red;
}

input {
	background-color: #fff;
	outline: none;
}

.errorC {
	border: 1px solid red;
	font-size: 20px;
}
/*验证码结束*/
/*背景色*/
.gray-bg, .btn-link {
	background-color: #f3f3f4;
}
/*左右固定*/
html, body {
	overflow-x: hidden;
}
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

.navbar-default .navbar-nav>li>a:focus, .navbar-default .navbar-nav>li>a:hover
	{
	color: #eee !important;
}
/*中间内容*/
.content {
	text-align: center;
	min-height: calc(100vh - 20px);
	display: flex;
	/*使子项目水平居中*/
	justify-content: center;
	/*使子项目垂直居中*/
	align-items: center;
}
/*文本框*/
.form-control {
	display: inline-block;
	width: 296px;
}
/*确定*/
#TencentCaptcha1 {
	color: white;
	background-color: #1572DD;
	height: 40px;
	width: 296px;
	border-color: #1572DD;
	border-radius: 3px;
}
/*表单背景*/
#biaodan {
	width: 860px;
	height: 600px;
	background-color: white;
}
/*注册密码样式*/
#lianjie1,#lianjie2 {
	background-color: #fff;
}

@media screen and (max-width:500px) {
	#yanzhengma {
		text-indent: 4px;
		width: 189px;
		font-size: 14px;
	}
	.add {
		height: 34px;
		cursor: pointer;
		float: right;
		margin-left: -251px;
	}
}
</style>

<script language="JavaScript">

	//	表单验证,验证通过提交信息
	function check_login() {
		if (document.getElementById("username").value == "") {
			document.getElementById("username").focus();
			return false;
		} else if (document.getElementById("password").value == "") {
			document.getElementById("password").focus();
			return false;
		}
		return true;
	}

	function showTips(id, info) {
		document.getElementById(id + "span").innerHTML = "<font color='gray'>" + info + "</font>";
	}

	function check(id, info) {
		//1.获取用户输入的用户名数据
		var uValue = document.getElementById(id).value;
		//2.进行校验
		if (uValue == "") {
			document.getElementById(id + "span").innerHTML = "<font color='red'>" + info + "</font>";
		} else {
			document.getElementById(id + "span").innerHTML = "";
		}
	}


	function checkInput(){
        if (document.getElementById("username").value == "") {
            document.getElementById("username").focus();
            return false;
        } else if (document.getElementById("password").value == "") {
            document.getElementById("password").focus();
            return false;
        }
        $("#TencentCaptcha").click();
	}


	window.callback = function check(res) {
		// res（未通过验证）= {ret: 1, ticket: null}
		// res（验证成功） = {ret: 0, ticket: "String", randstr: "String"}
		if (res.ret === 0) {
		    //验证通过提交表单
			$("#form1").submit();
		}
	}
</script>

