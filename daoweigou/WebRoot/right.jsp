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
  <%CommDAO dao = new CommDAO();  %>
  <body>
    <div id="sidebar" class="col-md-4">
					<div class="widget wid-discouts">
						<div class="heading"><h4>品牌</h4></div>
						<div class="content">
						<ul class="list-unstyled">
						<%String sql = "select * from ppinfo where 1=1 and delstatus='0' ";
						ArrayList<HashMap> pplist  = (ArrayList<HashMap>)dao.select("select * from ppinfo where delstatus='0'");
						for(HashMap ppmap:pplist){%>
							<li><a href="goods.jsp?key3=<%=ppmap.get("id") %>"><%=ppmap.get("ppname") %></a></li>
						<%} %>
						</ul>
						</div>
					</div>
					<div class="widget wid-product">
						<div class="heading"><h4>销量排行</h4></div>
						<div class="content">
						<%String sql2 = "SELECT distinct goodid,sum(sl) as xl  FROM dddetail a, ddinfo b where a.ddno=b.ddno and b.fkstatus='已付款' group by goodid order by xl desc ";
				        ArrayList<HashMap> list5 = (ArrayList<HashMap>)dao.select(sql2);
				        String gname = "";
				        for(HashMap map3:list5){
		            	  HashMap gmap = dao.select("select * from goods where id="+map3.get("goodid")+"").get(0);
		            	  if(gmap.get("goodname").toString().length()>=8){
		            		  gname = gmap.get("goodname").toString().substring(0,8)+"...";
		            	  }
		            	  %>
							<div class="product">
								<a href="good.jsp?id=<%=gmap.get("id") %>"><img src="upfile/<%=gmap.get("filename") %>" /></a>
								<div class="wrapper">
									<h5><a href="good.jsp?id=<%=gmap.get("id") %>" title="<%=gmap.get("goodname")%>"><%=gname %></a></h5>
									<div class="price"><%=map3.get("xl") %> 件</div>
								</div>
							</div>
						<%} %>	
						</div>
					</div>
				</div>
  </body>
</html>
