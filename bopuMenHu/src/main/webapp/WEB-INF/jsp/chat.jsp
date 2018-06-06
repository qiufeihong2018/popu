<%--
  Created by IntelliJ IDEA.
  User: shiku
  Date: 2018/6/6
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>私信界面</title>

    <!-- Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /*背景色*/

        .gray-bg {
            background-color: #f3f3f4;
        }
        /*左右固定*/

        html,
        body {
            overflow-x: hidden;
        }
        /*确认蓝色*/
        #btn{
            background-color:#1572DD;
            border-color:#1572DD;
            color: white;
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
        /*中间部分*/
        .content {
            min-height: calc(100vh - 100px);
        }

        .wrapper-content {
            padding: 20px;
        }

        .row {
            margin-right: 15px;
            margin-left: 15px;
        }

        .chat-view {
            z-index: 20012;
        }

        .ibox {
            clear: both;
            margin-bottom: 25px;
            margin-top: 0;
            padding: 0;
        }

        .ibox-title {
            -moz-border-bottom-colors: none;
            -moz-border-left-colors: none;
            -moz-border-right-colors: none;
            -moz-border-top-colors: none;
            background-color: #fff;
            border-color: #e7eaec;
            -webkit-border-image: none;
            -o-border-image: none;
            border-image: none;
            border-style: solid solid none;
            border-width: 4px 0 0;
            color: inherit;
            margin-bottom: 0;
            padding: 14px 15px 7px;
            min-height: 48px;
            background-color: #1572DD;
            color: white;
        }

        .pull-right {
            float: right!important;
        }

        .small,
        small {
            font-size: 85%;
        }
        /*聊天窗口以下的代码*/

        .ibox-content {
            background-color: #fff;
            color: inherit;
            padding: 15px 20px 20px;
            border-color: #e7eaec;
            -webkit-border-image: none;
            -o-border-image: none;
            border-image: none;
            border-style: solid solid none;
            border-width: 1px 0;
        }

        img {
            vertical-align: middle;
        }

        a {
            color: #337ab7;
            text-decoration: none;
        }
        /*下面的输入框*/

        .row {
            margin-right: -15px;
            margin-left: -15px;
        }

        .form-control,
        .single-line {
            background-color: #FFF;
            background-image: none;
            border: 1px solid #e5e6e7;
            border-radius: 1px;
            color: inherit;
            display: block;
            padding: 6px 12px;
            -webkit-transition: border-color .15s ease-in-out 0s, box-shadow .15s ease-in-out 0s;
            transition: border-color .15s ease-in-out 0s, box-shadow .15s ease-in-out 0s;
            width: 100%;
            font-size: 14px;
        }

        .ibox-content {
            padding: 0
        }




        .message-date {
            font-size: 10px;
            color: #888
        }

        .message-content {
            display: block
        }

        .chat-discussion {
            background: #eee;
            padding: 15px;
            height: 400px;
            overflow-y: auto
        }
        /*控制头像的圆弧和方向 在2n则右，2n+1则左*/

        .img-circle {
            float: right;
            margin-left: 1px
        }

        .message {
            background-color: #fff;
            border: 1px solid #e7eaec;
            text-align: left;
            display: block;
            padding: 10px 20px;
            position: relative;
            border-radius: 4px
        }

        .chat-message-left {
            padding: 10px 20px
        }
        .chat-message-right {
            padding: 10px 20px
        }

        .chat-discussion .chat-message-left .img-circle {
            float: left;
            margin-right: 10px
        }

        .chat-discussion .chat-message-right .message {
            text-align: right;
            margin-right: 55px
        }

        .chat-discussion .chat-message-left .message-date {
            float: right
        }

        .chat-discussion .chat-message-right .message-date {
            float: left
        }

        .chat-discussion .chat-message-left .message {
            text-align: left;
            margin-left: 55px
        }

        .chat-discussion .chat-message-right



    </style>

    <script>
        /*window.onload = function() {
            var text = document.getElementById('input_msg');
            var btn = document.getElementById('btn');
            var content = document.getElementById('msg_board');
            btn.onclick = function() {
                if(text.value == '') {
                    alert('不能发送空消息');
                } else {
                    /!* content.innerHTML += '<img id="imgcircle" class="img-circle" src="img/a4.jpg" alt="" style="width=48px;height: 48px;"><div class="message"> <a class="message-author" href="#"> 罗永浩 </a><span class="message-date">  2018-02-02  </span><span class="message-content">'+text.value+'</span></div>';*!/
                    content.innerHTML += '<div class="chat-message"><img class="img-circle" src="img/1.jpg" alt="" style="width=48px;height: 48px;"><div class="message"><a class="message-author" href="#"> 雷军</a><span class="message-date"> 2018-02-02  </span><span class="message-content">' + text.value + '</span></div></div>';
                    content.scrollTop = content.scrollHeight;
                }
            }
        }*/
        $(document).ready(function(){
            $("#quxiaobtn").click(function(){
                $("#text").val('');
            });
            initWebSocket();
        });


        <!-- 聊天js -->
        var webSocket;

        function send_msg() {
            if (webSocket != null) {
                var input_msg = document.getElementById("input_msg").value.trim();
                if (input_msg == "") {
                    return;
                }
                webSocket.send(input_msg);
                // 清除input框里的信息
                document.getElementById("input_msg").value = "";
            } else {
                alert("您已掉线，请重新进入聊天室...");
            }
        };

        function closeWs() {
            webSocket.close();
        };

        function initWebSocket() {
            /*var roomName = document.getElementById("input_roomName").value;
            // 房间名不能为空
            if (roomName == null || roomName == "") {
                alert("请输入房间名");
                return;
            }*/
            if ("WebSocket" in window) {
//            alert("您的浏览器支持 WebSocket!");
                if (webSocket == null) {
                    var url = "ws://localhost:8080/webSocket/chat/${roomId}/${user.id}/${user.name}/${otherUserName}";
                    // 打开一个 web socket
                    webSocket = new WebSocket(url);
                } else {
                    alert("您已进入聊天室...");
                }

                webSocket.onopen = function () {
                    alert("已进入聊天室，畅聊吧...");
                };

                webSocket.onmessage = function (evt) {
                    var msg_board = document.getElementsByClassName("msg_board")[0];
                    var received_msg = evt.data;
                    var old_msg = msg_board.innerHTML;
                    msg_board.innerHTML  = old_msg + received_msg ;
                    // 让滚动块往下移动
                    msg_board.scrollTop = msg_board.scrollHeight;
                };

                webSocket.onclose = function () {
                    // 关闭 websocket，清空信息板
                    alert("连接已关闭...");
                    webSocket = null;
                    document.getElementsByClassName("msg_board")[0].innerHTML = "";
                };
            }
            else {
                // 浏览器不支持 WebSocket
                alert("您的浏览器不支持 WebSocket!");
            }
        }
    </script>

</head>

<!--背景色-->

<body class="gray-bg">
<header class="clearfix">
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
                        <a href="search.html">私信</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="个人中心.html">个人中心</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<!--整体布局-->
&nbsp;&nbsp;&nbsp;&nbsp;
<label>房间名</label>
<input id="input_roomName" style="width: 10em" type="text"  placeholder="房间号">
<input class="btn btn-default" type="button" value="进入聊天室" onclick="initWebSocket()">
<input class="btn btn-default" type="button" value="退出聊天室" onclick="closeWs()">
<div id="zhongjian">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">

                <div class="ibox chat-view ">

                    <div class="ibox-title">
                        <small class="pull-right text-muted" style="color: #fff;">最新消息：2018-02-02 </small> 聊天窗口
                    </div>

                    <div class="ibox-content col-lg-12">

                        <div class="row">

                            <div class="col-md-12 ">
                                <div id="msg_board" class="chat-discussion msg_board">


                                    <%--<div class="chat-message-left"><img class="img-circle" src="/img/1.jpg" alt="" style="width:48px;height: 48px;"><div class="message"><a class="message-author" href="#"> 雷军</a><span class="message-date"> 2018-02-02  </span><span class="message-content">123213</span></div></div>
                                    <div class="chat-message-right"><img class="img-circle" src="/img/2.jpg" alt="" style="width:48px;height: 48px;"><div class="message"><a class="message-author" href="#"> 雷军</a><span class="message-date"> 2018-02-02  </span><span class="message-content">123213</span></div></div>
                                    <div class="chat-message-left"><img class="img-circle" src="/img/1.jpg" alt="" style="width:48px;height: 48px;"><div class="message"><a class="message-author" href="#"> 雷军</a><span class="message-date"> 2018-02-02  </span><span class="message-content">123213</span></div></div>
                                --%>
                                </div>

                            </div>

                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="chat-message-form">

                                    <div class="form-group">

                                        <textarea id="input_msg" class="form-control message-input" name="message" placeholder="输入消息内容"></textarea>

                                        <div class="buttongroup" style="float: right;">

                                            <input id="quxiaobtn" type="reset" class="btn btn-default" value="取消" />
                                            &nbsp;&nbsp;
                                            <input id="btn"  type="button" onclick="send_msg()" class="btn btn-default" value="确定" />

                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</div>
</body>

</html>
