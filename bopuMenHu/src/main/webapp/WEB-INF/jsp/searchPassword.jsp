<%--
  Created by IntelliJ IDEA.
  User: shiku
  Date: 2018/6/4
  Time: 15:02
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
            min-height: calc(100vh - 20px);
            display: flex;
            /*使子项目水平居中*/
            justify-content: center;
            /*使子项目垂直居中*/
            align-items: center;
        }

        /*滑动验证容器*/
        /*滑动控件容器,亮灰色背景 */

        #dragContainer {
            position: relative;
            display: inline-block;
            background: #e8e8e8;
            width: 296px;
            height: 50px;
            border: 2px solid #e8e8e8;
        }
        /* 滑块左边部分,绿色背景 */

        #dragBg {
            position: absolute;
            background-color: #7ac23c;
            width: 0px;
            height: 100%;
        }
        /* 滑动验证容器文本 */

        #dragText {
            position: absolute;
            width: 100%;
            height: 100%;
            /* 文字水平居中 */
            text-align: center;
            /* 文字垂直居中,这里不能用百分比,因为百分比是相对原始line-height的,而非div高度 */
            line-height: 50px;
            /* 文本不允许选中 */
            user-select: none;
            -webkit-user-select: none;
        }
        /* 滑块 */

        #dragHandler {
            position: absolute;
            width: 50px;
            height: 100%;
            cursor: move;
        }
        /* 滑块初始背景 */

        .dragHandlerBg {
            background: #fff no-repeat center url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0ZDhlNWY5My05NmI0LTRlNWQtOGFjYi03ZTY4OGYyMTU2ZTYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NTEyNTVEMURGMkVFMTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NTEyNTVEMUNGMkVFMTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo2MTc5NzNmZS02OTQxLTQyOTYtYTIwNi02NDI2YTNkOWU5YmUiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NGQ4ZTVmOTMtOTZiNC00ZTVkLThhY2ItN2U2ODhmMjE1NmU2Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+YiRG4AAAALFJREFUeNpi/P//PwMlgImBQkA9A+bOnfsIiBOxKcInh+yCaCDuByoswaIOpxwjciACFegBqZ1AvBSIS5OTk/8TkmNEjwWgQiUgtQuIjwAxUF3yX3xyGIEIFLwHpKyAWB+I1xGSwxULIGf9A7mQkBwTlhBXAFLHgPgqEAcTkmNCU6AL9d8WII4HOvk3ITkWJAXWUMlOoGQHmsE45ViQ2KuBuASoYC4Wf+OUYxz6mQkgwAAN9mIrUReCXgAAAABJRU5ErkJggg==");
        }
        /* 验证成功时的滑块背景 */

        .dragHandlerOkBg {
            background: #fff no-repeat center url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0ZDhlNWY5My05NmI0LTRlNWQtOGFjYi03ZTY4OGYyMTU2ZTYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDlBRDI3NjVGMkQ2MTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDlBRDI3NjRGMkQ2MTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDphNWEzMWNhMC1hYmViLTQxNWEtYTEwZS04Y2U5NzRlN2Q4YTEiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NGQ4ZTVmOTMtOTZiNC00ZTVkLThhY2ItN2U2ODhmMjE1NmU2Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+k+sHwwAAASZJREFUeNpi/P//PwMyKD8uZw+kUoDYEYgloMIvgHg/EM/ptHx0EFk9I8wAoEZ+IDUPiIMY8IN1QJwENOgj3ACo5gNAbMBAHLgAxA4gQ5igAnNJ0MwAVTsX7IKyY7L2UNuJAf+AmAmJ78AEDTBiwGYg5gbifCSxFCZoaBMCy4A4GOjnH0D6DpK4IxNSVIHAfSDOAeLraJrjgJp/AwPbHMhejiQnwYRmUzNQ4VQgDQqXK0ia/0I17wJiPmQNTNBEAgMlQIWiQA2vgWw7QppBekGxsAjIiEUSBNnsBDWEAY9mEFgMMgBk00E0iZtA7AHEctDQ58MRuA6wlLgGFMoMpIG1QFeGwAIxGZo8GUhIysmwQGSAZgwHaEZhICIzOaBkJkqyM0CAAQDGx279Jf50AAAAAABJRU5ErkJggg==");
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
        window.onload = function() {
            /*
            html元素不存在width属性,只有clientWidth
            offsetX是相对当前元素的,clientX和pageX是相对其父元素的

            touches：表示当前跟踪的触摸操作的touch对象的数组。
            targetTouches：特定于事件目标的Touch对象的数组。
        　　changedTouches：表示自上次触摸以来发生了什么改变的Touch对象的数组。
            */
            var dragContainer = document.getElementById("dragContainer");
            var dragBg = document.getElementById("dragBg");
            var dragText = document.getElementById("dragText");
            var dragHandler = document.getElementById("dragHandler");

            //滑块最大偏移量
            var maxHandlerOffset = dragContainer.clientWidth - dragHandler.clientWidth;
            //是否验证成功的标记
            var isVertifySucc = false;
            initDrag();

            function initDrag() {
                dragText.textContent = "拖动滑块验证";
                dragHandler.addEventListener("mousedown", onDragHandlerMouseDown);

                dragHandler.addEventListener("touchstart", onDragHandlerMouseDown);
            }

            function onDragHandlerMouseDown(event) {
                document.addEventListener("mousemove", onDragHandlerMouseMove);
                document.addEventListener("mouseup", onDragHandlerMouseUp);

                document.addEventListener("touchmove", onDragHandlerMouseMove);
                document.addEventListener("touchend", onDragHandlerMouseUp);
            }

            function onDragHandlerMouseMove(event) {

                var left = (event.clientX || event.changedTouches[0].clientX) - dragHandler.clientWidth / 2;
                if(left < 0) {
                    left = 0;
                } else if(left > maxHandlerOffset) {
                    left = maxHandlerOffset;
                    verifySucc();
                }
                dragHandler.style.left = left + "px";
                dragBg.style.width = dragHandler.style.left;
            }

            function onDragHandlerMouseUp(event) {
                document.removeEventListener("mousemove", onDragHandlerMouseMove);
                document.removeEventListener("mouseup", onDragHandlerMouseUp);

                document.removeEventListener("touchmove", onDragHandlerMouseMove);
                document.removeEventListener("touchend", onDragHandlerMouseUp);

                dragHandler.style.left = 0;
                dragBg.style.width = 0;
            }

            //验证成功
            function verifySucc() {
                isVertifySucc = true;
                dragText.textContent = "验证通过";
                dragText.style.color = "white";
                dragHandler.setAttribute("class", "dragHandlerOkBg");

                dragHandler.removeEventListener("mousedown", onDragHandlerMouseDown);
                document.removeEventListener("mousemove", onDragHandlerMouseMove);
                document.removeEventListener("mouseup", onDragHandlerMouseUp);

                dragHandler.removeEventListener("touchstart", onDragHandlerMouseDown);
                document.removeEventListener("touchmove", onDragHandlerMouseMove);
                document.removeEventListener("touchend", onDragHandlerMouseUp);
            };
        }
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

                }
                return true;
            }
        }
        //修改密码
        function changePwd() {
            var pwd = $("input[name='name']").val();
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/user/changePassword",
                data: {id:${id},password:pwd},
                dataType: "json",
                success: function (data) {
                    if(data["status"]==200){
                        alert("修改成功");
                        window.location.href="${pageContext.request.contextPath}/login";
                    }
                    if(data["status"]!=200){
                        alert(data["message"]);
                        window.location.href="${pageContext.request.contextPath}/searchAccount";
                    }
                }
            });
        }
    </script>
</head>

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
                        <a href="私信界面.html">私信</a>
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

<main class="content">
    <div id="biaodan">
        <form action="" method="post" name="form1" target="_blank" id="form1" onSubmit="return check_login()">

            <br>
            <br><br><br>
            <h1>输入账号</h1>
            <hr>
            <br>
            <span style="margin-left: -117px;">请输入要重置的密码</span><br><br>
            <input type="text" name="name" class="form-control" onblur="CheckInput(this,document.getElementById('username'))" placeholder="密码" />
            <br>
            <span id="username"></span>
            <br>

            <!--滑动验证-->
            <div id="dragContainer">
                <div id="dragBg"></div>
                <div id="dragText"></div>
                <div id="dragHandler" class="dragHandlerBg"></div>
            </div>
            <br> <br> <br>
            <input id="btnOk" onclick="changePwd()" class="btn btn-success" value="下一步" />
            <br> <br>

        </form>
    </div>
</main>

</body>

</html>
