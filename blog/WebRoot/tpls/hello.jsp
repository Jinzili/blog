<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <title>首页</title>
  </head>
  
  <body>
  	<div class="title">
	    <h1>欢迎你,我的朋友</h1>
  	</div>
	<button class="pull-right" ><a href="#/index"><img src="<%=path %>/imgs/arrow.png" height="64px" width="64px"></a></button>
  </body>
</html>
