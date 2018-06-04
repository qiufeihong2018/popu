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
    <!--<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
         <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
          <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">-->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!--<script src="js/bootstrap.min.js"></script>-->
    <style type="text/css">
        /*左右固定*/
        html,body {
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

        .navbar-default .navbar-nav>li>a {
            color: #fff !important;
        }

        .navbar-default .navbar-nav>li>a:focus,
        .navbar-default .navbar-nav>li>a:hover {
            color: #eee !important;
        }
        .content{


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

        .cen{width: 90%;}

        .carousel-inner img {
            width: 100%;
            height: 100%;
        }

        .navbar > .container, .navbar > .container-fluid{
            display: block;
        }

        .carousel-inner img {
            width:100%;

        }

        #wrap{
            display: flex;
            justify-content: space-between;
        }

        #list{
            display: flex;
            justify-content: space-between;
        }

        .div_celebrity_list{
            width:100%;
            height:200px;
            overflow-y:scroll;
            padding:4px;
            border:2px dashed #aaa;
        }

        .div_celebrity_row{
            margin:8px;
        }
        .list-group-item{
            border-style:dashed;
            border-color: deepskyblue;
            border-left-color:white ;
            border-right-color:white ;

        }

    </style>
</head>
<body>
<header class="clearfix"><!-- 头部 -->

    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">

                <a class="navbar-brand" href="#">温州波普大数据研究所</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#example-navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${pageContext.request.contextPath}/UeditorTest.jsp">简介</a></li>
                    <li  class="divider"></li>
                    <li><a href="#">最近活动</a></li>
                    <li  class="divider"></li>
                    <li><a href="#">研究成果</a></li>
                    <li class="divider"></li>
                    <li><a href="#">业内动态</a></li>
                    <li class="divider"></li>
                    <li><a href="#">联系我们</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<main class="content">
    <br>
    <div class="cen center-block">

        <div id="myCarousel" class="carousel slide" >
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators" >
                <li data-target="#myCarousel" data-slide-to="0"  class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
                <li data-target="#myCarousel" data-slide-to="5"></li>
                <li data-target="#myCarousel" data-slide-to="6"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner"  style="width:100%">
                <div class="item active">
                    <img src="images/img4.jpg" alt="1 slide" >
                </div>
                <div class="item">
                    <img src="images/img5.jpg" alt="2 slide">
                </div>
                <div class="item">
                    <img src="images/img6.jpg" alt="3 slide">
                </div>
                <div class="item">
                    <img src="images/img4.jpg" alt="4 slide">
                </div>
                <div class="item">
                    <img src="images/img5.jpg" alt="5 slide">
                </div>
                <div class="item">
                    <img src="images/img6.jpg" alt="6 slide">
                </div>
                <div class="item">
                    <img src="images/img4.jpg" alt="7 slide">
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

        <br><br>
        标题
        <hr>
        <br>
        <div id="wrap" >
            <div  style='margin:2px;display:block;word-break: break-all;word-wrap: break-word;'>
                <div id="myCarousel1" class="carousel slide"  >
                    <!-- 轮播（Carousel）指标 -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel1" data-slide-to="0"  class="active"></li>
                        <li data-target="#myCarousel1" data-slide-to="1"></li>
                        <li data-target="#myCarousel1" data-slide-to="2"></li>
                        <li data-target="#myCarousel1" data-slide-to="3"></li>
                        <li data-target="#myCarousel1" data-slide-to="4"></li>
                        <li data-target="#myCarousel1" data-slide-to="5"></li>
                        <li data-target="#myCarousel1" data-slide-to="6"></li>
                    </ol>
                    <!-- 轮播（Carousel）项目 -->
                    <div class="carousel-inner" >
                        <div class="item active">
                            <img src="images/img4.jpg" alt="1 slide" >
                        </div>
                        <div class="item">
                            <img src="images/img5.jpg" alt="2 slide">
                        </div>
                        <div class="item">
                            <img src="images/img6.jpg" alt="3 slide">
                        </div>
                        <div class="item">
                            <img src="images/img4.jpg" alt="4 slide">
                        </div>
                        <div class="item">
                            <img src="images/img5.jpg" alt="5 slide">
                        </div>
                        <div class="item">
                            <img src="images/img6.jpg" alt="6 slide">
                        </div>
                        <div class="item">
                            <img src="images/img4.jpg" alt="7 slide">
                        </div>
                    </div>
                    <!-- 轮播（Carousel）导航 -->
                    <a class="left carousel-control" href="#myCarousel1" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel1" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>


                </div>
                AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA</div>
            <div  style='margin:2px;display:block;word-break: break-all;word-wrap: break-word;'>
                <div id="myCarousel2" class="carousel slide" >
                    <!-- 轮播（Carousel）指标 -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel2" data-slide-to="0"  class="active"></li>
                        <li data-target="#myCarousel2" data-slide-to="1"></li>
                        <li data-target="#myCarousel2" data-slide-to="2"></li>
                        <li data-target="#myCarousel2" data-slide-to="3"></li>
                        <li data-target="#myCarousel2" data-slide-to="4"></li>
                        <li data-target="#myCarousel2" data-slide-to="5"></li>
                        <li data-target="#myCarousel2" data-slide-to="6"></li>
                    </ol>
                    <!-- 轮播（Carousel）项目 -->
                    <div class="carousel-inner" >
                        <div class="item active">
                            <img src="images/img4.jpg" alt="1 slide" >
                        </div>
                        <div class="item">
                            <img src="images/img5.jpg" alt="2 slide">
                        </div>
                        <div class="item">
                            <img src="images/img6.jpg" alt="3 slide">
                        </div>
                        <div class="item">
                            <img src="images/img4.jpg" alt="4 slide">
                        </div>
                        <div class="item">
                            <img src="images/img5.jpg" alt="5 slide">
                        </div>
                        <div class="item">
                            <img src="images/img6.jpg" alt="6 slide">
                        </div>
                        <div class="item">
                            <img src="images/img4.jpg" alt="7 slide">
                        </div>
                    </div>
                    <!-- 轮播（Carousel）导航 -->
                    <a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>


                </div>
                AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA</div>
            <div  style='margin:2px;display:block;word-break: break-all;word-wrap: break-word;'>
                <div id="myCarousel3" class="carousel slide"  >
                    <!-- 轮播（Carousel）指标 -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel3" data-slide-to="0"  class="active"></li>
                        <li data-target="#myCarousel3" data-slide-to="1"></li>
                        <li data-target="#myCarousel3" data-slide-to="2"></li>
                        <li data-target="#myCarousel3" data-slide-to="3"></li>
                        <li data-target="#myCarousel3" data-slide-to="4"></li>
                        <li data-target="#myCarousel3" data-slide-to="5"></li>
                        <li data-target="#myCarousel3" data-slide-to="6"></li>
                    </ol>
                    <!-- 轮播（Carousel）项目 -->
                    <div class="carousel-inner" >
                        <div class="item active">
                            <img src="images/img4.jpg" alt="1 slide" >
                        </div>
                        <div class="item">
                            <img src="images/img5.jpg" alt="2 slide">
                        </div>
                        <div class="item">
                            <img src="images/img6.jpg" alt="3 slide">
                        </div>
                        <div class="item">
                            <img src="images/img4.jpg" alt="4 slide">
                        </div>
                        <div class="item">
                            <img src="images/img5.jpg" alt="5 slide">
                        </div>
                        <div class="item">
                            <img src="images/img6.jpg" alt="6 slide">
                        </div>
                        <div class="item">
                            <img src="images/img4.jpg" alt="7 slide">
                        </div>
                    </div>
                    <!-- 轮播（Carousel）导航 -->
                    <a class="left carousel-control" href="#myCarousel3" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel3" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>


                </div>
                AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA</div>
        </div>
        <br><br>
        <hr>
        <br>


        <div class="div_celebrity_list">
            <!--大的list-->
            <div class='div_celebrity_row'>
                <a href="#" class="list-group-item">AAAAAAAAAAAAAAAAAAAAAA</a>
                <a href="#" class="list-group-item">CCCCCCCCCCCCCCCCCCCC</a>
                <a href="#" class="list-group-item">CCCCCCCCCCCCCCCCCCCCC</a>
                <a href="#" class="list-group-item">CCCCCCCCCCCCCCCCCCCCC</a>
                <a href="#" class="list-group-item">CCCCCCCCCCCCCCCCCCCC</a>
            </div>
        </div>
        <br>
        <!--小的list-->
        <div id="list">
            <div class="div_celebrity_list" >
                <div class='div_celebrity_row'>
                    <a href="#" class="list-group-item">AAAAAAAAAAAAAAAAAAAAAA</a>
                    <a href="#" class="list-group-item">CCCCCCCCCCCCCCCCCCCC</a>
                    <a href="#" class="list-group-item">CCCCCCCCCCCCCCCCCCCCC</a>
                    <a href="#" class="list-group-item">CCCCCCCCCCCCCCCCCCCCC</a>
                    <a href="#" class="list-group-item">CCCCCCCCCCCCCCCCCCCC</a>
                </div>
            </div>
            <div class="div_celebrity_list">
                <div class='div_celebrity_row' style='margin:20px;display:block;word-break: break-all;word-wrap: break-word;'>
                    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA


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
</html>
