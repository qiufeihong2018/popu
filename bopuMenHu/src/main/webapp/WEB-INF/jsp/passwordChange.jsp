<%--
  Created by IntelliJ IDEA.
  User: shiku
  Date: 2018/6/8
  Time: 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DengLu</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
        <form action="${pageContext.request.contextPath}/user/passwordChange" class="form1" method="post" name="form1" id="form1">
            <br> <br> <br>
            <h1>个人中心</h1>


          	  <!--账号-->
            ${oldPassword}${newPassword}<br>
            <input type="hidden" name="id" value="${user.id}" style="color:red">
           	<label style="margin-left: -39px;">原密码</label> <input id="oldPassword" name="oldPassword" type="password" class="form-control" placeholder="原密码" /><br> <span for="oldPassword" style="margin-left: -192px;"></span> 
            <br>
            	<label style="margin-left: -39px;">新密码</label><input id="newPassword" name="newPassword" type="password" class="form-control" placeholder="新密码" /><br> <span for="newPassword" style="margin-left: -181px;"></span>
            <br>
          
                      	<label style="margin-left: -74px;">重复新密码</label>  <input id="reNewPassword" name="reNewPassword" type="password" class="form-control" placeholder="重复新密码" /><br> <span for="reNewPassword" style="margin-left: -159px;"></span> 
            
            <br>
          	<input id="btnChuang" type="submit" class="btn btn-success" value="确定" />
            <br>
        </form>
    </div>
</main>

</body>

</html>
   <style type="text/css">
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
        /*验证文字样式*/

        #account,
        #password,
        #name,
        #phone,
        #work,
        #Email {
            color: red;
        }
        /*表单背景*/

        #biaodan {
            width: 860px;
            height: 900px;
            background-color: white;
        }
        .error{
        color:red;
        }
    </style>

    <script>
 

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
				"oldPassword" : {
					"required" : true,
					
					
				},
				"newPassword" : {
					"required" : true,
						"minlength" : 6,
				},
				"reNewPassword" : {
					"required" : true,
					"equalTo" : "#newPassword"
				}
			},
			messages : {
				oldPassword : {
					required : "密码不能为空",
				
				
				},
				newPassword : {
					required : "新密码不能为空",
					minlength : "不能少于6个字符",
				},
				reNewPassword : {
					required : "重复新密码不能为空",
					equalTo : "两次密码不相同"
				}
			}
		})


		$(".cancel").click(function() {
			validator.resetForm();
		});
	});
    </script>