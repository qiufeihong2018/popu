<%--
  Created by IntelliJ IDEA.
  User: shiku
  Date: 2018/6/8
  Time: 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DengLu</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <script src="/layui/layui.js" charset="utf-8"></script>
   
</head>

<body class="gray-bg">
<%-- <header class="clearfix">
    <!-- 头部 -->

    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">

                <a class="navbar-brand" href="主页.html">温州市波普大数据研究院</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                <ul class="nav navbar-nav navbar-right">

                    <li>
                        <a href="私信界面.html">私信</a>
                    </li>
                    <li class="divider"></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人中心 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/passwordChange">修改密码</a></li>
                            <li><a href="${pageContext.request.contextPath}/personChange">修改信息</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
</header> --%>

<!-- 引入header.jsp -->
<jsp:include page="header.jsp" flush="true"></jsp:include>
<main class="content">
    <div id="biaodan">
      <h1>头像修改</h1>
        <hr />
        <div class="layui-upload">
            <form action="${pageContext.request.contextPath}/user/picChange" method="post">
                <input type="hidden" name="id" value="${user.id}">
                <input type="hidden" id="inputHead" name="pic" value="${user.pic}">
           <!--      <button id="btnChuang" type="button" class="btn btn-success" id="test1">上传图片</button><br><br> -->
                <div class="layui-upload-list" >
                    <img src="${user.pic}" class="layui-upload-img imgSize" id="head">
                    <div style = "text-align:right;margin-top: -20px">
                    
             <!--     	<input id="btnChuang" type="submit" class="btn btn-success" value="确定" />
                 		<input id="btnChuang" type="button" class="btn btn-success" value="上传图片" /> -->
                    </div>
                    <p id="demoText"></p>
                </div>
                
                <br>
                	<div class="row">
						<div class="col-xs-6  col-sm-6 col-md-6 col-lg-6">
							<input id="btnChuang" type="submit" class="btn btn-success" value="上传图片" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">

							<input id="btnChuang" type="button" class="btn btn-success" value="确定" />
						</div>
					</div>
                
            </form>
        </div>
        <hr />
        <div class="picDiv">
            <img class="sysPic" src="${pageContext.request.contextPath}/img/1.jpg">&nbsp;
            <img class="sysPic" src="${pageContext.request.contextPath}/img/2.jpg">&nbsp;
            <img class="sysPic" src="${pageContext.request.contextPath}/img/3.jpg">&nbsp;
            <img class="sysPic" src="${pageContext.request.contextPath}/img/4.jpg">&nbsp;
            <img class="sysPic" src="${pageContext.request.contextPath}/img/5.jpg">&nbsp;
            <img class="sysPic" src="${pageContext.request.contextPath}/img/6.jpg">&nbsp;
            <img class="sysPic" src="${pageContext.request.contextPath}/img/7.jpg">&nbsp;
            <img class="sysPic" src="${pageContext.request.contextPath}/img/8.jpg">&nbsp;
            <img class="sysPic" src="${pageContext.request.contextPath}/img/9.jpg">&nbsp;
            <img class="sysPic" src="${pageContext.request.contextPath}/img/10.jpg">&nbsp;
        </div>
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
        /*头部样式*/

        header .navbar-default {
            background-color: #1572DD;
        }

        header .navbar-brand {
            color: #fff !important;
        }

        .navbar-default .navbar-toggle .icon-bar {
            background-color: #fff !important;
        }

        .navbar-default .navbar-nav > li > a {
            color: #fff !important;
        }

        .navbar-default .navbar-nav > li > a:focus,
        .navbar-default .navbar-nav > li > a:hover {
            color: #eee !important;
        }
        /*中间内容*/

        .content {
            text-align: center;
            display: flex;
            /*使子项目水平居中*/
            justify-content: center;
            /*使子项目垂直居中*/
            align-items: center;
        }

        /*文本框*/

        .form-control {
            display: inline-block;
            width: 296px;
        }
        /*创建样式*/

        #btnChuang {
            text-align: center;
            color: white;
            background-color: #1572DD;
            height: 40px;
          /*   width: 196px; */
          width: 81.6px;
            border-color: #1572DD;
        }
        /*验证文字样式*/

        #account,
        #password,
        #name,
        #phone,
        #work,
        #Email {
            color: red;
        }
        /*表单背景*/

        #biaodan {
            width: 860px;
            height: 100%;
            background-color: white;
        }
        .imgSize{
            width: 200px;
            height: 200px;
            border-radius: 100%;
        }

        .picDiv{
            margin: 20px;
            border-radius: 10px;
            background: #F5F5F5;
        }
        .sysPic{
            height: 120px;
            width: 120px;
            margin: 10px;
            border:1px solid black;
        }
        .sysPic:hover
        {
            border:1px solid red;
        }
    </style>

    <script>

        $(document).ready(function(){
            $(".sysPic").click(
                function () {
                    $(".sysPic").css("border","1px solid black");
                    $(this).css("border","1px solid red");
                    $("#head").attr("src",$(this).attr("src"));
                    $("#inputHead").val($(this).attr("src"));
                });

        });


        layui.use('upload', function(){
            var $ = layui.jquery
                ,upload = layui.upload;

            //普通图片上传
            var uploadInst = upload.render({
                elem: '#test1'
                ,url: '/upload'
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#demo1').attr('src', result); //图片链接（base64）
                    });
                }
                ,done: function(data){
                    if(data["status"]==200){
                        $("#inputHead").val(data["message"]);
                        $("#head").attr("src",data["message"]);
                    }else{//如果上传失败
                        return layer.msg('上传失败');
                    }
                    //上传成功
                }
                ,error: function(data){
                    console.log(data);
                    //演示失败状态，并实现重传
                    var demoText = $('#demoText');
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function(){
                        uploadInst.upload();
                    });
                },success: function (data) {console.log("success");
                    if(data["status"]==200){console.log("-----");
                        console.log(data["message"]);
                    }else{
                        var demoText = $('#demoText');
                        demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                        demoText.find('.demo-reload').on('click', function(){
                            uploadInst.upload();
                        });
                    }


                }
            });

            //多图片上传
            upload.render({
                elem: '#test2'
                ,url: '/upload/'
                ,multiple: true
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                    });
                }
                ,done: function(res){
                    //上传完毕
                }
            });

            //指定允许上传的文件类型
            upload.render({
                elem: '#test3'
                ,url: '/upload/'
                ,accept: 'file' //普通文件
                ,done: function(res){
                    console.log(res)
                }
            });
        });



    //    ------------

    </script>