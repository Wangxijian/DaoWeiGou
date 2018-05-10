<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>到位购</title>
	
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css"  type="text/css">
	
	<!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
	
	
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"  type="text/css">
    <link rel="stylesheet" href="fonts/font-slider.css" type="text/css">
	
	<!-- jQuery and Modernizr-->
	<script src="js/jquery-2.1.1.js"></script>
	
	<!-- Core JavaScript Files -->  	 
    <script src="js/bootstrap.min.js"></script>
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<jsp:include page="top.jsp"></jsp:include>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////HomePage///////////////////////-->
	<!--//////////////////////////////////////////////////-->
    
	
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="login.jsp">Login</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
				<%String no = (String)request.getAttribute("no");
				if(no!=null){%>
				    <div class="alert alert-info">
				        <button type="button" class="close" data-dismiss="alert">×</button>
				        	<%=no %>
			    	</div>
				<%}%>
					<div class="heading"><h2>登录</h2></div>
					<form name="form1" id="ff1" method="post" action="/daoweigou/daoweigou?ac=frontlogin">
						<div class="form-group">
							用户名<input type="text" class="form-control" placeholder="Username :" name="uname" id="uname" required>
						</div>
						<div class="form-group">
							密码<input type="password" class="form-control" placeholder="Password :" name="upass" id="upass" required>
						</div>
						<button type="submit" class="btn btn-1" name="login" id="login">Login</button>
						
					</form>
				</div>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="foot.jsp"></jsp:include>
<script type="text/javascript">

</script>
</body>
</html>
