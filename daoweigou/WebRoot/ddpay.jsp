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
	<link rel="stylesheet" href="css/tablecss.css">
	
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
  HashMap member = dao.select("select * from member where id="+membersession.get("id")).get(0); 
  String ddid = request.getParameter("ddid");
  String ddprice = request.getParameter("ddprice");
    %>
	
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="cart.jsp">收银台</a></li>
					</ul>
				</div>
			</div>
			<div class="alert alert-info" id="tsinfo" style="display: none;">
				<button type="button" class="close" data-dismiss="alert">×</button>	
			</div>

			<div class="product-desc">
			<div class="info">支付金额：	<%=ddprice %> 元</div>
						<ul class="nav nav-tabs">
							<li class="active"><a href="javascript:void(0)" onclick="selectTag('tagContent0',this)">支付宝付款</a></li>
							<li><a href="javascript:void(0)" onclick="selectTag('tagContent1',this)">网银付款</a></li>
						</ul>
						<div class="tab-content" id="tags">
							<div id="tagContent0" class="tab-pane fade in active">
							<form name="form1" id="ff1" method="post" action="/daoweigou/daoweigou?ac=pay&ddid=<%=ddid %>">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="支付宝帐号 :" name="zfb" id="zfb" required>
								</div>
								<div class="form-group">
									<input type="password" class="form-control" placeholder="支付密码 :" name="upass" id="upass" required>
								</div>
								<br/>
								<button type="submit" class="btn btn-1" name="login" id="login">确认支付</button>
							</form>
							</div>
							<div id="tagContent1" class="tab-pane fade">
							  <form name="form2" id="ff2" method="post" action="/daoweigou/daoweigou?ac=pay&ddid=<%=ddid %>">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="银行卡号 :" name="card" id="card" required>
								</div>
								<div class="form-group">
									<input type="password" class="form-control" placeholder="支付密码 :" name="upass" id="upass" required>
								</div>
								<br/>
								<button type="submit" class="btn btn-1" name="login" id="login">确认支付</button>
							</form>
							</div>
						</div>
					</div>
		</div>
	</div>	
	
	<jsp:include page="foot.jsp"></jsp:include>
<script type="text/javascript">
	function selectTag(showContent,selfObj){
		 // 操作标签
		 var tag = document.getElementById("tags").getElementsByTagName("div");
		 var taglength = tag.length;
		 
		 for(i=0; i<taglength; i++){
		  tag[i].className = "";
		 }
		 selfObj.parentNode.className = "description";
		 // 操作内容
		 for(i=0; j=document.getElementById("tagContent"+i); i++){
		  j.style.display = "none";
		  j.style.display = "active";
		 }
		 document.getElementById(showContent).style.display = "block";
		 document.getElementById(showContent).style.display = "active";
		}
</script>
</body>
</html>
