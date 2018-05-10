<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="<%=basePath%>">
    <meta name="description" content="Admin panel developed with the Bootstrap from Twitter.">
    <meta name="author" content="travis">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%CommDAO dao = new CommDAO(); %>
  <body>
    <footer>
    
    <div class="container">
			<div class="wrap-footer">
				<div class="row">
					<%ArrayList<HashMap> linklist = (ArrayList<HashMap>)dao.select("select * from yqlink"); 
					for(HashMap linkmap:linklist){%>
					<div class="col-md-1 col-footer footer-2">
						<a href="<%=linkmap.get("linkurl") %>" target="_blank"><%=linkmap.get("linkname") %></a>
					</div>
					<%} %>
				</div>
			</div>
		</div>
    
		
		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						Copyright &copy; Company name All rights reserved.
					</div>
					<div class="col-md-6">
						<div class="pull-right">
							<ul>
								<li><img src="images/visa-curved-32px.png" /></li>
								<li><img src="images/paypal-curved-32px.png" /></li>
								<li><img src="images/discover-curved-32px.png" /></li>
								<li><img src="images/maestro-curved-32px.png" /></li>
								<li><a href="admin/login.jsp" target="_blank">后台管理</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
  </body>
</html>
