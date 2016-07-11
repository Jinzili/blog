<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <title>My JSP 'booklist.jsp' starting page</title>
  </head>
  
  <body>
  	<header class="header visible-xs-block visible-sm-block" header-bg>
	  		<section>
				<img class="img-circle" width="76px" height="76px" src="<%=path%>/imgs/me.jpg"/>
			</section>
			
			<section>
				<h4>金自力的博客</h4>
				<small>Jin's Blog</small>
			</section>
					
			<section>
				<ul>
	       		  <li title="返回主页"><a href="http://blog.dandyweng.com"><i class="fa fa-home"></i></a></li>
	              <li title="留言板"><a href="http://blog.dandyweng.com/messages/"><i class="fa fa-comments"></i></a></li>
	              <li title="切换字体风格" data-action="switch-font-type"><i class="fa fa-font"></i></li>
	              <li title="夜间模式" data-action="switch-night-mode"><i class="fa fa-moon-o"></i></li>
	              <li title="全屏模式" data-action="switch-fullscreen-mode"><i class="fa fa-expand"></i></li>
	          </ul>
			</section>
  	</header>
  	<div class="container" style="width:100%">
  		
  		<div class="row">
	  		<div class="col-md-4 hidden-sm hidden-xs myself" header-bg ng-height>
	  			
	  			<section>
					<img class="img-circle" width="76px" height="76px" src="<%=path%>/imgs/me.jpg"/>
	  			</section>
	  			<section>
	  				<h4>金自力的博客</h4>
	  				<h4>Jin's Blog</h4>
	  			</section>
	  			<section style="width:80%">
	  				<p>
	  					此博客的前端设计有参考翁天信老师的博客,这里是翁天信老师的<a target="_blank" href="http://blog.dandyweng.com/">博客主页</a>。
	  				</p>
	  			</section>
	  			<section>
	  				<ul>
            			<li title="返回主页"><a href="http://blog.dandyweng.com"><i class="fa fa-home"></i></a></li>
		                <li title="留言板"><a href="http://blog.dandyweng.com/messages/"><i class="fa fa-comments"></i></a></li>
		                <li title="切换字体风格" data-action="switch-font-type"><i class="fa fa-font"></i></li>
		                <li title="夜间模式" data-action="switch-night-mode"><i class="fa fa-moon-o"></i></li>
		                <li title="全屏模式" data-action="switch-fullscreen-mode"><i class="fa fa-expand"></i></li>
		            </ul>
	  			</section>
	  		</div>
	  		
	  		
	  		<div class="col-md-8 col-sm-12 col-xs-12 right-box" ng-height style="background-color:#fafbff;overflow :auto" ng-controller="pageCtrl">
	  			<div class="panel panel-default">
				  <div class="panel-body" style="text-align:left">
				  	<div class="newBlogDiv">
				 	   <h3 class="header-h3"><span class="glyphicon glyphicon-book"></span>  已发表的博客</h3>
				  	   <div class="newBlogImgBox pull-right">
					  	   <img data-toggle="modal" data-target="#myModal" title="写新博客" class="newBlogImg" src="<%=path %>/imgs/plus.png" />
				  	   </div>
				  	</div>
				  </div>
				</div>
			    	<div class="row">

					  <div class="col-md-4 col-sm-4 col-xs-12" ng-repeat="blog in blogs">
					    <div class="thumbnail">
					      <div class="eachblog hidden-xs">
						      <img class="imgPic" src="<%=path %>/imgs/subject/test.jpg" title="{{blog.title}}"/>
					      </div>	
					      <div class="caption">
					        <h3 class="h3-title" title="{{blog.title}}">{{blog.title}}</h3>
					        <p>{{blog.summary}}</p>
					        <p class="hidden-xs hidden-sm"style="text-align:left;margin-bottom:0">就阿斯顿发生地方阿斯顿发生大发生地方撒旦...</p>
					      </div>
					    	<p class="hidden-xs" style="text-align:right;margin-right:5px;margin-bottom:0">{{blog.updated | date:'yyyy-HH-dd HH:mm:ss'}}</p>
					    </div>
					  </div>
					  
				  </div>
				  <tm-pagination conf="paginationConf"></tm-pagination>
				  <div class="panel panel-default footer">
					   	<p>备案号:12345678</p>
					   	<p>联系邮箱:Jinzl_v1@163.com</p>
				  </div>
				</div>
  		</div>
  		
   	 </div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">请输入密码</h4>
	      </div>
	      <div class="modal-body" style="text-align:left">
	        <div class="input-group">
		      <div class="input-group-addon">password</div>
		      <input type="text" class="form-control" id="password">
		    </div>
	      </div>
	      <div class="modal-footer" style="padding-top:5px;padding-bottom:5px">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary">确认</button>
	      </div>
	    </div>
	  </div>
	</div>
  </body>
</html>
