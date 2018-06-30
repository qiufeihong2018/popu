<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
Created by IntelliJ IDEA. User: shiku Date: 2018/5/27 Time: 18:32 To
change this template use File | Settings | File Templates. --%> -->
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>boPuHome</title>
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body class="gray-bg">
<jsp:include page="header.jsp" />

	<main class="content">
		<br> <br>
		<div class="cen center-block">

			<div id="myCarousel" class="carousel slide">
				<!-- 轮播（Carousel）指标 -->
				<ol id="ol1" class="carousel-indicators">
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div id="top1" class="carousel-inner">
				</div>
				<!-- 轮播（Carousel）导航 -->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>

			<br> <br>
			<h3>置顶文章1</h3>
			<hr>
			<br>
			<div id="top2" class="row">


			</div>
			<br> <br>
			<hr>
			<br>
			<div class="thumbnail">
				<div id="div1" class="div_celebrity_list">
					<!--大的list-->

					<div class='div_celebrity_row'>
						<h1>最新发布</h1>

						<hr style="border:5px solid #DDDDDD" />
						<div id="showNews">
							<a
								href="${pageContext.request.contextPath}/article/show?articleId=1"
								class="list-group-item">测试文章</a> <a
								href="${pageContext.request.contextPath}/article/show?articleId=1"
								class="list-group-item">测试文章</a>
						</div>
						<hr style="border:5px solid #DDDDDD" />
							<a href="联系我们.html" >查看更多<i
								class="glyphicon glyphicon-chevron-right"></i></a>

					</div>
				</div>
			</div>
			<br>
			<hr>
			<br>
			<!--小的list-->

			<div id="inner" style="display: none" class="row">
				<div id="list">

					<div id="inner1" class="col-md-6 col-sm-12">
						<div class="thumbnail">
							<div id="div2" class="div_celebrity_list">
								<div class='div_celebrity_row'>
									<h1>内部通知</h1>

									<hr style="border:5px solid #DDDDDD" />
									<div id="innerNews">
										<a
											href="${pageContext.request.contextPath}/article/show?articleId=1"
											class="list-group-item">测试文章</a> <a
											href="${pageContext.request.contextPath}/article/show?articleId=1"
											class="list-group-item">测试文章</a>
									</div>
									<hr style="border:5px solid #DDDDDD" />
										<a href="联系我们.html">查看更多<i
								class="glyphicon glyphicon-chevron-right"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div id="inner2" class="col-md-6 col-sm-12">
						<div class="thumbnail">
							<h1 style="padding: 30px 30px 0px">实验项目</h1>
							<div id="div4" class="div_celebrity_list">



								<hr style="border:5px solid #DDDDDD" />

								<div id="experiment" class='div_celebrity_row'></div>


							</div>
							<div style="height: 1.5em"></div>
					<a href="联系我们.html" style="margin-left: 30px;">查看更多<i
								class="glyphicon glyphicon-chevron-right"></i></a>
								 <br> <br> <br>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br> <br>
	</main>
	<footer class="center-block footer">
		<div class="container">
			<div class="row center-block">
				<div class="col-md-6">
					<span>反馈邮箱：12345678@163.com &nbsp; &nbsp;
						&nbsp;联系方式：12345678911</span>
				</div>
				<div class="col-md-6">
					<span>@2018-2020 Wenzhou Demo Worker</span>
				</div>
			</div>
		</div>
	</footer>
</body>

</html>
<style type="text/css">
/*背景色*/
.gray-bg {
	background-color: #f3f3f4;
}

/*左右固定*/
html, body {
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

.navbar-default .navbar-nav>li>a:focus, .navbar-default .navbar-nav>li>a:hover
	{
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
	width: 80%;
}

@media screen and (max-width: 500px) {
	.cen {
		width: 90%;
	}
}

/*轮播图*/
.navbar>.container, .navbar>.container-fluid {
	display: block;
}

.footer span {
	color: #fff;
	font-size: 16px;
}

/*轮播图*/
.navbar>.container, .navbar>.container-fluid {
	display: block;
}

.carousel-inner {
	height: 500px;
}

.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive,
	.thumbnail>img {
	display: block;
	width: 100%;
	height: 500px;
}

@media screen and (max-width: 500px) {
	.carousel-inner {
		height: 300px;
	}
	.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive,
		.thumbnail>img {
		display: block;
		width: 100%;
		height: 300px;
	}
}

/* .carousel-inner img {
		width: 100%;
		height: 300px !important;
 	} */
/*}*/
/*轮播图高度*/
/*     .aa{
                    height: 500px;
                    width: 100%;
                } */
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
	width: 218px;
	border-color: #1572DD;
	border-radius: 3px;
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
/*高度*/
#pig1, #pig2, #pig3 {
	height: 400px;
}
/* 
轮播图 */
#img0 {
	width: 0;
	height: 0;
}

/* 标题和图 */
.thumbnail a>img {
	display: block;
	width: 349px;
	height: 192px;
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
/* 个人中心样式 */
.navbar-default .navbar-nav>.open>a, .navbar-default .navbar-nav>.open>a:focus,
	.navbar-default .navbar-nav>.open>a:hover {
	color: #555;
	background-color: #1572DD;
}
/* 私信和个人中心点击白色 */
.navbar-default .navbar-nav .open .dropdown-menu>li>a {
	color: #fff;
}
/* 3修改点击白色 */
.navbar-default .navbar-nav .open .dropdown-menu>li>a:focus,
	.navbar-default .navbar-nav .open .dropdown-menu>li>a:hover {
	color: #fff;
	background-color: transparent;
}

/* 大屏下拉蓝色 */
.navbar-nav>li>.dropdown-menu {
	background-color: #1572DD;
}
</style>
<script>
        $(document).ready(function () {
            $("#myCarousel").carousel({
                interval: 4000
            });
        });

        $(document).ready(function () {
            $.post("${pageContext.request.contextPath}/content/getArticle", {}, function (data) {
                var text1="";
                var text2="";
                var ol="";
                var i=0;
                $.each(data["obj"], function (index, val) {
                    if(val["categoryId"]==2){//轮播图
                        if(i==0){//第一次
                            ol+='<li data-target="#myCarousel" data-slide-to="'+i+'" class="active"></li>';
                            text1+='<div class="item active">' +
                                '                    <img  class="aa"' +
                                '                         src="${pageContext.request.contextPath}'+val["pic"]+'"' +
                                '                        onclick="javascript:window.location.href=\'${pageContext.request.contextPath}'+val["url"]+'\'"' +
                                '                   alt="" >' +
                                '                </div>';
                                i++;
                        }else{
                        ol+='<li data-target="#myCarousel" data-slide-to="'+i+'"></li>';
                        text1+='<div class="item">' +
                            '                    <img  class="aa"' +
                            '                         src="${pageContext.request.contextPath}'+val["pic"]+'"' +
                            '                        onclick="javascript:window.location.href=\'${pageContext.request.contextPath}'+val["url"]+'\'"' +
                            '                   alt="" >' +
                            '                </div>';
                            i++;
                        }
                    }else if(val["categoryId"]==1){//顶置文章
                        text2+='<div class="col-sm-6 col-md-4">' +
                            '                <div class="thumbnail" style="height:400px">' +
                            '                    <a href="${pageContext.request.contextPath}'+val["url"]+'"><img' +
                            '                            src="${pageContext.request.contextPath}'+val["pic"]+'"' +
                            '                            >' +
                            '                        <div class="caption">' +
                            '                            <h3>'+val["title"]+'</h3>' +
                            '                            <p>一些示例文本。一些示例文本。</p>' +
                            '\n' +
                            '                        </div>' +
                            '                    </a>' +
                            '                </div>' +
                            '            </div>';
                    }
                });
                $("#ol1").html(ol);
                $("#top1").html(text1);
                $("#top2").html(text2);
            });
        })

        $(document).ready(function () {
            // 最新文章div块
            $.post("${pageContext.request.contextPath}/article/newArticle", function (data) {
                // 一共显示 8 条数据 访问URL /article/show?articleId=1
                var text = "";
                $.each(data["obj"], function (index, val) {
                    text += '<a href="${pageContext.request.contextPath}/article/show?articleId=' + val["id"] + '" class="list-group-item">' + val["title"] + '</a>';
                });

            $("#showNews").html(text);
        });
        });
        <c:if test="${user != null}">
        $(document).ready(function () {
            // 内部通知div块
            $.post("${pageContext.request.contextPath}/article/newArticle", {
                category: 4
            }, function (data) {
                // 一共显示 8 条数据
                var text = "";
                $.each(data["obj"], function (index, val) {
                    text += '<a href="${pageContext.request.contextPath}/article/show?articleId=' + val["id"] + '" class="list-group-item">' + val["title"] + '</a>';
                });
                $("#innerNews").html(text);
            });
        });
        $(document).ready(function () {
            $("#inner").show();
            // 项目div块experiment
            $.post("${pageContext.request.contextPath}/article/projectContent", {
            }, function (data) {
                var text = "";
                $.each(data["obj"]["rows"], function (index, val) {
                    text+='项目名称：'+val["title"]+'<br>' +
                        '  项目简介：'+val["content"]+'<br>' +
                        '  作者成员：'+val["author"]+'<br>' +
                        '  上限日期：'+val["limitdata"]+'<<br>' +
                        '  <a href=${pageContext.request.contextPath}"'+val["look"]+'">进入查看</a>' +
                        '  <hr style="border:5px solid #DDDDDD;"/>';
                });
                $("#experiment").html(text);
                $("#div4").height($("#innerNews").height());
            });
        });
        </c:if>

    </script>