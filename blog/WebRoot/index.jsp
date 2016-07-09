<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html ng-app="bookStoreApp">
  <head>
    <base href="<%=basePath%>">
    
    <title>金自力的博客</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="Java,博客,web">
	<meta http-equiv="description" content="金自力的博客">
	
	<link rel="stylesheet" href="<%=path %>/framework/bootstrap-3.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path %>/framework/bootstrap-3.0.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=path %>/css/blog-hello.css">
    <link rel="stylesheet" href="<%=path %>/css/blog-index.css">
    <script src="<%=path %>/framework/1.3.0.14/angular.js"></script>
    <script src="<%=path %>/framework/1.3.0.14/angular-route.js"></script>
    <script src="<%=path %>/framework/1.3.0.14/angular-animate.js"></script>
    <script src="<%=path %>/js/ng/app.js"></script>
    <script src="<%=path %>/js/ng/controllers.js"></script>
    <script src="<%=path %>/js/ng/filters.js"></script>
    <script src="<%=path %>/js/ng/services.js"></script>
    <script src="<%=path %>/js/ng/directives.js"></script>
  </head>
	  	<div class="page {{pageClass}}" ng-view>
	    </div>
  <body>
  </body>
</html>
