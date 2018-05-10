<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<base href="<%=basePath%>">
<meta name="description"
	content="Admin panel developed with the Bootstrap from Twitter.">
<meta name="author" content="travis">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<%
	CommDAO dao = new CommDAO();
	HashMap member = (HashMap) session.getAttribute("member");
%>
<body>
	<!--Top-->
	<nav id="top">
		<div class="container">
			<div class="row">
				<div class="col-xs-6"></div>
				<div class="col-xs-6">
					<ul class="top-link">
						<%
							if (member == null) {
						%>
						<li><a href="login.jsp"><span
								class="glyphicon glyphicon-user"></span> 登录</a>
						</li>
						<li><a href="reg.jsp"><span
								class="glyphicon glyphicon-user"></span> 注册</a>
						</li>
						<%
							} else {
						%>
						<li><a href="#" role="button" class="dropdown-toggle"
							data-toggle="dropdown"> <span
								class="glyphicon glyphicon-user"></span> <%=member.get("tname")%></a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="cart.jsp"><i
										class="glyphicon glyphicon-shopping-cart"></i>购物车&nbsp;&nbsp;&nbsp;&nbsp;</a>
								</li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="mydd.jsp"><i
										class="glyphicon glyphicon-gift"></i>我的订单</a>
								</li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="favgoods.jsp"><i
										class="glyphicon glyphicon-gift"></i>我的收藏</a>
								</li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="addr.jsp"><i
										class="glyphicon glyphicon-home"></i>收货地址</a>
								</li>
								<li class="divider visible-phone"></li>
								<li><a tabindex="-1" href="grinfo.jsp"><i
										class="glyphicon glyphicon-user"></i>会员资料</a>
								</li>
								<li class="divider"></li>
								<li><a tabindex="-1"
									href="/daoweigou/daoweigou?ac=frontexit"><i
										class="glyphicon glyphicon-log-out"></i>安全退出</a>
								</li>
							</ul></li>
						<%
							}
						%>
						<!--  <li><a href="contact.html"><span class="glyphicon glyphicon-envelope"></span> Contact</a></li>-->
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!--Header-->
	<header class="container">
		<div class="row">
			<div class="col-md-4">
				<div id="logo">
					<span style="font-size:25px">基于网上美酒商城的设计与实现</span>
				</div>
			</div>
			<div class="col-md-4">
				<form class="form-search" action="goods.jsp" method="post">
					<input type="text" placeholder="商品编号或名称..."
						class="input-medium search-query" id="key1" name="key1">
					<button type="submit" class="btn">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</form>
			</div>
			<div class="col-md-4">
				<div id="cart">
					<a class="btn btn-1"
						href="<%=member == null ? "login.jsp" : "cart.jsp"%>"><span
						class="glyphicon glyphicon-shopping-cart"></span>CART</a>
				</div>
			</div>
		</div>
	</header>
	<!--Navigation-->
	<nav id="menu" class="navbar">
		<div class="container">
			<div class="navbar-header">
				<span id="heading" class="visible-xs">Categories</span>
				<button type="button" class="btn btn-navbar navbar-toggle"
					data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<i class="fa fa-bars"></i>
				</button>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp">首页</a>
					</li>
					<%
						ArrayList<HashMap> ftypelist = (ArrayList<HashMap>) dao
								.select("select * from protype where fatherid='0' and delstatus='0'");
						for (HashMap ftypemap : ftypelist) {
					%>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><%=ftypemap.get("typename")%></a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<%
										ArrayList<HashMap> stypelist = (ArrayList<HashMap>) dao
													.select("select * from protype where fatherid='"
															+ ftypemap.get("id") + "' and delstatus='0'");
											for (HashMap stypemap : stypelist) {
									%>
									<li><a href="goods.jsp?key2=<%=stypemap.get("id")%>"><%=stypemap.get("typename")%></a>
									</li>
									<%
										}
									%>
								</ul>
							</div>
						</div></li>
					<%
						}
					%>
					<li><a href="news.jsp">站内资讯</a>
					</li>
					<li><a href="msg.jsp">留言板</a>
					</li>
					<li><a href="about.jsp">关于我们</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>
