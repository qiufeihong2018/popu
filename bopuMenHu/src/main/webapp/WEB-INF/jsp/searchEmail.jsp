<%--
  Created by IntelliJ IDEA.
  User: shiku
  Date: 2018/6/4
  Time: 14:54
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
        <form action="${pageContext.request.contextPath}/user/searchPassword" method="post" name="form1" target="_self" id="form1" onSubmit="return check_login()">

            <br>
            <br><br><br>
            <h1>输入账号</h1>
            <hr>
            <br>
            <span style="margin-left: -117px;">请输入要重置密码的邮箱</span><br><br>
            <input type="text" value="${email}" name="email" class="form-control" onblur="CheckInput(this,document.getElementById('email'))" placeholder="邮箱" />
            <input type="hidden" name="account" value="${account}">
            <br>
            <span id="email">${emailMsg}</span>
            <br>
            <input type="text" name="code" class="form-control" style="width:auto" placeholder="输入邮箱验证码" />
            <a href="#"><input id="huoQu" onclick="sendCode()" class="btn btn-success" value="获取验证码" /></a>
            <br>
            <span id="code">${codeMsg}</span>
            <br>
            <br> <br> <br>
            <a href="安全验证.html"><input type="submit" id="btnOk" class="btn btn-success" value="下一步" /></a>
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
    
        	/*获取验证码*/
	
	#huoQu {
		color: white;
		background-color: #1572DD;
		height: 40px;
		border-color: #1572DD;
		border-radius: 3px;
		width: 110px;
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

        #code,
        #email{
            color: red;
        }
        /*确定*/

        #btnOk {
            color: white;
            background-color: #1572DD;
            height: 40px;
            width: 296px;
                    border-color: #1572DD;
        }

        /*表单背景*/

        #biaodan {
            width: 860px;
            height: 600px;
            background-color: white;
        }
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
                    var text = $(inputField).val();
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/user/checkEmail",
                        data: {account:"${account}",email:text},
                        dataType: "json",
                        success: function (data) {
                            console.log(data);
                            if(data["status"]!=200){
                                helpText.innerHTML=data["message"];
                            }
                        }
                    });
                }
                return true;
            }
        }

        var countdown = 60;

        /*function sendemail() {
            var obj = $("#huoQu");
            settime(obj);

        }*/

        function settime() {
            //		倒计时
            var obj = $("#huoQu");
            if(countdown == 0) {
                obj.attr('disabled', false);
                obj.val("获取验证码");
                countdown = 60;
                return ;
            } else {

                if(countdown == 60){
                    sendEmail(obj.val());
                }

                obj.attr('disabled', true);
                obj.val("重新发送(" + countdown + ")");
                countdown--;
            }
            setTimeout(function() {
                    settime(obj)
                },
                1000)



        }

        function sendEmail() {
            var text = $("input[name='email']").val();
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/user/getCode",
                data: {account:"${account}",email:text},
                dataType: "json",
                success: function (data) {console.log("123");
                    if(data["status"]==200){
                        alert("发送成功，请到邮箱中查看");
                    }
                    if(data["status"]!=200){
                        $("#email").val(data["message"]);
                    }
                }
            });
        }
        
        function sendCode() {

            settime()
        }
    </script>
