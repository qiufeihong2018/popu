<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>简介</title>
		<!--<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
     <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">-->
		<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<!--图标-->
				<link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

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
</style>
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
			<br> <br>
			<div class="cen center-block">
				<br><br>
				<h1>关于波普</h1> 研究所简介，社会责任，管理层信息，网络安全，公司出版物等
				<hr>
				<div class="row">
					<div class="col-md-7 col-sm-12">
						<p>华为是全球领先的ICT（信息与通信）基础设施和智能终端提供商，致力于把数字世界带入每个人、每个家庭、每个组织，构建万物互联的智能世界。我们在通信网络、IT、智能终端和云服务等领域为客户提供有竞争力、安全可信赖的产品、解决方案与服务，与生态伙伴开放合作，持续为客户创造价值，释放个人潜能，丰富家庭生活，激发组织创新。华为坚持围绕客户需求持续创新，加大基础研究投入，厚积薄发，推动世界进步。华为成立于1987年，是一家由员工持有全部股份的民营企业，目前有18万员工，业务遍及170多个国家和地区。</p>
						<a href="联系我们.html">查看更多<i class="glyphicon glyphicon-chevron-right"></i></a>
						
					</div>
					<div class="col-md-5 col-sm-12">
						<img src="img/p2.jpg" style="width: 100%;height: 300px;border-radius: 4px;"/>
						
					</div>
					
				</div>
				<br>
				<h1>公司信息</h1>
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="thumbnail">
							<img src="img/p1.jpg" alt="通用的占位符缩略图" style="height: 500px;width: 100%;border-radius: 4px;">
							<div class="caption">
								<p>华为是谁？

华为是全球领先的ICT（信息与通信）基础设施和智能终端提供商，致力于把数字世界带入每个人、每个家庭、每个组织，构建万物互联的智能世界。我们在通信网络、IT、智能终端和云服务等领域为客户提供有竞争力、安全可信赖的产品、解决方案与服务，与生态伙伴开放合作，持续为客户创造价值，释放个人潜能，丰富家庭生活，激发组织创新。华为坚持围绕客户需求持续创新，加大基础研究投入，厚积薄发，推动世界进步。华为成立于1987年，是一家由员工持有全部股份的民营企业，目前有18万员工，业务遍及170多个国家和地区。
我们为世界带来了什么？

为客户创造价值。华为和运营商一起，在全球建设了1,500多张网络，帮助世界超过三分之一的人口实现联接。华为携手合作伙伴，为政府及公共事业机构，金融、能源、交通、制造等企业客户，提供开放、灵活、安全的端管云协同ICT基础设施平台，推动行业数字化转型；为云服务客户提供稳定可靠、安全可信和可持续演进的云服务。华为智能终端和智能手机，正在帮助人们享受高品质的数字工作、生活和娱乐体验。

推动产业良性发展。华为主张开放、合作、共赢，与客户合作伙伴及友商合作创新、扩大产业价值，形成健康良性的产业生态系统。华为加入360多个标准组织、产业联盟和开源社区，积极参与和支持主流标准的制定、构建共赢的生态圈。我们面向云计算、NFV/SDN、5G等新兴热点领域，与产业伙伴分工协作，推动产业持续良性发展。

促进经济增长。华为不仅为所在国家带来直接的税收贡献，促进当地就业，形成产业链带动效应，更重要的是通过创新的ICT解决方案打造数字化引擎，推动各行各业数字化转型，促进经济增长，提升人们的生活质量与福祉。

推动社会可持续发展。作为负责任的企业公民，华为致力于消除全球数字鸿沟，在珠峰南坡和北极圈内，在西非埃博拉疫区、日本海啸核泄漏、中国汶川大地震等重大灾难现场，都有华为人的身影；推进绿色、低碳的环保理念，从产品规划、设计、研发、制造、交付以及运维，华为向客户提供领先的节能环保产品和解决方案；华为“未来种子”项目已经覆盖108个国家和地区，帮助培养本地ICT人才，推动知识迁移，提升人们对于ICT行业的了解和兴趣，并鼓励各国家及地区参与到建设数字化社区的工作中。

为奋斗者提供舞台。华为坚持“以奋斗者为本”，以责任贡献来评价员工和选拔干部，为员工提供了全球化发展平台、与世界对话的机会，使大量年轻人有机会担当重任，快速成长，也使得十几万员工通过个人的努力，收获了合理的回报与值得回味的人生经历。
我们坚持什么？

华为30年坚持聚焦在主航道，抵制一切诱惑；坚持不走捷径，拒绝机会主义，踏踏实实，长期投入，厚积薄发；坚持以客户为中心，以奋斗者为本，长期艰苦奋斗，坚持自我批判。

我们不会辜负时代慷慨赋予我们的历史性机遇，为构建万物互联的智能世界，一往无前。</p>
	<a href="联系我们.html">查看更多<i class="glyphicon glyphicon-chevron-right"></i></a>
							</div>
							</a>
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