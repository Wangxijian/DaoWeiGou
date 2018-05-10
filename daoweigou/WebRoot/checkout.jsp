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
						<li><a href="login.jsp">创建订单</a></li>
					</ul>
				</div>
			</div>
			
			<form name="form2" id="form2" method="post" action="/daoweigou/daoweigou?ac=submitorder" >
			<div class="row">
			<%String suc = (String)request.getAttribute("suc");
						if(suc!=null){%>
						    <div class="alert alert-info">
						        <button type="button" class="close" data-dismiss="alert">×</button>
						        	<%=suc %>
					    	</div>
						<%}%>
				<div class="product well">
					<div class="col-md-9">
						<div class="caption">
							<div class="info">	
							<%ArrayList<HashMap> goodlist = (ArrayList<HashMap>)dao.select("select *,a.id as aid,b.id as bid from car a,goods b where a.gid=b.id and a.mid='"+member.get("id")+"' and b.delstatus='0' order by a.id desc");
							double totalprice = 0.0;
							for(HashMap carmap:goodlist){  
								if(carmap.get("tprice")!=null&&!carmap.get("tprice").equals("")){ 
									totalprice += Double.valueOf(carmap.get("tprice").toString())*Integer.valueOf(carmap.get("sl").toString());
								}else{
									totalprice += Double.valueOf(carmap.get("price").toString())*Integer.valueOf(carmap.get("sl").toString());
								}
							}%>
								订单金额:<%=totalprice %>元
							</div>
						</div>
					</div>
				</div>	
				<%
				ArrayList<HashMap> addrlist = (ArrayList<HashMap>)dao.select("select * from addr where memberid='"+member.get("id")+"' and delstatus='0'"); 
				for(HashMap addrmap:addrlist){%>
				<div class="product well">
					<div class="col-md-9">
						<div class="caption">
							<div class="info">	
								<ul>
									<li>
									
									<input name="addr" type="radio" value="<%=addrmap.get("id") %>" checked="checked"/><%=addrmap.get("shraddr") %>    姓名: <%=addrmap.get("shr") %>    电话: <%=addrmap.get("shrtel") %></li>
								</ul>
							</div>
						</div>
					</div>
				</div>	
				<%} %>
			</div>
			<input type="hidden" id="addrlist" name="addrlist" value="<%=addrlist.size() %>">
			<button type="button" class="btn btn-1" onclick="suborder()">提交订单</button>
			</form>
		</div>
	</div>
	
	<jsp:include page="foot.jsp"></jsp:include>
<script type="text/javascript">
	function suborder(){
		var addrlenght = document.getElementById("addrlist").value;
		if(addrlenght<1){
			alert("请先维护收货地址");
			location.href="addr.jsp";
			return false;
		}else{
			form2.submit();
		}
	}
</script>
</body>
</html>
