<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <title>新博客</title>
    
   <link rel="stylesheet" href="<%=path %>/simditor/styles/simditor.css"  type="text/css" />
    
    <script type="text/javascript" src="<%=path %>/simditor/scripts/module.js"></script>
	<script type="text/javascript" src="<%=path %>/simditor/scripts/hotkeys.js"></script>
	<script type="text/javascript" src="<%=path %>/simditor/scripts/simditor.js"></script>
    
  </head>
  
  <body ng-controller="">
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


			<div class="col-md-8 col-sm-12 col-xs-12 right-box" ng-height style="background-color:#fafbff;overflow :auto">
				
				
				<div class="panel panel-default">
					<div class="panel-body" style="text-align:left">
						<div class="newBlogDiv">
							<h3 class="header-h3">
								<span class="glyphicon glyphicon-pencil"></span> 新建博客
							</h3>
						</div>
					</div>
				</div>
				
				<form class="form-horizontal" novalidate="novalidate" ng-submit="createNewBlog(createBlogForm.$valid)" name="createBlogForm" style="width:100%;text-align:left" method="post">
					<div class="form-group">
						<label class="col-sm-1 control-label">标题</label>
						<div class="col-sm-11">
							<input type="text" class="form-control" id="title" name="title" ng-model="formData.title"
								placeholder="标题" required autocomplete="off" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-1 control-label">摘要</label>
						<div class="col-sm-11">
							<input type="text" class="form-control" id="summary" name="summary" ng-model="formData.summary"
								placeholder="摘要" required autocomplete="off">
						</div>
					</div>
					
					 <div class="form-group">
					    <label class="col-sm-1 control-label">内容</label>
					    <div class="col-sm-11">
						  <textarea id="editor" name="content"></textarea>
					    </div>
					 </div>
					 
					 
					<div class="form-group">
						<div class="col-sm-offset-1 col-sm-11">
							<button type="submit" class="btn btn-default">发表</button>
							<span ng-bind="error" style="color:red"></span>
						</div>
					</div>
				</form>
				<div class="panel panel-default footer">
					<p>备案号:12345678</p>
					<p>联系邮箱:Jinzl_v1@163.com</p>
				</div>
			</div>
		</div>

	</div>
	
	
	<!-- Modal -->
	<form class="form-horizontal" style="width:100%;text-align:left" name="uploadImgForm" ng-submit="uploadImg()">
	<div class="modal fade" id="imgBox" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">上传展示图片</h4>
				</div>
				<div class="modal-body" style="text-align:left">
					
						<div class="form-group" style="margin-bottom:0">
								<label class="col-sm-2 control-label">图片</label>
								<div class="col-sm-10">
									<input type="file" id="img" name="img" accept="image/*"/>
									<p style="margin-bottom:0">展示图片,若不上传则使用默认图片</p>
								</div>
						</div>
					
				</div>
				<div class="modal-footer" style="padding-top:5px;padding-bottom:5px">
					<span ng-bind="uploadfailed" style="color:red"></span>
					<button type="submit" class="btn btn-primary">确认</button>
				</div>
			</div>
		</div>
	</div>
	</form>
  </body>
</html>
