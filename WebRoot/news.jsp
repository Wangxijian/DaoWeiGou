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
      <%CommDAO dao = new CommDAO();%>
	
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="news.jsp">站内资讯</a></li>
					</ul>
				</div>
			</div>
			<div class="alert alert-info" id="tsinfo" style="display: none;">
				<button type="button" class="close" data-dismiss="alert">×</button>	
			</div>
			<%
			String sql = "select * from news where type='新闻' order by id desc";
			String url ="/daoweigou/news.jsp?1=1";
			PageManager pageManager = PageManager.getPage(url,10, request);
		    pageManager.doList(sql);
		    PageManager bean= (PageManager)request.getAttribute("page");
		    ArrayList<HashMap> newslist=(ArrayList)bean.getCollection();
				for(HashMap newmap:newslist){ 
			%>
				<div class="product well">
					<div class="col-md-3">
						<div class="image">
							<a href="newsx.jsp?id=<%=newmap.get("id") %>"><img src="upfile/<%=newmap.get("img") %>" border="0"/></a>
						</div>
					</div>
					<div class="col-md-9">
						<div class="caption">
							<div class="name"><h3><a href="newsx.jsp?id=<%=newmap.get("id") %>"><%=newmap.get("title") %></a></h3></div>
						</div>
						<div class="info">	
							<%=newmap.get("savetime") %>
						</div>
					</div>
				</div>	
			<%} %>
<div class="row">
${page.info }
</div>


		</div>
	</div>	
	
	<jsp:include page="foot.jsp"></jsp:include>

</body>
</html>
