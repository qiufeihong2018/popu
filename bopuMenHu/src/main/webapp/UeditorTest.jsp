<%--
  Created by IntelliJ IDEA.
  User: Exler
  Date: 2018/6/4
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/utf8-jsp/ueditor.all.min.js"></script>
    <script src="/js/jquery-1.12.4.js"></script>
</head>
<body>
<script id="container" name="content" type="text/plain">
在这里编辑文章内容
</script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('container');

    function submitHTML() {
        // 获取编辑器中的html
        var html = ue.getContent();
        // 返回成功跳转 页面 => 跳转到文章阅读页面
        $.post("${pageContext.request.contextPath}/article/upload",{content: html},function (result) {
        })
    }
</script>

<button style="width: 100px;height: 100px" value="提交" onclick="submitHTML()">提交</button>
</body>
</html>
