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
      <%CommDAO dao = new CommDAO();  
  HashMap membersession = (HashMap)session.getAttribute("member");
  HashMap member = dao.select("select * from member where id="+membersession.get("id")).get(0);%>
	
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="login.jsp">收货地址</a></li>
					</ul>
				</div>
				<button type="button" class="btn btn-1" name="add" id="add" onclick="addradd()">新增</button>
			</div>
			
			<div class="row">
			<%String suc = (String)request.getAttribute("suc");
						if(suc!=null){%>
						    <div class="alert alert-info">
						        <button type="button" class="close" data-dismiss="alert">×</button>
						        	<%=suc %>
					    	</div>
						<%}%>
				<%
				String did = request.getParameter("did");
				if(did!=null){
					dao.commOper("update addr set delstatus='1' where id="+did);
				}
				ArrayList<HashMap> addrlist = (ArrayList<HashMap>)dao.select("select * from addr where memberid='"+member.get("id")+"' and delstatus='0'"); 
				for(HashMap addrmap:addrlist){%>
				<div class="product well">
					<div class="col-md-9">
						<div class="caption">
							<div class="info">	
								<ul>
									<li>收货人: <%=addrmap.get("shr") %></li>
									<li>收货人电话: <%=addrmap.get("shrtel") %></li>
									<li>收货人地址: <%=addrmap.get("shraddr") %></li>
								</ul>
							</div>
							<hr>
							<a href="addr.jsp?did=<%=addrmap.get("id") %>" class="btn btn-default pull-right">REMOVE</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>	
				<%} %>
			</div>
			
		</div>
	</div>
	
	<jsp:include page="foot.jsp"></jsp:include>
<script type="text/javascript">
	function addradd(){
		location.href="addradd.jsp";
	}
</script>
</body>
</html>
