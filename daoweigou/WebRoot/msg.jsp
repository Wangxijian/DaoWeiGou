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
  %>
	
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="msg.jsp">留言板</a></li>
					</ul>
				</div>
			</div>
						<%String suc = (String)request.getAttribute("suc");
						if(suc!=null){%>
						    <div class="alert alert-info">
						        	<%=suc %>
						        	<script type="text/javascript">
						        		location.href="msg.jsp";
						        	</script>
					    	</div>
						<%}%>
			<div class="alert alert-info" id="tsinfo" style="display: none;">
				<button type="button" class="close" data-dismiss="alert">×</button>	
			</div>
			
			<%
			String sql = "select * from chat where 1=1 order by id desc";
			String url ="/daoweigou/msg.jsp?1=1";
			String did = request.getParameter("did");
			%>
			<div class="row">
								<table class="bordered">  
									<thead>  
										<tr>  
										<th>留言内容</th>  
										<th>回复内容</th>  
										<th>留言人</th>
										<th>留言日期</th>
										</tr>  
									</thead>
									<%
									PageManager pageManager = PageManager.getPage(url,10, request);
								    pageManager.doList(sql);
								    PageManager bean= (PageManager)request.getAttribute("page");
								    ArrayList<HashMap> infoslist=(ArrayList)bean.getCollection();
								    for(HashMap infosmap :infoslist)
								    {
								    	HashMap mbmap = dao.select("select * from member where id="+infosmap.get("memberid")).get(0);
									%>
									<tr>  
										<td><%=infosmap.get("msg") %></td>  
										<td><%=infosmap.get("hfmsg")==null?"":infosmap.get("hfmsg") %></td>  
										<td><%=mbmap.get("tname") %></td>  
										<td><%=infosmap.get("savetime").toString()%></td>
									</tr>  
									<%} %>
									<tr>
										<td colspan="9">${page.info }</td>
									</tr>
								</table>
								<%if(membersession!=null){ %>
								<form id="form" action="/daoweigou/daoweigou?ac=msgadd" method="post">
									<table class="bordered">  
										<tr>
											<td>
												<label>留言内容</label>
												<textarea rows="4" cols="60" id="msg" name="msg" required></textarea>
												<button class="btn btn-primary"><i class="icon-save"></i> 提交</button>
											</td>
										</tr>
									</table>
								</form>
								<%} %>
				
				</div>
		</div>
	</div>	
	
	<jsp:include page="foot.jsp"></jsp:include>

</body>
</html>
