<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <div class="container">
    	<div class="row">
		  <div class="col-md-3 col-sm-6">
		    <div class="thumbnail">
		      <div class="eachblog">
			      <img class="imgPic" src="<%=path %>/imgs/subject/test.jpg" alt="...">
		      </div>	
		      <div class="caption">
		        <h3>Thumbnail label</h3>
		        <p>...</p>
		        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
		      </div>
		    </div>
		  </div>
		  
		  <div class="col-md-3 col-sm-6">
		    <div class="thumbnail">
		      <div class="eachblog">
			      <img class="imgPic" src="<%=path %>/imgs/subject/test.jpg" alt="...">
		      </div>	
		      <div class="caption">
		        <h3>Thumbnail label</h3>
		        <p>...</p>
		        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
		      </div>
		    </div>
		  </div>
		  
		  <div class="col-md-3 col-sm-6">
		    <div class="thumbnail">
		      <div class="eachblog">
			      <img class="imgPic" src="<%=path %>/imgs/subject/test.jpg" alt="...">
		      </div>	
		      <div class="caption">
		        <h3>Thumbnail label</h3>
		        <p>...</p>
		        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
		      </div>
		    </div>
		  </div>
		  </div>
		  <div class="row">
			  <div class="col-md-3 col-sm-6">
			    <div class="thumbnail">
			      <div class="eachblog">
				      <img class="imgPic" src="<%=path %>/imgs/subject/test.jpg" alt="...">
			      </div>	
			      <div class="caption">
			        <h3>Thumbnail label</h3>
			        <p>...</p>
			        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
			      </div>
			    </div>
			  </div>
			  
			  <div class="col-md-3 col-sm-6">
			    <div class="thumbnail">
			      <div class="eachblog">
				      <img class="imgPic" src="<%=path %>/imgs/subject/test.jpg" alt="...">
			      </div>	
			      <div class="caption">
			        <h3>Thumbnail label</h3>
			        <p>...</p>
			        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
			      </div>
			    </div>
			  </div>
			  
			  <div class="col-md-3 col-sm-6">
			    <div class="thumbnail">
			      <div class="eachblog">
				      <img class="imgPic" src="<%=path %>/imgs/subject/test.jpg" alt="...">
			      </div>	
			      <div class="caption">
			        <h3>Thumbnail label</h3>
			        <p>...</p>
			        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
			      </div>
			    </div>
			  </div>
		  </div>
		
		
		
		  
		  
		</div>
    </div>
  </body>
</html>
