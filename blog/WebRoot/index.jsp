<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html ng-app="blogApp">
  <head>
    <base href="<%=basePath%>">
    
    <title>金自力的博客</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="Java,博客,web">
	<meta http-equiv="description" content="金自力的博客">
	
	<link rel="stylesheet" href="<%=path %>/framework/bootstrap-3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path %>/framework/bootstrap-3.3.4/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=path %>/framework/font-awesome-4.5.0/css/font-awesome.css">
    <link rel="stylesheet" href="<%=path %>/css/blog-hello.css">
    <link rel="stylesheet" href="<%=path %>/css/blog-index.css">
    
    <script src="<%=path %>/framework/jquery-2.1.1.min.js"></script>
    <script src="<%=path %>/framework/1.3.0.14/angular.js"></script>
    <script src="<%=path %>/framework/1.3.0.14/angular-route.min.js"></script>
    <script src="<%=path %>/framework/1.3.0.14/angular-animate.min.js"></script>
    <script src="<%=path %>/framework/1.3.0.14/angular-cookies.min.js"></script>
    <script src="<%=path %>/framework/1.3.0.14/angular-sanitize.min.js"></script>
    <script src="<%=path %>/framework/1.3.0.14/tm.pagination.js"></script>
    <script src="<%=path %>/framework/bootstrap-3.3.4/js/bootstrap.min.js"></script>
    <script src="<%=path %>/js/ng/app.js"></script>
    <script src="<%=path %>/js/ng/controllers.js"></script>
    <script src="<%=path %>/js/ng/filters.js"></script>
    <script src="<%=path %>/js/ng/services.js"></script>
    <script src="<%=path %>/js/ng/directives.js"></script>
  </head>
  <body>
  	<div class="page {{pageClass}}" ng-view>
  		
	</div>
  </body>
</html>
