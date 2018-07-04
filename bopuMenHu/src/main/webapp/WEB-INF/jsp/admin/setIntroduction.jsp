<%--
  Created by IntelliJ IDEA.
  User: Exler
  Date: 2018/7/4
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layDate 文章发布</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/utf8-jsp/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
    <link
            href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
            rel="stylesheet">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css"
          rel="stylesheet">

    <!-- 全局js -->
    <script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

    <script
            src="${pageContext.request.contextPath}/js/bootstrap-3.3.7.min.js"></script>
    <!-- 日期 -->
    <script src="${pageContext.request.contextPath}/js/laydate/laydate.js"></script>
    <!-- 改成你的路径 -->

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/js/content.js"></script>

</head>
<body class="gray-bg">
<div class="div1">
    <br> <br>
    <h1>简介修改</h1>
    <!--实验项目-->
    <div id="shiyan">
        <div class="col-lg-10" style="margin-top: 50px;">
            <div id="container" type="text/plain"
                 style="width:100%;height:500px;"></div>
        </div>
        <div class="col-lg-2" style="margin-top: 50px;"></div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <!--      <button class="btn btn-primary btn-block" onclick="submitHTML()" type="submit">确定</button> -->
            <input type="submit" class="btn btn-primary btn-block" onclick="submitHTML()" value="确定">
        </div>
        <!--换行-->
        <div class="col-lg-2" style="margin-top: 50px;"></div>
        <div class="col-lg-10" style="margin-top: 50px;"></div>
    </div>
</div>
</body>
</html>
<style type="text/css">
    .div1 {
        display: block;
        margin-left: auto;
        margin-right: auto;
        margin-top: 20px;
        width: 90%;
    }
</style>
<script type="text/javascript">
    //富文本框
    var ue = UE.getEditor('container');

    ue.ready(function () {
        $.post("${pageContext.request.contextPath}/article/introduction", {}, function (result) {
            ue.setContent(result["obj"]["content"]);
        });
    });

    function submitHTML() {
        // 获取编辑器中的html
        var html = ue.getContent();
        $.post("${pageContext.request.contextPath}/article/updateIntro", {
            content: html
        }, function (result) {
            if (result["status"] == 200) {
                top.location.href = "${pageContext.request.contextPath}/introduction";
            } else {
                // 提交失败
            }
        });
    }
</script>