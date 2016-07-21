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
<link rel="stylesheet" href="<%=path %>/css/blog-message.css">
</head>

<body>
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
				<li title="留言板"><a href="#/message"><i
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
	<div class="container" style="width:100%">

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
					<p>采用的技术有:</p>
					<p>后端框架:SSM</p>
					<p>前端框架:bootstrap、AngularJS</p>
					<p>数据库:MySQL、Redis</p>
					<p>服务器:Tomcat、Nginx</p>
					<p>图片服务器:fastDFS</p>
				</section>
				<section>
					<ul>
						<li title="返回主页"><a href="#/index"><i
								class="fa fa-home"></i></a></li>
						<li title="留言板"><a href="#/message"><i
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
								<span class="glyphicon glyphicon-user"></span> 留言板
							</h3>
							<small>留下你的脚印吧</small>
							<div class="newBlogImgBox pull-right">
								<img data-toggle="modal" data-target="#messageBox" title="写新留言"
									class="newBlogImg" src="<%=path%>/imgs/plus.png" />
							</div>
						</div>
					</div>
				</div>
				<div class="row">

				<div class="col-md-12 col-sm-12 col-xs-12" style="text-align:left" ng-repeat="message in messages">
					<div class="panel panel-default">
					  <div class="panel-body">
					    <div class="media">
						  <div class="media-left">
						      <img height="63px" width="64px" class="media-object img-circle" ng-src="{{message.userphoto}}" alt="{{message.username}}">
						  </div>
						  <div class="media-body">
						    <h4 class="media-heading">{{message.username}}&nbsp;:</h4>
						    <p>{{message.message}}</p>
						    <p><small>{{message.created | date:'yyyy-MM-dd HH:mm:ss'}}</small></p>
						  </div>
						</div>
					  </div>
					</div>
				</div>

				</div>
				<tm-pagination conf="paginationConf"></tm-pagination>
				<div class="panel panel-default footer" style="margin-top:50px;">
					<p>备案号:12345678</p>
					<p>联系邮箱:Jinzl_v1@163.com</p>
				</div>
			</div>
		</div>

	</div>

	<!-- Modal -->
	<div class="modal fade" id="messageBox" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">请输入留言</h4>
				</div>
				<div class="modal-body" style="text-align:left">
					<div class="form-group">
						<label for="exampleInputFile">头像</label> <input
							type="file" id="userphoto" name="userphoto" ng-model="formData.userphoto" accept="image/*">
						<p class="help-block">如果没有上传头像,将使用默认头像(支持jpg,jpeg格式)!</p>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">用户名</label> <input
							type="text" class="form-control" id="username"
							placeholder="请给自己一个昵称哦" name="username" ng-model="formData.username">
						<p class="help-block">如果没有输入用户名,将使用默认用户名!</p>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">留言内容</label> <input
							type="text" class="form-control" id="message"
							placeholder="请输入留言哦" name="message" ng-model="formData.message">
					</div>
				</div>
				<div class="modal-footer" style="padding-top:5px;padding-bottom:5px;">
					<span ng-bind="error" style="color:red"></span>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" ng-click="createMessage()">确认</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
