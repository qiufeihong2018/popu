<%--
  Created by IntelliJ IDEA.
  User: Exler
  Date: 2018/6/5
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/utf8-jsp/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.ico">

    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-3.3.7.min.js"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/js/content.js"></script>

    <!-- layerDate plugin javascript -->
    <script src="${pageContext.request.contextPath}/js/plugins/layer/laydate/laydate.js"></script>
    <script>
        //外部js调用
        laydate({
            elem: '#hello', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
            event: 'focus' //响应事件。如果没有传入event，则按照默认的click
        });

        //日期范围限制
        var start = {
            elem: '#start',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(), //设定最小日期为当前日期
            max: '2099-06-16 23:59:59', //最大日期
            istime: true,
            istoday: false,
            choose: function (datas) {
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
            }
        };
        var end = {
            elem: '#end',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(),
            max: '2099-06-16 23:59:59',
            istime: true,
            istoday: false,
            choose: function (datas) {
                start.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };
        laydate(start);
        laydate(end);
    </script>
    <style type="text/css">
        body,
        html {
            overflow-x: hidden;
        }

        .div1 {
            display: block;
            margin-left: auto;
            margin-right: auto;
            margin-top: 20px;
            width: 90%;
            /*padding-bottom: 100%*/
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

        .demo-footer {
            padding: 50px 0;
            color: #999;
            font-size: 14px;
        }

        .demo-footer a {
            padding: 0 5px;
            color: #01AAED;
        }
    </style>
    <script type="text/javascript">
        var ue = UE.getEditor('editor2');
        var ue = UE.getEditor('container');

        function submitHTML() {
            // 获取编辑器中的html
            var html = ue.getContent();
            // 返回成功跳转 页面 => 跳转到文章阅读页面
            var title = $("input[name='title']").val();
            // var flag =;
            var author = $("input[name='author']").val();
            var look = $("input[name='look']").val();

            $.post("${pageContext.request.contextPath}/article/upload", {
                content: html,
                title: title,
                author: author,
                look: look
            }, function (result) {
            })
        }
    </script>
</head>

<body class="gray-bg">

<div class="div1">
    <br>
    <br>
    <h1>发布文章</h1>

    <hr style="border:5px solid #DDDDDD"/>
    <br>
    <!--项目名称-->
    <div class="col-lg-2" style="margin-top: 50px;">项目名称：</div>
    <div class="col-lg-10" style="margin-top: 50px;">
        <input type="text" class="form-control"
               placeholder="输入内容" name="title"/></div>

    <!--文章分类-->
    <div class="col-lg-2" style="margin-top: 50px;">文章分类：</div>
    <div class="col-lg-10" style="margin-top: 50px;">
        <select name="se1" id="se1" class="selectpicker" style="width: 100%;">
            <option name="type" id="option1" value="1">通知</option>
            <option name="type" id="option2" value="2">实验项目</option>
            <option name="type" id="option3" value="3">内部通知</option>
        </select>
    </div>

    <!--项目简介-->
    <div class="col-lg-2" style="margin-top: 50px;">项目简介：</div>
    <div class="col-lg-10" style="margin-top: 50px;">
        <script id="container" name="content" type="text/plain">
            在这里编辑文章内容



        </script>
    </div>

    <!--作者成员-->
    <div class="col-lg-2" style="margin-top: 50px;">作者：</div>
    <div class="col-lg-10" style="margin-top: 50px;">
        <input type="text" class="form-control" placeholder="输入内容" name="author"/>
    </div>

    <!--上限日期-->
    <div class="col-lg-2" style="margin-top: 50px;">上限日期：</div>
    <div class="col-lg-10" style="margin-top: 50px;">
        <input class="form-control layer-date" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"
               name="limitData">
        <label class="laydate-icon"></label>

    </div>

    <!--进入查看-->
    <div class="col-lg-2" style="margin-top: 50px;">进入查看：</div>
    <div class="col-lg-10" style="margin-top: 50px;"><input type="text" class="form-control"
                                                            placeholder="输入内容" name="look"/></div>

    <!--是否评论-->
    <div class="col-lg-2" style="margin-top: 50px;">是否评论：</div>
    <div class="col-lg-10" style="margin-top: 50px;"><label class="radio-inline">
        <input type="radio" name="flag" id="inlineRadio1" value="1"> 是
    </label>
        <label class="radio-inline">
            <input type="radio" name="flag" id="inlineRadio2" value="2"> 否
        </label></div>

    <!--正文-->
    <div class="col-lg-2" style="margin-top: 50px;">正文：</div>
    <div class="col-lg-10" style="margin-top: 50px;">

    </div>

    <!--确定-->
    <div class="col-lg-2" style="margin-top: 50px;"></div>
    <div class="col-lg-10" style="margin-top: 50px;">
        <button class="btn btn-primary btn-block" onclick="submitHTML()">确定</button>
    </div>
</div>
</body>
</html>