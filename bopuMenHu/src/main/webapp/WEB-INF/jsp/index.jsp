<%--
  Created by IntelliJ IDEA.
  User: shiku
  Date: 2018/5/27
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>boPuHome</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        /*背景色*/
        .gray-bg {
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

        .content {
            min-height: calc(100vh - 100px);
        }
        /*底部栏*/
        .footer {
            background-color: #1572DD;
            height: 150px;
            padding: 30px;
            display: flex;
            /*使子项目水平居中*/
            justify-content: center;
            /*使子项目垂直居中*/
            align-items: center;
        }

        .footer span {
            color: #fff;
            font-size: 16px;
        }
        /*中间宽度*/
        .cen {
            width: 90%;
        }
        /*轮播图*/
        .navbar > .container,
        .navbar > .container-fluid {
            display: block;
        }

        .carousel-inner img {
            width: 100%;
        }
        /*文章列表*/
        #list {
            justify-content: space-between;
        }

        .div_celebrity_list {
            width: 100%;
            overflow-y: scroll;
            padding: 30px;
        }

        .list-group-item {
            border-color: black;
            border-left-color: white;
            border-right-color: white;
        }
        /*第一行上面变白*/

        #list1 {
            border-color: white;
        }
        /*第八行上面变白*/

        #list8 {
            border-bottom-color: white;
        }
        /*查看更多*/

        #btnChuang {
            color: white;
            background-color: #1572DD;
            height: 40px;
            width: 296px;
            border-color: #1572DD;
        }
        /*滑动栏隐藏*/

        #div1 {
            overflow: hidden;
        }

        #div2 {
            overflow: hidden;
        }

        #div3 {
            overflow-y: inherit;
        }
    </style>
    <script>
        $(document).ready(function() {
            $("#myCarousel").carousel({
                interval: 1000
            });
        });
        $(document).ready(function() {

            $("#div4").height($("#div2").height());
        });
    </script>
</head>

<body class="gray-bg">
<header class="clearfix">
    <!-- 头部 -->

    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">

                <a class="navbar-brand" href="#">温州市波普大数据研究院</a>
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
    <br>	<br>
    <div class="cen center-block">

        <div id="myCarousel" class="carousel slide">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner" >
                <div class="item active">
                    <img src="${pageContext.request.contextPath}/picture/picture1.jpg" alt="1 slide">
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/picture/picture2.jpg" alt="2 slide">
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/picture/picture3.jpg" alt="3 slide">
                </div>
                </div>
            </div>
            <!-- 轮播（Carousel）导航 -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <br><br> 标题
        <hr>
        <br>
        <div class="row">
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <a href="查看文章.html"><img src="img/a1.jpg" alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>文章标题</h3>
                            <p>一些示例文本。一些示例文本。</p>

                        </div>
                    </a>
                </div>
            </div>
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <a href="查看文章.html">
                        <img src="img/a1.jpg" alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>文章标题</h3>
                            <p>一些示例文本。一些示例文本。</p>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <a href="查看文章.html">
                    <img src="img/a1.jpg" alt="通用的占位符缩略图">
                    <div class="caption">
                        <h3>文章标题</h3>
                        <p>一些示例文本。一些示例文本。</p>
                </a>
            </div>
        </div>
    </div>

    </div>
    <br><br>
    <hr>
    <br>
    <div class="thumbnail">
        <div id="div1" class="div_celebrity_list">
            <!--大的list-->

            <div class='div_celebrity_row'>
                <h1>我是标题</h1>

                <hr style="border:5px solid #DDDDDD" />
                <a href="查看文章.html" id="list1" class="list-group-item">1</a>
                <a href="查看文章.html" class="list-group-item">2</a>
                <a href="查看文章.html" class="list-group-item">3</a>
                <a href="查看文章.html" class="list-group-item">4</a>
                <a href="查看文章.html" class="list-group-item">5</a>
                <a href="查看文章.html" class="list-group-item">6</a>
                <a href="查看文章.html" class="list-group-item">7</a>
                <a href="查看文章.html" id="list8" class="list-group-item">8</a>
                <hr style="border:5px solid #DDDDDD" />
                <a href="文章列表.html"><input id="btnChuang" type="submit" class="btn-success" value="查看更多" /></a>
            </div>
        </div>
    </div>
    <br>
    <hr>
    <br>
    <!--小的list-->

    <div class="row">
        <div id="list">

            <div class="col-md-6 col-sm-12">
                <div class="thumbnail">
                    <div id="div2" class="div_celebrity_list">
                        <div class='div_celebrity_row'>
                            <h1>我是标题</h1>

                            <hr style="border:5px solid #DDDDDD" />
                            <a href="查看文章.html" id="list1" class="list-group-item">1</a>
                            <a href="查看文章.html" class="list-group-item">2</a>
                            <a href="查看文章.html" class="list-group-item">3</a>
                            <a href="查看文章.html" class="list-group-item">4</a>
                            <a href="查看文章.html" class="list-group-item">5</a>
                            <a href="查看文章.html" class="list-group-item">6</a>
                            <a href="查看文章.html" class="list-group-item">7</a>
                            <a href="查看文章.html" id="list8" class="list-group-item">8</a>
                            <hr style="border:5px solid #DDDDDD" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-12">
                <div class="thumbnail">
                    <div id="div4" class="div_celebrity_list">

                        <h1>我是标题</h1>

                        <hr style="border:5px solid #DDDDDD" />

                        <div class='div_celebrity_row'>

                            <p>java语言是简单的：JAVA语言的语法和c、c++很接近，使得大多数程序员很容易学习和使用。另一方面，java丢弃了c++中很少使用的、很难理解的、令人迷惑的那些特性。比如操作符重载、多继承、自动的强制类型转化。特别的，JAVA语言不使</p>
                            <p>用指针，而是引用。并且提供了自动的废料收集，使得程序员不必为内存管理而担忧。确实学过c、c++的人也知道，总是要担心内存。 JAVA语言是面向对象的：java语言提供类、接口和继承等面向对象的特性，为了简单起见，支持类之间的单继承，但支持接口之间的多继承，并且类与</p>
                            <p> 接口之间的实现机制（关键词为implements）。JAVA语言全面支持动态绑定，而c++语言只对虚函数使用动态绑定，总之，java语言是一个纯的面向对象程序设计语言。</p>
                            <p>java语言是简单的：JAVA语言的语法和c、c++很接近，使得大多数程序员很容易学习和使用。另一方面，java丢弃了c++中很少使用的、很难理解的、令人迷惑的那些特性。比如操作符重载、多继承、自动的强制类型转化。特别的，JAVA语言不使</p>
                            <p>用指针，而是引用。并且提供了自动的废料收集，使得程序员不必为内存管理而担忧。确实学过c、c++的人也知道，总是要担心内存。 JAVA语言是面向对象的：java语言提供类、接口和继承等面向对象的特性，为了简单起见，支持类之间的单继承，但支持接口之间的多继承，并且类与</p>
                            <p> 接口之间的实现机制（关键词为implements）。JAVA语言全面支持动态绑定，而c++语言只对虚函数使用动态绑定，总之，java语言是一个纯的面向对象程序设计语言。</p>

                        </div>

                        <hr style="border:5px solid #DDDDDD;" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <br><br>
</main>
<footer class="center-block footer">
    <div class="container">
        <div class="row center-block">
            <div class="col-md-6">
                <span>反馈邮箱：12345678@163.com &nbsp; &nbsp; &nbsp;联系方式：12345678911</span>
            </div>
            <div class="col-md-6">
                <span>@2018-2020 Wenzhou Demo Worker</span>
            </div>
        </div>
    </div>
</footer>
</body>

