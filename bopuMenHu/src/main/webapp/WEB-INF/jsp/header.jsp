<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
	<header class="clearfix">
		<!-- 头部 -->

		<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">

					<a class="navbar-brand" href="主页.html">温州市波普大数据研究院</a>
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#example-navbar-collapse">
						<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="example-navbar-collapse">
					<ul class="nav navbar-nav navbar-right">

						<li><a href="私信界面.html">私信</a></li>
						<li class="divider"></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">个人中心 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a
									href="${pageContext.request.contextPath}/passwordChange">修改密码</a></li>
								<li><a
									href="${pageContext.request.contextPath}/personChange">修改信息</a></li>
								<li><a href="${pageContext.request.contextPath}/picChange">修改头像</a></li>
							</ul></li>

					</ul>
				</div>
			</div>
		</nav>
	</header>