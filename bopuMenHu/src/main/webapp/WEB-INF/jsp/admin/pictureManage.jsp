<%--
  Created by IntelliJ IDEA.
  User: Exler
  Date: 2018/6/06
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>波普后台轮播图管理</title>
		<link rel="shortcut icon" href="favicon.ico">
		<link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
		<link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">
		<link href="/css/animate.css" rel="stylesheet">
		<link href="/css/style.css?v=4.1.0" rel="stylesheet">
		<!--上传图片的css样式-->
		<link href="/css/plugins/dropzone/basic.css" rel="stylesheet">
		<link href="/css/plugins/dropzone/dropzone.css" rel="stylesheet">

	</head>

	<body class="gray-bg">
		<div class="wrapper wrapper-content">
			<div class="row">
				<!--图片上传开始-->
				<div class="wrapper wrapper-content animated fadeIn">
					<div class="row">
						<div class="col-sm-12">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>图片上传</h5>
									<div class="ibox-tools">
										<a class="collapse-link">
											<i class="fa fa-chevron-up"></i>
										</a>

										<a class="close-link">
											<i class="fa fa-times"></i>
										</a>
									</div>
								</div>
								<div class="ibox-content">
									<form id="my-awesome-dropzone" class="dropzone" action="form_file_upload.html#">
										<div class="dropzone-previews"></div>
										<button type="submit" class="btn btn-primary pull-right">上传</button>
									</form>

								</div>
							</div>
						</div>
					</div>

				</div>

				<!-- 全局js -->
				<script src="js/jquery.min.js?v=2.1.4"></script>
				<script src="js/bootstrap.min.js?v=3.3.6"></script>

				<!-- 自定义js -->
				<script src="js/content.js?v=1.0.0"></script>

				<!-- DROPZONE -->
				<script src="js/plugins/dropzone/dropzone.js"></script>

				<script>
					$(document).ready(function() {

						Dropzone.options.myAwesomeDropzone = {

							autoProcessQueue: false,
							uploadMultiple: true,
							parallelUploads: 100,
							maxFiles: 100,

							// Dropzone settings
							init: function() {
								var myDropzone = this;

								this.element.querySelector("button[type=submit]").addEventListener("click", function(e) {
									e.preventDefault();
									e.stopPropagation();
									myDropzone.processQueue();
								});
								this.on("sendingmultiple", function() {});
								this.on("successmultiple", function(files, response) {});
								this.on("errormultiple", function(files, response) {});
							}

						}

					});
				</script>
				<!--图片上传结束-->
				<!--图片开始-->
				<div class="col-sm-9 animated fadeInRight">
					<div class="row">
						<div class="col-sm-12">

							<div class="file-box">
								<div class="file">
									<a href="file_manager.html#">
										<span class="corner"></span>

										<div class="icon">
											<i class="fa fa-file"></i>
										</div>
										<div class="file-name">
											URL1
											<br/>
											<a href="#">删除</a>&nbsp;|
											<a href="#">编辑</a>
											<br/>
										</div>
									</a>
								</div>
							</div>

							<div class="file-box">
								<div class="file">
									<a href="file_manager.html#">
										<span class="corner"></span>

										<div class="image">
											<img alt="image" class="img-responsive" src="img/p1.jpg">
										</div>
										<div class="file-name">
											URL2
											<br/>
											<a href="#">删除</a>&nbsp;|
											<a href="#">编辑</a>
											<br/>
										</div>
									</a>

								</div>
							</div>

							<div class="file-box">
								<div class="file">
									<a href="file_manager.html#">
										<span class="corner"></span>

										<div class="image">
											<img alt="image" class="img-responsive" src="img/p2.jpg">
										</div>
										<div class="file-name">
											URL3
											<br/>
											<a href="#">删除</a>&nbsp;|
											<a href="#">编辑</a>
											<br/>
										</div>
									</a>
								</div>
							</div>

							<div class="file-box">
								<div class="file">
									<a href="file_manager.html#">
										<span class="corner"></span>

										<div class="image">
											<img alt="image" class="img-responsive" src="img/p3.jpg">
										</div>
										<div class="file-name">
											URL4
											<br/>
											<a href="#">删除</a>&nbsp;|
											<a href="#">编辑</a>
											<br/>
										</div>
									</a>
								</div>
							</div>

							<div class="file-box">
								<div class="file">
									<a href="file_manager.html#">
										<span class="corner"></span>

										<div class="image">
											<img alt="image" class="img-responsive" src="img/p1.jpg">
										</div>
										<div class="file-name">
											URL5
											<br/>
											<a href="#">删除</a>&nbsp;|
											<a href="#">编辑</a>
											<br/>
										</div>
									</a>
								</div>
							</div>

							<div class="file-box">
								<div class="file">
									<a href="file_manager.html#">
										<span class="corner"></span>

										<div class="image">
											<img alt="image" class="img-responsive" src="img/p2.jpg">
										</div>
										<div class="file-name">
											URL6
											<br/>
											<a href="#">删除</a>&nbsp;|
											<a href="#">编辑</a>
											<br/>
										</div>
									</a>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!--			图片结束-->

			</div>
		</div>

		<!-- 全局js -->
		<script src="js/jquery.min.js?v=2.1.4"></script>
		<script src="js/bootstrap.min.js?v=3.3.6"></script>

		<!-- 自定义js -->
		<script src="js/content.js?v=1.0.0"></script>

		<script>
			$(document).ready(function() {
				$('.file-box').each(function() {
					animationHover(this, 'pulse');
				});
			});
		</script>

		<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
		<!--统计代码，可删除-->

	</body>

</html>