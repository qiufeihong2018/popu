<%--
  Created by IntelliJ IDEA.
  User: Exler
  Date: 2018/6/8
  Time: 18:41
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
    <script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-3.3.7.min.js"></script>
    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/js/content.js"></script>
    <!-- layerDate plugin javascript -->
    <script src="${pageContext.request.contextPath}/js/plugins/layer/laydate/laydate.js"></script>
    <script>//外部js调用
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

        .yz {
            margin-top: -460px;
        }
    </style>
</head>
<script type="text/javascript">
    var ue;
    var ue2;

    $(function () {
        $("#shiyan").hide();
        $("#tongzhi").hide();
        var type = ${article.type};
        alert(type);
        if (type == 2) {
            $("#shiyan").show();
        } else {
            $("#tongzhi").show();
            $("#shiyan").hide();
            $("#tongzhi").show();
            ue = UE.getEditor('container');
        }


        // if (type == 2) {
        //     $("#tongzhi").hide();
        //     $("#shiyan").show();
        //     ue2 = UE.getEditor('container2');
        <%--ue2.setHtml(${article.content});--%>
        // } else {

        // }
        // })}
    });


    function submitHTML() {
        // 获取编辑器中的html
        var html = ue.getContent();
        // 返回成功跳转 页面 => 跳转到文章阅读页面

        // var type =$("select").val();
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
                limitdata: limitData
            }, function (result) {
                if (result["status"] == 200) {
                    window.location.href = "${pageContext.request.contextPath}/article/show?articleId=" + result["message"];
                } else {
                    // 提交失败
                }
            });
        } else {
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
                look: "${article.look}"
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
    <h1>编辑文章</h1>

    <hr style="border:5px solid #DDDDDD"/>
    <br>
    <!--文章分类-->
    <div class="col-lg-2" style="margin-top: 50px;">文章分类：</div>
    <div class="col-lg-10" style="margin-top: 50px;">
        <select name="type" id="notice_select" class="selectpicker" style="width: 100%;">
            <option value="1" name="option1">最近活动</option>
            <option value="2" name="option2">实验项目简介及连接</option>
            <option value="3" name="option3">业内动态</option>
            <option value="4" name="option4">内部通知</option>
        </select>
    </div>
    <!--通知-->

    <div id="tongzhi">
        <!--标题-->
        <div class="col-lg-2" style="margin-top: 50px;">标题：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <input type="text" class="form-control" name="noticeTitle"
                   value="${article.type != 2 ? article.title: ""}"/>
        </div>

        <!--作者-->
        <div class="col-lg-2" style="margin-top: 50px;">作者：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <input type="text" class="form-control" name="noticeAuthor"
                   value="${article.type != 2 ? article.author: ""}"/>
        </div>

        <!--是否评论-->
        <div class="col-lg-2" style="margin-top: 50px;">是否可评论：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <label class="radio-inline">
                <input type="radio" ${article.flag == 1 ? "checked='checked'": ""} name="noticeFlag" id="flag_true"
                       value="1"> 是
            </label>
            <label class="radio-inline">
                <input type="radio" name="noticeFlag" ${article.flag == 2 ? "checked='checked'": ""} id="flag_false"
                       value="2"> 否
            </label>
        </div>

        <!--正文-->
        <div class="col-lg-2" style="margin-top: 50px;">内容：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <script id="container" name="content" type="text/plain">
${article.content}

            </script>
            <div id="editor1" type="text/plain" style="width:1109px;height:500px;"></div>
        </div>

        <!--确定-->
        <div class="col-lg-2" style="margin-top: 50px;"></div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <button class="btn btn-primary btn-block yz" onclick="submitHTML()">确定修改</button>
        </div>
    </div>

    <!--实验项目-->
    <div id="shiyan">

        <!--项目名称-->
        <div class="col-lg-2" style="margin-top: 50px;">项目名称：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <input type="text" class="form-control" name="projectTitle" placeholder="输入项目名称"/>
        </div>

        <!--项目简介-->
        <div class="col-lg-2" style="margin-top: 50px;">项目简介：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <script id="container2" name="content" type="text/plain">
            </script>
            <div id="editor2" type="text/plain" name="projectContent" style="width:1109px;height:500px;"></div>
        </div>

        <!--作者成员-->
        <div class="col-lg-2" style="margin-top: 50px;">项目成员：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <input type="text" class="form-control" name="projectAuthor" placeholder="输入内容"/>
        </div>

        <!--上限日期-->
        <div class="col-lg-2" style="margin-top: 50px;">上限日期：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <input class="form-control layer-date" name="limitData"
                   onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
            <label class="laydate-icon"></label>
        </div>

        <!--进入查看-->
        <div class="col-lg-2" style="margin-top: 50px;">进入查看：</div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <input type="text" class="form-control" name="look" placeholder="输入内容"/>
        </div>

        <!--是否评论-->
        <div class="col-lg-2" style="margin-top: 50px;">是否评论：</div>
        <div class="col-lg-10" style="margin-top: 50px;"><label class="radio-inline">
            <input type="radio" name="projectFlag" checked="checked" id="inlineRadio1" value="1"> 是
        </label>
            <label class="radio-inline">
                <input type="radio" name="projectFlag" id="inlineRadio2" value="2"> 否
            </label></div>

        <!--确定-->
        <div class="col-lg-2" style="margin-top: 50px;"></div>
        <div class="col-lg-10" style="margin-top: 50px;">
            <button class="btn btn-primary btn-block" onclick="submitHTML()">确定</button>
        </div>
    </div>
</div>
</body>
</html>