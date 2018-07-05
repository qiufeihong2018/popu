<%--
  Created by IntelliJ IDEA.
  User: Exler
  Date: 2018/6/10
  Time: 10:28
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
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
            rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

    <!-- 全局js -->
    <script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-3.3.7.min.js"></script>
    <!-- 日期 -->
    <script src="${pageContext.request.contextPath}/js/laydate/laydate.js"></script>
    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/js/content.js"></script>

</head>
<style type="text/css">
    .div1 {
        display: block;
        margin-left: auto;
        margin-right: auto;
        margin-top: 20px;
        width: 90%;
    }

    .selectpicker {
        display: block;
        width: 100%;
        height: 34px;
        padding: 6px 12px;
        font-size: 14px;
        line-height: 1.42857143;
        color: #555;
        background-color: #fff;
        background-image: none;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .demo-input {
        padding-left: 10px;
        height: 38px;
        min-width: 262px;
        line-height: 38px;
        border: 1px solid #e6e6e6;
        background-color: #fff;
        border-radius: 2px;
    }
</style>
<script type="text/javascript">
    var ue = UE.getEditor('container');
    var ue2 = UE.getEditor('container2');

    ue.ready(function () {
        ue.setContent("${article.content}");
    });
    ue2.ready(function () {
        ue2.setContent("${article.content}");
    });

    $(function () {
        $("#shiyan").hide();
        $("#tongzhi").hide();
        var type = ${article.type};
        $("#notice_select").val("${article.type}");
        if (type == 2) {
            $("#shiyan").show();
        } else {
            $("#tongzhi").show();
        }
        $("select").bind("change", function () {
            if (this.value == "2") {
                $("#shiyan").show();
                $("#tongzhi").hide()
            } else {
                $("#tongzhi").show();
                $("#shiyan").hide();
            }
        });
    });

    //		日期
    lay('#version').html('-v' + laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#date' //指定元素
        , type: 'datetime'
    });

    function submitHTML() {
        var type = $("#notice_select option:selected").val();
        if (type == 2) {
            var title = $("input[name='projectTitle']").val();
            var html = ue2.getContent();
            var author = $("input[name='projectAuthor']").val();
            var flag = $("input[name='projectFlag']:checked").val();
            var look = $("input[name='look']").val();
            var limitData = $("input[name='limitData']").val();
            $.post("${pageContext.request.contextPath}/article/update", {
                id: ${article.id},
                type: type,
                title: title,
                content: html,
                author: author,
                flag: flag,
                look: look,
                limitdata: limitData,
                time: "${article.time}",
                count: "${article.count}",
                referenced:${article.referenced}
            }, function (result) {
                if (result["status"] == 200) {
                    window.location.href = "${pageContext.request.contextPath}/article/show?articleId=" + result["message"];
                } else {
                    // 提交失败
                }
            });
        } else {
            var html = ue.getContent();
            var title = $("input[name='noticeTitle']").val();
            var author = $("input[name='noticeAuthor']").val();
            var flag = $("input[name='noticeFlag']:checked").val();
            $.post("${pageContext.request.contextPath}/article/update", {
                id: ${article.id},
                type: type,
                title: title,
                content: html,
                author: author,
                flag: flag,
                time: "${article.time}",
                count: "${article.count}",
                limitdata: "${article.limitdata}",
                look: "${article.look}",
                referenced:${article.referenced}
            }, function (result) {
                if (result["status"] == 200) {
                    window.location.href = "${pageContext.request.contextPath}/article/show?articleId=" + result["message"];
                } else {
                    // 提交失败
                }
            });
        }
    }
</script>
<body class="gray-bg">
<div class="div1">
    <br>
    <br>
    <h1>发布文章</h1>
    <hr style="border:5px solid #DDDDDD"/>
    <br>
    <!--文章分类-->
    <div class="col-lg-2" style="margin-top: 50px;">文章分类：</div>
    <div class="col-lg-10" style="margin-top: 50px;">
        <select id="notice_select" class="selectpicker" style="width: 100%;">
            <option value="1" name="option1">最近活动</option>
            <option value="2" name="option2">实验项目简介及连接</option>
            <option value="3" name="option3">业内动态</option>
            <option value="4" name="option4">内部通知</option>
        </select>
    </div>
    <!--通知-->
    <div id="tongzhi">

        <!--项目名称-->
        <div class="col-lg-2" style="margin-top: 50px;">标题：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <input type="text" class="form-control" name="noticeTitle" value="${article.type != 2 ? article.title: ""}"/>
        </div>

        <!--作者-->
        <div class="col-lg-2" style="margin-top: 50px;">作者：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <input type="text" class="form-control" name="noticeAuthor" value="${article.type != 2 ? article.author: ""}"/>
        </div>

        <!--正文-->
        <div class="col-lg-2" style="margin-top: 50px;">内容：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <div id="container" style="width:100%;height:500px;" type="text/plain">

            </div>
        </div>

        <!--是否评论-->
        <div class="col-lg-2" style="margin-top: 50px;">是否可评论：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <label class="radio-inline">
                <input type="radio" name="noticeFlag" ${article.flag == 1 ? "checked='checked'": ""} value="1"> 是
            </label>
            <label class="radio-inline">
                <input type="radio" name="noticeFlag" ${article.flag == 2 ? "checked='checked'": ""} value="2"> 否
            </label>
        </div>

        <!--确定-->
        <div class="col-lg-2" style="margin-top: 50px;"></div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <button class="btn btn-primary btn-block" onclick="submitHTML()">确定</button>
        </div>
    </div>

    <!--实验项目-->
    <div id="shiyan">
        <!--项目名称-->
        <div class="col-lg-2" style="margin-top: 50px;">项目名称：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <input type="text" name="projectTitle" class="form-control" value="${article.title}"/>
        </div>

        <!--项目简介-->
        <div class="col-lg-2" style="margin-top: 50px;">项目简介：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <div id="container2" type="text/plain" style="width:100%;height:500px;">

            </div>
        </div>

        <!--项目成员-->
        <div class="col-lg-2" style="margin-top: 50px;">项目成员：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <input type="text" class="form-control" name="projectAuthor" value="${article.author}"/>
        </div>

        <!--上限日期-->
        <div class="col-lg-2" style="margin-top: 50px;">上限日期：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <input id="date" name="limitData" type="text" class="demo-input" style="width: 100%;" value="${article.limitdata}"/><br>
            <span id="datespan"></span> <br>
        </div>

        <!--进入查看-->
        <div class="col-lg-2" style="margin-top: 50px;">项目地址：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <input type="text" class="form-control" name="look" value="${article.look}"/>
        </div>

        <!--是否评论-->
        <div class="col-lg-2" style="margin-top: 50px;">是否可评论：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <label class="radio-inline">
                <input type="radio" name="projectFlag" ${article.flag == 1 ? "checked='checked'": ""} value="1"> 是
            </label>
            <label class="radio-inline">
                <input type="radio" name="projectFlag" ${article.flag == 2 ? "checked='checked'": ""} value="2"> 否
            </label>
        </div>

        <!--确定-->
        <div class="col-lg-2" style="margin-top: 50px;"></div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <button class="btn btn-primary btn-block" onclick="submitHTML()">确定</button>
        </div>
    </div>
</div>
</body>
</body>
</html>