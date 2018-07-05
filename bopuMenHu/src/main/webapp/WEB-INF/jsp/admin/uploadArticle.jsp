<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/10
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
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
   <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 改成你的路径 -->

<!-- 自定义js -->
<script src="${pageContext.request.contextPath}/js/content.js"></script>

</head>
<body class="gray-bg">
	<div class="div1">
		<br> <br>
		<input id="date" name="limitData" placeholder="点击选择日期" type="text"
					class="demo-input" onfocus="showTips('date','上限日期必填!')"
					onblur="check('date','上限日期不能为空！')" style="width: 100%;" />
		<h1>发布文章</h1>

		<hr style="border:5px solid #DDDDDD" />
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
		<div class="col-lg-2" style="margin-top: 50px;"></div>
			<div class="col-lg-10" style="margin-top: 50px;"></div>
		<!--通知-->

		<div id="tongzhi">
			<!--标题-->
			<div class="col-lg-2" style="margin-top: 50px;">标题：</div>
			<div class="col-lg-10" style="margin-top: 50px;">
				<input id="title" name="noticeTitle" type="text"
					class="form-control" placeholder="请输入标题"
					onfocus="showTips('title','标题必填!')"
					onblur="check('title','标题不能为空！')" /> <br> <span id="titlespan"></span>
				<br>

			</div>


			<!--作者-->
			<div class="col-lg-2" style="margin-top: 50px;">作者：</div>
			<div class="col-lg-10" style="margin-top: 50px;">

				<input id="author" name="noticeAuthor" value="admin" type="text"
					class="form-control" onfocus="showTips('author','作者必填!')"
					onblur="check('author','作者不能为空！')" /> <br> <span
					id="authorspan"></span> <br>
			</div>

			<!-- 正文 -->
			<div class="col-lg-2" style="margin-top: 50px;">内容：</div>
			<div class="col-lg-10" style="margin-top: 50px;">
				<div id="container2" type="text/plain"
					style="width:100%;height:500px;"></div>
			</div>

			<!--是否评论-->
			<div class="col-lg-2" style="margin-top: 50px;">是否可评论：</div>
			<div class="col-lg-10" style="margin-top: 50px;">
				<label class="radio-inline"> <input type="radio"
					name="noticeFlag" checked="checked" value="1"> 是
				</label> <label class="radio-inline"> <input type="radio"
					name="noticeFlag" value="2"> 否
				</label>
			</div>

			<!--确定-->
			<div class="col-lg-2" style="margin-top: 50px;"></div>
			<div class="col-lg-10" style="margin-top: 50px;">
				<button class="btn btn-primary btn-block" onclick="submitHTML1()">确定</button>
			</div>
			<!--换行-->
			<div class="col-lg-2" style="margin-top: 50px;"></div>
			<div class="col-lg-10" style="margin-top: 50px;"></div>
		</div>

		<!--实验项目-->
		<div id="shiyan">
			<!--项目名称-->
			<div class="col-lg-2" style="margin-top: 50px;">项目名称：</div>
			<div class="col-lg-10" style="margin-top: 50px;">
				<input id="itemName" name="projectTitle" type="text"
					class="form-control" placeholder="请输入项目名"
					onfocus="showTips('itemName','项目名称必填!')"
					onblur="check('itemName','项目名称不能为空！')" /> <br> <span
					id="itemNamespan"></span> <br>
			</div>

			<!--项目简介-->
			<div class="col-lg-2" style="margin-top: 50px;">项目简介：</div>
			<div class="col-lg-10" style="margin-top: 50px;">
				<div id="container" type="text/plain"
					style="width:100%;height:500px;"></div>
			</div>

			<!--项目成员-->
			<div class="col-lg-2" style="margin-top: 50px;">项目成员：</div>
			<div class="col-lg-10" style="margin-top: 50px;">
				<input id="author2" name="projectAuthor" placeholder="成员名(请用空格隔开)"
					type="text" class="form-control"
					onfocus="showTips('author2','作者成员必填!')"
					onblur="check('author2','作者成员不能为空！')" /> <br> <span
					id="author2span"></span> <br>
			</div>

			<!--上限日期-->
			<div class="col-lg-2" style="margin-top: 50px;">上限日期：</div>
			<div class="col-lg-10" style="margin-top: 50px;">
				<!--							<input type="text" class="demo-input" placeholder="请选择日期" id="test1" style="width: 100%;">-->
				<input id="date" name="limitData" placeholder="点击选择日期" type="text"
					class="demo-input" onfocus="showTips('date','上限日期必填!')"
					onblur="check('date','上限日期不能为空！')" style="width: 100%;" /> <br>
				<span id="datespan"></span> <br>

			</div>

			<!--进入查看-->
			<div class="col-lg-2" style="margin-top: 50px;">进入查看：</div>
			<div class="col-lg-10" style="margin-top: 50px;">
				<input id="look" name="look" value="http://" type="text"
					class="form-control" onfocus="showTips('look','进入查看必填!')"
					onblur="check('look','进入查看不能为空！')" /> <br> <span id="lookspan"></span>
				<br>
			</div>

			<!--是否评论-->
			<div class="col-lg-2" style="margin-top: 50px;">是否评论：</div>
			<div class="col-lg-10" style="margin-top: 50px;">
				<label class="radio-inline"> <input type="radio"
					name="projectFlag" checked="checked" value="1"> 是
				</label> <label class="radio-inline"> <input type="radio"
					name="projectFlag" value="2"> 否
				</label>
			</div>


			<div class="col-lg-2" style="margin-top: 50px;"></div>
			<div class="col-lg-10" style="margin-top: 50px;">
				<!--      <button class="btn btn-primary btn-block" onclick="submitHTML()" type="submit">确定</button> -->
				<input type="submit" class="btn btn-primary btn-block"
					onclick="submitHTML2()" value="确定">
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
    $(function () {
        $("#shiyan").hide();
        $("select").bind("change", function () {
            if (this.value == "2") {
                $("#tongzhi").hide();
                $("#shiyan").show();
            } else {

                $("#shiyan").hide();
                $("#tongzhi").show();
            }
        })
    });
    //富文本框
    var ue = UE.getEditor('container');
    var ue2 = UE.getEditor('container2');

    ue.ready(function () {
        ue.setContent("在此编辑文章");
    });
    ue2.ready(function () {
        ue2.setContent("在此编辑文章");
    });

    //		日期
    lay('#version').html('-v' + laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#date' //指定元素
        , type: 'datetime'
    });

    //不为空验证
    function showTips(id, info) {
        document.getElementById(id + "span").innerHTML = "<font color='gray'>" + info + "</font>";
    }

    function check(id, info) {
        //1.获取用户输入的用户名数据
        var uValue = document.getElementById(id).value;
        //2.进行校验
        if (uValue == "") {
            document.getElementById(id + "span").innerHTML = "<font color='red'>" + info + "</font>";
        } else {
            document.getElementById(id + "span").innerHTML = "";
        }
    }

    function submitHTML1() {
     if (this.value == "2") {}
        if($("#title").val()==""){
    
    parent.layer.alert("标题不能为空");
    $("#title").focus();
   
    }else if($("#author").val()==""){
      parent.layer.alert("作者不能为空");
    $("#author").focus();
    
    } /* else if($("#itemName").val()==""){
    
    alert("项目名称不能为空");
    $("#itemName").focus();
   
    }else if($("#author2").val()==""){
      alert("项目成员不能为空");
    $("#author2").focus();
    
    }else if($("#date").val()==""){
    
    alert("上限日期不能为空");
    $("#date").focus();
   
    } */
    else {
    
        // 获取编辑器中的html
        var html = ue.getContent();
        // 返回成功跳转 页面 => 跳转到文章阅读页面

        var type = $("#notice_select option:selected").val();
        if (type == 2) {
            var title = $("input[name='projectTitle']").val();
            var html = ue.getContent();
            var author = $("input[name='projectAuthor']").val();
            var flag = $("input[name='projectFlag']:checked").val();
            var look = $("input[name='look']").val();
            var limitData = $("input[name='limitData']").val();
            $.post("${pageContext.request.contextPath}/article/upload", {
                type: type,
                title: title,
                content: html,
                author: author,
                flag: flag,
                look: look,
                limitdata: limitData
            }, function (result) {
                if (result["status"] == 200) {
                    top.location.href = "${pageContext.request.contextPath}/article/show?articleId=" + result["message"];
                } else {
                    // 提交失败
                }
            });
        } else {
            var title = $("input[name='noticeTitle']").val();
            var author = $("input[name='noticeAuthor']").val();
            var flag = $("input[name='noticeFlag']:checked").val();
            html = ue2.getContent();
            $.post("${pageContext.request.contextPath}/article/upload", {
                type: type,
                title: title,
                content: html,
                author: author,
                flag: flag
            }, function (result) {
                if (result["status"] == 200) {
                    top.location.href = "${pageContext.request.contextPath}/article/show?articleId=" + result["message"];
                } else {
                    //     提交失败
                }
            });
        }
        }
    }
      function submitHTML2() {
   /*   if (this.value == "2") {}
        if($("#title").val()==""){
    
    alert("标题不能为空");
    $("#title").focus();
   
    }else if($("#author").val()==""){
      alert("作者不能为空");
    $("#author").focus();
    
    } */  if($("#itemName").val()==""){
    
    parent.layer.alert("项目名称不能为空");
    $("#itemName").focus();
   
    }else if($("#author2").val()==""){
      parent.layer.alert("项目成员不能为空");
    $("#author2").focus();
    
    }else if($("#date").val()==""){
    
    parent.layer.alert("上限日期不能为空");
    $("#date").focus();
   
    }
    else {
    
        // 获取编辑器中的html
        var html = ue.getContent();
        // 返回成功跳转 页面 => 跳转到文章阅读页面

        var type = $("#notice_select option:selected").val();
        if (type == 2) {
            var title = $("input[name='projectTitle']").val();
            var html = ue.getContent();
            var author = $("input[name='projectAuthor']").val();
            var flag = $("input[name='projectFlag']:checked").val();
            var look = $("input[name='look']").val();
            var limitData = $("input[name='limitData']").val();
            $.post("${pageContext.request.contextPath}/article/upload", {
                type: type,
                title: title,
                content: html,
                author: author,
                flag: flag,
                look: look,
                limitdata: limitData
            }, function (result) {
                if (result["status"] == 200) {
                    top.location.href = "${pageContext.request.contextPath}/article/show?articleId=" + result["message"];
                } else {
                    // 提交失败
                }
            });
        } else {
            var title = $("input[name='noticeTitle']").val();
            var author = $("input[name='noticeAuthor']").val();
            var flag = $("input[name='noticeFlag']:checked").val();
            html = ue2.getContent();
            $.post("${pageContext.request.contextPath}/article/upload", {
                type: type,
                title: title,
                content: html,
                author: author,
                flag: flag
            }, function (result) {
                if (result["status"] == 200) {
                    top.location.href = "${pageContext.request.contextPath}/article/show?articleId=" + result["message"];
                } else {
                    //     提交失败
                }
            });
        }
        }
    }
</script>


