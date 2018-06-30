<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
     <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">-->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--引用百度地图API文件-->
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=GxWbDbHbOLWd5DAFjE6IvzRrbPgD6T1T"></script>
<!--<script src="js/bootstrap.min.js"></script>-->

</head>

<body class="gray-bg">

	<!-- 引入header.jsp -->
	<jsp:include page="header.jsp" flush="true"></jsp:include>
	<!--创建地图容器元素-->
	<main class="content">
		<div class="container">
			<div class="cen center-block">
				<div class="row">
					<div class="col-sm-12 col-md-12 col-xs-12">
						<h1>联系我们</h1>
						<div class="row">
							<div class="col-sm-12 col-md-12 col-xs-12">
								<div class="thumbnail">

									<div id="allmap"></div>
									<div class="caption">
										<p>海尔集团</p>
										<p>电子邮箱：</p>
										<p>9999@haier.com</p>
										<p>联系电话：</p>
										<p>0086-4006-999-999</p>
									</div>

								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>

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

/*地图*/
#allmap {
	width: 100%;
	height: 500px;
	overflow: hidden;
	margin: 1px;
	font-family: "微软雅黑";
}
/*背景色*/
.gray-bg {
	background-color: #f3f3f4;
}
/*左右固定*/
html, body {
	overflow-x: hidden;
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
</style>

<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap"); // 创建Map实例
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 11); // 初始化地图,设置中心点坐标和地图级别
	//添加地图类型控件
	map.addControl(new BMap.MapTypeControl({
		mapTypes : [
			BMAP_NORMAL_MAP,
			BMAP_HYBRID_MAP
		]
	}));
	map.setCurrentCity("北京"); // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
</script>
