<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<title>金自力的博客</title>

 <link rel="stylesheet" href="<%=path %>/css/blog-detail.css">
</head>

<body ng-controller="detailCtrl">
	<header class="header visible-xs-block visible-sm-block" header-bg>

		<section>
			<img class="img-circle" width="76px" height="76px"
				src="<%=path%>/imgs/me.jpg" />
		</section>

		<section>
			<h4>金自力的博客</h4>
			<small>Jin's Blog</small>
		</section>

		<section>
			<ul>
				<li title="返回主页"><a href="#/index"><i
						class="fa fa-home"></i></a></li>
				<li title="留言板"><a href="http://blog.dandyweng.com/messages/"><i
						class="fa fa-comments"></i></a></li>
				<li title="切换字体风格" data-action="switch-font-type"><i
					class="fa fa-font"></i></li>
				<li title="夜间模式" data-action="switch-night-mode"><i
					class="fa fa-moon-o"></i></li>
				<li title="全屏模式" data-action="switch-fullscreen-mode"><i
					class="fa fa-expand"></i></li>
			</ul>
		</section>
	</header>
	<div class="container" style="width:100%" ng-controller="pageCtrl">

		<div class="row">
			<div class="col-md-4 hidden-sm hidden-xs myself" header-bg ng-height>
				<section>
					<img class="img-circle" width="76px" height="76px"
						src="<%=path%>/imgs/me.jpg" />
				</section>
				<section>
					<h4>金自力的博客</h4>
					<h4>Jin's Blog</h4>
				</section>
				<section style="width:80%">
					<p>
						此博客的前端设计有参考翁天信老师的博客,这里是翁天信老师的<a target="_blank"
							href="http://blog.dandyweng.com/">博客主页</a>。
					</p>
				</section>
				<section>
					<ul>
						<li title="返回主页"><a href="#/index"><i
								class="fa fa-home"></i></a></li>
						<li title="留言板"><a href="http://blog.dandyweng.com/messages/"><i
								class="fa fa-comments"></i></a></li>
						<li title="切换字体风格" data-action="switch-font-type"><i
							class="fa fa-font"></i></li>
						<li title="夜间模式" data-action="switch-night-mode"><i
							class="fa fa-moon-o"></i></li>
						<li title="全屏模式" data-action="switch-fullscreen-mode"><i
							class="fa fa-expand"></i></li>
					</ul>
				</section>
			</div>


			<div class="col-md-8 col-sm-12 col-xs-12 right-box" ng-height
				style="background-color:#fafbff;overflow :auto">
				<div class="panel panel-default">
					<div class="panel-body" style="text-align:left">
						<div class="newBlogDiv">
							<h3 class="header-h3">
								<span class="glyphicon glyphicon-book"></span> {{detail.title}}
							</h3>
							<small>{{detail.updated | date:'yyyy-MM-dd HH:mm:ss'}}</small>
						</div>
					</div>
				</div>
				<div class="row">

					<div class="col-md-12 col-sm-12 col-xs-12">
						<h4 style="text-align:left">摘要</h4>
						<p class="summary">{{detail.summary}}</p>
						<div class="content" data-ng-bind-html="detail.content">
						</div>
					</div>

				</div>
				<div class="panel panel-default footer" style="margin-top:50px;">
					<p>备案号:12345678</p>
					<p>联系邮箱:Jinzl_v1@163.com</p>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
