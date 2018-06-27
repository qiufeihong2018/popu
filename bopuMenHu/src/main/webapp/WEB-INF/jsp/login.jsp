<%--
  Created by IntelliJ IDEA.
  User: shiku
  Date: 2018/5/27
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DengLu</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body class="gray-bg">

<header class="clearfix"><!-- 头部 -->

    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">

                <a class="navbar-brand" href="#">温州波普大数据研究所</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#example-navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">简介</a></li>
                    <li  class="divider"></li>
                    <li><a href="#">最近活动</a></li>
                    <li  class="divider"></li>
                    <li><a href="#">研究成果</a></li>
                    <li class="divider"></li>
                    <li><a href="#">业内动态</a></li>
                    <li class="divider"></li>
                    <li><a href="#">联系我们</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

	<main class="content">
			<div id="biaodan">
		  <form action="${pageContext.request.contextPath}/user/login" method="post" name="form1" target="_blank" id="form1" onSubmit="return check_login()">

					<br>
					<br><br><br>
					<h1>登录</h1>

					<!--<input type="text" name="username" class="form-control" onblur="CheckInput(this,document.getElementById('username'))" placeholder="手机/邮箱/用户名" />-->

					<!--<span id="username"></span>-->
					<!--账号-->
					<input id="username" type="text" name="username" value="${account}" class="form-control" placeholder="手机/邮箱/用户名" onfocus="showTips('username','手机/邮箱/用户名必填！')" onblur="check('username','手机/邮箱/用户名不能为空！')" />
					<br>
					<span class="msg" id="usernamespan" style="margin-left: -110px;">${fail}</span>
					<br>
					<!--<input name="password" type="password" class="form-control" onblur="CheckInput(this,document.getElementById('password'))" placeholder="密码" />
					<br>
					<span id="password"></span>-->

					<!--密码-->
					<input id="password" type="password" name="password" class="form-control" placeholder="密码" onfocus="showTips('password','密码必填！')" onblur="check('password','密码不能为空！')" />
					<br>
					<span class="msg" id="passwordspan" style="margin-left: -180px;"></span>
					<br>

					<!--验证码验证-->
					<div id="yan">
						<p5 style="margin-left: -8px;">验证码</p5>
						<input type="text" id="yanzhengma" class="form-control photokey" value="请输入验证码" onBlur="textBlur(this)" onFocus=" textFocus(this) " />
						<span class="add phoKey"></span>
						<span class="error error7"></span>
					</div>

					<br>

					<input id="btnOk" class="btn btn-success" type="submit" value="确定" />
					<br> <br>

					<input id="lianjie" onclick="javascript:window.location.href='${pageContext.request.contextPath}/register'" type="button" value="注册" class="btn btn-link"> 
			<input id="lianjie" onclick="javascript:window.location.href='${pageContext.request.contextPath}/searchAccount'" type="button" value="忘记密码" class="btn btn-link" />

				</form>
			</div>
		</main>
</body>
</html>

<style type="text/css">
	/*输入验证码*/
	
	#yanzhengma {
		text-indent: 4px;
		width: 160px;
		font-size: 14px;
	}
	
	.add {
		width: 200px;
		height: 34px;
		_display: inline;
		cursor: pointer;
		margin-left: 10px;
	}
	
	.input-code {
		font-family: Arial;
		font-style: italic;
		cursor: pointer;
		text-indent: 0;
	}
	/*蓝框验证码*/
	
	.phoKey {
		width: 200px;
		background: #1572DD;
		text-align: center;
		font-size: 18px;
		color: #fff;
		letter-spacing: 3px;
		padding: 5px;
		border-radius: 3px;
	}
	
	.error {
		margin-left: -87px;
		display: block;
		color: red;
		margin-bottom: -10px;
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
	
	.gray-bg,
	.btn-link {
		background-color: #f3f3f4;
	}
	/*左右固定*/
	
	html,
	body {
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
	
	.navbar-default .navbar-nav > li > a {
		color: #fff !important;
	}
	
	.navbar-default .navbar-nav > li > a:focus,
	.navbar-default .navbar-nav > li > a:hover {
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
	
	#btnOk {
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
	
	#lianjie {
		background-color: white;
	}
</style>

<script language="JavaScript">
	//文本框默认提示文字  
	function textFocus(el) {
		if(el.defaultValue == el.value) {
			el.value = '';
			el.style.color = '#333';
		}
	}

	function textBlur(el) {
		if(el.value == '') {
			el.value = el.defaultValue;
			el.style.color = '#999';
		}
	}

	$(function() {

		/*生成验证码*/
		(function create_code() {
			function shuffle() {
				var arr = ['1', 'r', 'Q', '4', 'S', '6', 'w', 'u', 'D', 'I', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
					'q', '2', 's', 't', '8', 'v', '7', 'x', 'y', 'z', 'A', 'B', 'C', '9', 'E', 'F', 'G', 'H', '0', 'J', 'K', 'L', 'M', 'N', 'O', 'P', '3', 'R',
					'5', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
				];
				return arr.sort(function() {
					return(Math.random() - .5);
				});
			};
			shuffle();

			function show_code() {
				var ar1 = '';
				var code = shuffle();
				for(var i = 0; i < 4; i++) {
					ar1 += code[i];
				};
				//var ar=ar1.join('');  
				$(".phoKey").text(ar1);
			};
			show_code();
			$(".phoKey").click(function() {
				show_code();
			});
		})();

		//账户输入框失去焦点  
		(function login_validate() {

			/*验证码输入框失去焦点*/
			$(".photokey").blur(function() {
				var code1 = $('input.photokey').val().toLowerCase();
				var code2 = $(".phoKey").text().toLowerCase();
				if(code1 != code2) {
					$(this).addClass("errorC");
					$(this).next().next().html("验证码输入错误！");
					$(this).next().next().css("display", "block");
				} else {
					$(this).removeClass("errorC");
					$(this).next().next().empty();
					$(this).addClass("checkedN");
				}
			})
		})();
	});

	//验证码结束
	//	表单验证,验证通过提交信息
	function check_login() {
		var msg = document.getElementsByClassName("msg");
		if(document.getElementById("username").value == "") {
			document.getElementById("username").focus();
			return false;
		} else if(document.getElementById("password").value == "") {
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
		if(uValue == "") {
			document.getElementById(id + "span").innerHTML = "<font color='red'>" + info + "</font>";
		} else {
			document.getElementById(id + "span").innerHTML = "";
		}
	}
</script>

