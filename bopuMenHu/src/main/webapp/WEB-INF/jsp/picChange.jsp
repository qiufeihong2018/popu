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
            width: 296px;
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
            height: 900px;
            background-color: white;
        }
    </style>

    <script>
        window.onload = function() {
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
                /*
            html元素不存在width属性,只有clientWidth
            offsetX是相对当前元素的,clientX和pageX是相对其父元素的

            touches：表示当前跟踪的触摸操作的touch对象的数组。
            targetTouches：特定于事件目标的Touch对象的数组。
        　　changedTouches：表示自上次触摸以来发生了什么改变的Touch对象的数组。
            */
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
        //
        //			function CheckInput(inputField, helpText) {
        //				if(inputField.value.length == 0) {
        //					if(helpText != null) {
        //						helpText.innerHTML = "不能为空，请输入";
        //
        //					}
        //					return false;
        //				} else {
        //					if(helpText != null) {
        //						helpText.innerHTML = "";
        //
        //					}
        //					return true;
        //				}
        //			}

        //不为空验证
        function showTips(id, info) {
            document.getElementById(id + "span").innerHTML = "<font color='gray'>" + info + "</font>";
        }

        function check(id, info) {
            //1.获取用户输入的用户名数据
            var uValue = document.getElementById(id).value;
            //2.进行校验
            if(uValue == "") {
                document.getElementById(id + "span").innerHTML = "<font color='red'>" + info + "</font>";
            } else {
                document.getElementById(id + "span").innerHTML = "";
            }
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
</header>

<main class="content">
    <div id="biaodan">
      <h1>头像修改</h1>
    </div>
</main>

</body>

</html>