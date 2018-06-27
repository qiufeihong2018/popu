<%--
  Created by IntelliJ IDEA.
  User: shiku
  Date: 2018/6/8
  Time: 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DengLu</title>
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body class="gray-bg">
	<header class="clearfix">
		<!-- 头部 -->

		<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">

					<a class="navbar-brand" href="主页.html">温州市波普大数据研究院</a>
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#example-navbar-collapse">
						<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="example-navbar-collapse">
					<ul class="nav navbar-nav navbar-right">

						<li><a href="私信界面.html">私信</a></li>
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

					</ul>
				</div>
			</div>
		</nav>
	</header>

	<main class="content">
		<div id="biaodan">
			<form action="${pageContext.request.contextPath}/user/personChange"
				class="form1" method="post" name="form1" target="_blank" id="form1">
				<br> <br> <br>
				<h1>个人中心</h1>

				<!--账号-->
				<label>账号</label> <input type="hidden" name="id" value="${user.id}">
				<input id="account" readonly="readonly" value="${user.account}"
					type="text" class="form-control" placeholder="账号"
					onfocus="showTips('account','账号必填!')"
					onblur="check('account','账号不能为空！')" disabled="disabled"> <br> <span
					id="accountspan" style="margin-left: -200px;"></span> <br>
				<!--姓名-->
				<label>姓名</label> <input id="name" readonly="readonly"
					value="${user.name}" type="text" class="form-control"
					placeholder="姓名" onfocus="showTips('name','姓名必填!')"
					onblur="check('name','姓名不能为空！')" disabled="disabled"> <br> <span
					id="namespan" style="margin-left: -200px;"></span> <br>
				<!--手机号-->
				<label style="margin-left: -14px;">手机号</label> <input id="phone" name="phone"
					value="${user.phone}" type="text" placeholder="手机号"
					class="form-control" onfocus="showTips('phone','手机必填!')"
					onblur="check('phone','手机不能为空！')"> <br> <span
					id="phonespan" style="margin-left: -200px;"></span> <br>
				<!--通讯地址-->
				<label style="margin-left: -27px;">通讯地址</label> <input name="address" value="${user.address}"
					type="text" class="form-control" placeholder="通讯地址"> <br>
				<br>

				<!--工作单位-->
				<label style="margin-left: -27px;">工作单位</label> <input id="work" value="${user.work}"
					name="work" type="text" class="form-control" placeholder="工作单位 "
					onfocus="showTips( 'work', '工作单位必填!') "
					onblur="check( 'work', '工作单位不能为空！') "> <br> <span
					id="workspan" style="margin-left: -170px; "></span> <br>
				<!--职称-->
				<label>职称</label> <input name="professional "
					value="${user.professional}" type="text " class="form-control "
					placeholder="职称 "> <br> <br>
				<!--职务-->
				<label>职务</label> <input name="duties" value="${user.duties}"
					type="text" class="form-control" placeholder="职务" /> <br> <br>
				<!--岗位-->
				<label>岗位</label> <input name="station" value="${user.station}"
					type="text" class="form-control" placeholder="岗位"> <br>
				<br>
				<!--邮箱-->
				<label>邮箱</label> <input id="Email" name="email"
					value="${user.email}" type="text" class="form-control"
					placeholder="邮箱" onfocus="showTips( 'Email', '邮箱必填!') "
					onblur="check( 'Email', '邮箱不能为空！') "> <br> <span
					id="Emailspan" style="margin-left: -200px;"></span> <br> <input
					type="submit" id="btnChuang" class="btn btn-success" value="确定"
					onclick="alert('修改成功')" /> <br> <br>
			</form>
		</div>
	</main>

</body>

</html>
<style type="text/css">
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
/*创建样式*/
#btnChuang {
	text-align: center;
	color: white;
	background-color: #1572DD;
	height: 40px;
	width: 296px;
	border-color: #1572DD;
}

/*表单背景*/
#biaodan {
	width: 860px;
	height: 900px;
	background-color: white;
}
</style>

<script>
	window.onload = function() {
		var dragContainer = document.getElementById("dragContainer");
		var dragBg = document.getElementById("dragBg");
		var dragText = document.getElementById("dragText");
		var dragHandler = document.getElementById("dragHandler");

		//滑块最大偏移量
		var maxHandlerOffset = dragContainer.clientWidth - dragHandler.clientWidth;
		//是否验证成功的标记
		var isVertifySucc = false;
		initDrag();

		function initDrag() {
			dragText.textContent = "拖动滑块验证";
			dragHandler.addEventListener("mousedown", onDragHandlerMouseDown);

			dragHandler.addEventListener("touchstart", onDragHandlerMouseDown);
		}

		function onDragHandlerMouseDown(event) {
			document.addEventListener("mousemove", onDragHandlerMouseMove);
			document.addEventListener("mouseup", onDragHandlerMouseUp);

			document.addEventListener("touchmove", onDragHandlerMouseMove);
			document.addEventListener("touchend", onDragHandlerMouseUp);
		}

		function onDragHandlerMouseMove(event) {
			/*
            html元素不存在width属性,只有clientWidth
            offsetX是相对当前元素的,clientX和pageX是相对其父元素的

            touches：表示当前跟踪的触摸操作的touch对象的数组。
            targetTouches：特定于事件目标的Touch对象的数组。
        　　changedTouches：表示自上次触摸以来发生了什么改变的Touch对象的数组。
            */
			var left = (event.clientX || event.changedTouches[0].clientX) - dragHandler.clientWidth / 2;
			if (left < 0) {
				left = 0;
			} else if (left > maxHandlerOffset) {
				left = maxHandlerOffset;
				verifySucc();
			}
			dragHandler.style.left = left + "px";
			dragBg.style.width = dragHandler.style.left;
		}

		function onDragHandlerMouseUp(event) {
			document.removeEventListener("mousemove", onDragHandlerMouseMove);
			document.removeEventListener("mouseup", onDragHandlerMouseUp);

			document.removeEventListener("touchmove", onDragHandlerMouseMove);
			document.removeEventListener("touchend", onDragHandlerMouseUp);

			dragHandler.style.left = 0;
			dragBg.style.width = 0;
		}

		//验证成功
		function verifySucc() {
			isVertifySucc = true;
			dragText.textContent = "验证通过";
			dragText.style.color = "white";
			dragHandler.setAttribute("class", "dragHandlerOkBg");

			dragHandler.removeEventListener("mousedown", onDragHandlerMouseDown);
			document.removeEventListener("mousemove", onDragHandlerMouseMove);
			document.removeEventListener("mouseup", onDragHandlerMouseUp);

			dragHandler.removeEventListener("touchstart", onDragHandlerMouseDown);
			document.removeEventListener("touchmove", onDragHandlerMouseMove);
			document.removeEventListener("touchend", onDragHandlerMouseUp);
		}
		;
	}
	//
	//			function CheckInput(inputField, helpText) {
	//				if(inputField.value.length == 0) {
	//					if(helpText != null) {
	//						helpText.innerHTML = "不能为空，请输入";
	//
	//					}
	//					return false;
	//				} else {
	//					if(helpText != null) {
	//						helpText.innerHTML = "";
	//
	//					}
	//					return true;
	//				}
	//			}

	//不为空验证
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
</script>