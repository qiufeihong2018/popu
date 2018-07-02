<%--
  Created by IntelliJ IDEA.
  User: shiku
  Date: 2018/6/4
  Time: 15:02
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

 <!-- 引入header.jsp -->
<jsp:include page="header.jsp" flush="true"></jsp:include>
<main class="content">
    <div id="biaodan">
        <form action="" method="post" name="form1" target="_blank" id="form1" onSubmit="return check_login()">

            <br>
            <br><br><br>
            <h1>输入账号</h1>
            <hr>
            <br>
            <span style="margin-left: -117px;">请输入要重置的密码</span><br><br>
            <input type="password" name="name" class="form-control" onblur="CheckInput(this,document.getElementById('username'))" placeholder="密码" />
            <br>

          <br>
            <input id="btnOk" onclick="changePwd()" class="btn btn-success" value="下一步" />
            <br> <br>

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

    
        /*注册样式*/

        .zhu {
            color: #1572DD;
        }
        /*文本框*/

        .form-control {
            display: inline-block;
            width: 296px;
        }

        #username,
        #password {
            color: red;
        }
        /*确定*/

        #btnOk {
            color: white;
            background-color: #1572DD;
            height: 40px;
                    border-color: #1572DD;
            width: 296px;
        }

        /*表单背景*/

        #biaodan {
            width: 860px;
            height: 600px;
            background-color: white;
        }
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
    </style>
    <!--验证码-->
    <script language="JavaScript">
    
        //用户名密码验证
        function CheckInput(inputField, helpText) {
            if(inputField.value.length == 0) {
                if(helpText != null) {
                    helpText.innerHTML = "不能为空，请输入";

                }
                return false;
            } else {
                if(helpText != null) {
                    helpText.innerHTML = "";

                }
                return true;
            }
        }
        //修改密码
        function changePwd() {
            var pwd = $("input[name='name']").val();
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/user/changePassword",
                data: {id:${id},password:pwd},
                dataType: "json",
                success: function (data) {
                    if(data["status"]==200){
                        alert("修改成功");
                        window.location.href="${pageContext.request.contextPath}/login";
                    }
                    if(data["status"]!=200){
                        alert(data["message"]);
                        window.location.href="${pageContext.request.contextPath}/searchAccount";
                    }
                }
            });
        }
    </script>