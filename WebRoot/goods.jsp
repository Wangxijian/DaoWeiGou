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
						<li><a href="goods.jsp">商品列表</a></li>
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
							<div class="alert alert-info" id="cartsinfo" style="display: none;">
						        <button type="button" class="close" data-dismiss="alert">×</button>
					    	</div>
					    	
					    	<%HashMap member = (HashMap)session.getAttribute("member");
				         	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
				         	 String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
				         	 String key3 = request.getParameter("key3")==null?"":request.getParameter("key3");
				         	 String url ="goods.jsp?1=1";
				             String sql = "select  * from goods where delstatus='0'  "; 
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
				              sql+=" order by savetime desc"; %>
					    	
				<div id="main-content" class="col-md-8">
					<div class="row">
						<div class="col-md-12">
							<div class="products lm-products">
								<ul class="lm-imgList">
							<%
								PageManager pageManager = PageManager.getPage(url,9, request);
							    pageManager.doList(sql);
							    PageManager bean= (PageManager)request.getAttribute("page");
							    ArrayList<HashMap> goodslist=(ArrayList)bean.getCollection();
							    int a = 0;
							    for(HashMap goodsmap :goodslist)
							    {
							    %>
								<li class="lm-imgItem">
							        <a href="good.jsp?id=<%=goodsmap.get("id") %>"><img src="upfile/<%=goodsmap.get("filename") %>"/></a>
					                <div class="buttons">
											<a class="btn cart" href="javascript:tocar(<%=goodsmap.get("id") %>)" title="加入购物车"><span class="glyphicon glyphicon-shopping-cart"></span></a>
											<a class="btn wishlist" href="/daoweigou/daoweigou?ac=addfav&goodid=<%=goodsmap.get("id") %>&page=index.jsp" title="收藏此商品"><span class="glyphicon glyphicon-heart"></span></a>
								    </div>
								    <div class="caption">
											<div class="name lm-name"><a href="good.jsp?id=<%=goodsmap.get("id") %>"><%=goodsmap.get("goodname").toString().length()>13?goodsmap.get("goodname").toString().substring(0,13)+"...":goodsmap.get("goodname") %></a></div>
											<div class="price">
											<%if(goodsmap.get("tprice")!=null&&!goodsmap.get("tprice").equals("")){ %>
											<s>
											<%}%>
												￥<%=goodsmap.get("price") %>
											<%if(goodsmap.get("tprice")!=null&&!goodsmap.get("tprice").equals("")){ %>
											</s>
											<%}%>
											<%if(goodsmap.get("tprice")!=null&&!goodsmap.get("tprice").equals("")){ %>
												￥<%=goodsmap.get("tprice") %>
											<%} %>
											</div>
									</div>
							    </li>
								<%} %>
								</ul>
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
	
	<script type="text/javascript">
function tocar(gid){     
	 $.ajax({  
	        type: "POST",      
	         url: "/daoweigou/daoweigou?ac=tocar", //servlet的名字     
	          data: "gid="+gid+"&sl=1", 
	         success: function(data){       
	    if(data=="true"){     
	    	$("#cartsinfo").show();
	     	$("#cartsinfo").html("该商品已加入到购物车");
	    }else{    
	    	$("#cartsinfo").show(); 
	     	$("#cartsinfo").html("加入购物车失败");
	    }     
	 }     
	});     
}     
</script>
</body>
</html>
