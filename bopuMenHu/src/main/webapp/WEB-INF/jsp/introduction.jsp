<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>简介</title>
    <!--<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
         <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
          <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">-->
    <link rel="stylesheet"
          href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--图标-->
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
</head>
<script type="text/javascript">
    $(document).ready(function () {
        $.post("${pageContext.request.contextPath}/article/introduction",{},function (data) {
            var div = document.getElementById("content");
            div.innerHTML = data["obj"]["content"];
        });

    });
</script>
<body class="gray-bg">
<!-- 引入header.jsp -->
<jsp:include page="header.jsp" flush="true"></jsp:include>
<main class="content">
    <br> <br>
    <div id="content" class="cen center-block">
        <%-- 文章内容 --%>

    </div>
    <br> <br>
</main>
<footer class="center-block footer">
    <div class="container">
        <div class="row center-block">
            <div class="col-md-6">
					<span>反馈邮箱：12345678@163.com &nbsp; &nbsp;
						&nbsp;联系方式：12345678911</span>
            </div>
            <div class="col-md-6">
                <span>@2018-2020 Wenzhou Demo Worker</span>
            </div>
        </div>
    </div>
</footer>
</body>

</html>
<style type="text/css">
    /*背景色*/
    .gray-bg {
        background-color: #f3f3f4;
    }

    /*左右固定*/
    html, body {
        overflow-x: hidden;
    }

    /* 中间部分 */
    .content {
        min-height: calc(100vh - 100px);
    }

    /*底部栏*/
    .footer {
        background-color: #1572DD;
        height: 150px;
        padding: 30px;
        display: flex;
        /*使子项目水平居中*/
        justify-content: center;
        /*使子项目垂直居中*/
        align-items: center;
    }

    .footer span {
        color: #fff;
        font-size: 16px;
    }

    /*中间宽度*/
    .cen {
        width: 90%;
    }
</style>