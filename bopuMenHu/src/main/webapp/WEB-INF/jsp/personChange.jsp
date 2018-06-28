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
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
</head>

<body class="gray-bg">
	<!-- 引入header.jsp -->
	<jsp:include page="header.jsp" flush="true"></jsp:include>

	<main class="content">
		<div id="biaodan">
			<form action="${pageContext.request.contextPath}/user/personChange"
				class="form1" method="post" name="form1" target="_blank" id="form1">

				<br> <br> <br>
				<h1>个人中心</h1>

				<%-- 	<!--账号-->
				<label>账号</label> <input type="hidden" name="id" value="${user.id}">
				<input id="account" readonly="readonly" value="${user.account}"
					type="text" class="form-control" placeholder="账号" lay-verify="username"
					onfocus="showTips('account','账号必填!')"
					onblur="check('account','账号不能为空！')" disabled="disabled"> <br>
				<span id="accountspan" style="margin-left: -200px;"></span> <br>
					
				<!--姓名-->
				<label>姓名</label> <input id="name" readonly="readonly"
					value="${user.name}" type="text" class="form-control"
					placeholder="姓名" onfocus="showTips('name','姓名必填!')"
					onblur="check('name','姓名不能为空！')" disabled="disabled"> <br>
				<span id="namespan" style="margin-left: -200px;"></span> <br>
				<!--手机号-->
				<label style="margin-left: -14px;">手机号</label> <input id="phone"
					name="phone" value="${user.phone}" type="text" placeholder="手机号"
					class="form-control" onfocus="showTips('phone','手机必填!')"
					onblur="check('phone','手机不能为空！')" required="required" minlength="3"> <br> 
					<!-- <span
					id="phonespan" style="margin-left: -200px;"></span> -->
					<span id="msg" ></span> <br>
					 <br>
				<!--通讯地址-->
				<label style="margin-left: -27px;">通讯地址</label> <input
					name="address" value="${user.address}" type="text"
					class="form-control" placeholder="通讯地址"> <br> <br>

				<!--工作单位-->
				<label style="margin-left: -27px;">工作单位</label> <input id="work"
					value="${user.work}" name="work" type="text" class="form-control"
					placeholder="工作单位 " onfocus="showTips( 'work', '工作单位必填!') "
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
					onclick="alert('修改成功')" /> <br> <br> --%>
				<!--账号-->
				<label>账号</label> <input type="hidden" name="id" value="${user.id}">
				<input id="account" readonly="readonly" value="${user.account}"
					type="text" class="form-control" placeholder="账号" /> <br> <br>


				<!--姓名-->
				<label>姓名</label> <input id="name" readonly="readonly"
					value="${user.name}" type="text" class="form-control"
					placeholder="姓名" /> <br> <br>
				<!--手机号-->
				<label style="margin-left: -14px;">手机号</label> <input id="phone"
					name="phone" value="${user.phone}" type="text" placeholder="手机号"
					class="form-control"><br> <span for="phone"></span> <br>

				<!--通讯地址-->
				<label style="margin-left: -27px;">通讯地址</label> <input
					name="address" value="${user.address}" type="text"
					class="form-control" placeholder="通讯地址"> <br> <br>

				<!--工作单位-->
				<label style="margin-left: -27px;">工作单位</label> <input id="work"
					value="${user.work}" name="work" type="text" class="form-control"
					placeholder="工作单位 "> <br> <span for="work"></span> <br>
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
				<label>邮箱</label> <input id="email" name="email"
					value="${user.email}" type="text" class="form-control"
					placeholder="邮箱"><br> <span for="email"></span> <br>
				<input type="submit" id="btnChuang" class="btn btn-success"
					value="确定" /> <br> <br>
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

label {
	margin-right: 20px;
}

.error {
	color: red;
}
</style>

<script>

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
/* 	function showTips(id, info) {
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
	} */
/* 
	$().ready(function() {
		$("#form1").validate({
				errorPlacement: function(error, element) {
			// Append error within linked label
error.appendTo($("span[id='msg']"));				
		},
			rules : {
				phone : "required",
			},
			messages : {
				phone : "账号不能为空",
			},
			
		});
	}); */

	/* 	$.validator.setDefaults({
			submitHandler : function() {
				alert("提交事件!");
			}
		}); */

	/* 	$().ready(function() {
			// 提交时验证表单
			var validator = $("#form1").validate({
				errorPlacement : function(error, element) {
					// Append error within linked label
					error.appendTo($("span[id='msg']"));
				},
				 */
/* $().ready(function() {
    // 提交时验证表单
    var validator = $("#form1").validate({
        errorPlacement: function(error, element) {
            // Append error within linked label
            $( element )
                .closest( "form1" )
                    .find( "span[for='" + element.attr( "id" ) + "']" )
                        .append( error );
        },
        errorElement: "span",
			rules : {
				"phone" : {
					"required" : true,
					"minlength" : 11
				},
				"work" : {
				"required" : true,
				
				}
			},
			messages : {
				phone : {
					required : "手机号不能为空",
					minlength : "不能少于11个字符"
				},
				work : {
					required : "工作单位不能为空",
				
				}
			}
		});

		$(".cancel").click(function() {
			validator.resetForm();
		});
	}); */



	/* 	$.validator.setDefaults({
			submitHandler : function() {
				alert("提交成功!");
			}
		}); */

	$().ready(function() {

		// 提交时验证表单
		var validator = $("#form1").validate({
			errorPlacement : function(error, element) {
				// Append error within linked label
				$(element)
					.closest("form")
					.find("span[for='" + element.attr("id") + "']")
					.append(error);
			},
			errorElement : "span",
			rules : {
				"phone" : {
					"required" : true,
					"digits" : true,
					"minlength" : 11,
				},
				"work" : {
					"required" : true,
				},
				"email" : {
					"required" : true,
					"email" : true
				}
			},
			messages : {
				phone : {
					required : "手机号不能为空",
					digits : "必须是数字",
					minlength : "不能少于11个字符",
				},
				work : {
					required : "工作单位不能为空",
				},
				email : {
					required : "邮箱不能为空",
					email : "请输入有效的电子邮件地址"
				}
			}
		})


		$(".cancel").click(function() {
			validator.resetForm();
		});
	});
</script>