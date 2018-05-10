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
  <%CommDAO dao = new CommDAO();  %>
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
						<li><a href="favgoods.jsp">收藏商品列表</a></li>
					</ul>
				</div>
			</div>
			<%String suc = (String)request.getAttribute("suc");
						if(suc!=null){%>
						    <div class="alert alert-info">
						        	<%=suc %>
					    	</div>
			<%}%>
			<div class="row">
				<div id="main-content" class="col-md-8">
					<div class="row">
						<div class="col-md-12">
							<div class="products">
							<%
				             HashMap member = (HashMap)session.getAttribute("member");
				         	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
				         	 String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
				         	 String key3 = request.getParameter("key3")==null?"":request.getParameter("key3");
				         	 String url ="favgoods.jsp?1=1";
				             String sql = " select  * from goods where delstatus='0' and id in (select goodid from fav where memberid='"+member.get("id")+"') "; 
				             String f = request.getParameter("f");
				         	 if(f==null)
				         	 {
				         	 //key1 = Info.getUTFStr(key1);
				         	 }
				              if(!key1.equals(""))
				         	 {
				         	 sql+=" and (goodname like'%"+key1+"%' or goodpp like'%"+key1+"%')";
				         	 url+="&key1="+key1;
				         	 } 
				         	 if(!key2.equals(""))
				          	 {
				          	 sql+=" and (sid ='"+key2+"')";
				          	 url+="&key2="+key2;
				          	 }
				         	 if(!key3.equals(""))
				          	 {
				          	 sql+=" and (goodpp ='"+key3+"')";
				          	 url+="&key3="+key3;
				          	 }
				              sql+=" order by savetime desc";
								PageManager pageManager = PageManager.getPage(url,9, request);
							    pageManager.doList(sql);
							    PageManager bean= (PageManager)request.getAttribute("page");
							    ArrayList<HashMap> goodslist=(ArrayList)bean.getCollection();
							    int a = 0;
							    for(HashMap goodsmap :goodslist)
							    {
							    %>
								<div class="col-lg-4 col-md-4 col-xs-12">
									<div class="product">
										<div class="image"><a href="good.jsp?id=<%=goodsmap.get("id") %>"><img src="upfile/<%=goodsmap.get("filename") %>"" /></a></div>
										<div class="buttons">
											<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
											<a class="btn wishlist" href="/daoweigou/daoweigou?ac=delfav&goodid=<%=goodsmap.get("id") %>&page=favgoods.jsp" title="取消收藏"><span class="glyphicon glyphicon-remove"></span></a>
										</div>
										<div class="caption">
											<div class="name"><h3><a href="good.jsp?id=<%=goodsmap.get("id") %>"><%=goodsmap.get("goodname") %></a></h3></div>
											<div class="price">￥<%=goodsmap.get("price") %></div>
										</div>
									</div>
								</div>
								<%} %>
								</div>
								
						</div>
					</div>
					
					<div class="row text-center">
						${page.info }
					</div>
				</div>
				<jsp:include page="right.jsp"></jsp:include>
			</div>
		</div>
	</div>	
	
	
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
