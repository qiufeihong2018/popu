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
        <form action="${pageContext.request.contextPath}/user/searchEmail" method="post" name="form1" target="_self" id="form1" onSubmit="return check_login()">

            <br>
            <br><br><br>
            <h1>输入账号</h1>
            <hr>
            <br>
            <span style="margin-left: -117px;">请输入要重置密码的账号</span><br><br>
            <input type="text" value="${account}" name="account" class="form-control" onblur="CheckInput(this,document.getElementById('username'))" placeholder="账号" />
            <br>
            <span id="username">${message}</span>
            <br>


            <br> <br> <br>
            <input id="btnOk" type="submit" class="btn btn-success" value="下一步" />
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
                        url: "${pageContext.request.contextPath}/user/checkNotName",
                        data: {account:text},
                        dataType: "json",
                        success: function (data) {
                            if(data["status"]!=200){
                                helpText.innerHTML=data["message"];
                            }
                        }
                    });
                }
                return true;
            }
        }
    </script>