<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
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
    
	<div id="page-content" class="home-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- Carousel -->
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators hidden-xs">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							<li data-target="#carousel-example-generic" data-slide-to="3"></li>
							<li data-target="#carousel-example-generic" data-slide-to="4"></li>
						</ol>
						<%String suc = (String)request.getAttribute("suc");
						if(suc!=null){%>
						    <div class="alert alert-info">
						        	<%=suc %>
					    	</div>
						<%}%>
						<!-- Wrapper for slides -->
						<%ArrayList<HashMap> imglist = (ArrayList<HashMap>)dao.select("select * from imgadv  order by id");  %>
						<div class="carousel-inner">
							<div class="item active">
								<img src="upfile/<%=imglist.get(0).get("filename") %>" alt="First slide" width="100%" height="40%">
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center">
									</div>
								</div><!-- /header-text -->
							</div>
						<% 
						for(int i=1;i<imglist.size();i++){
						%>
							<div class="item">
								<img src="upfile/<%=imglist.get(i).get("filename") %>" alt="First slide" width="100%" height="40%">
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center">
									</div>
								</div><!-- /header-text -->
							</div>
						<%} %>
						</div>
						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div><!-- /carousel -->
				</div>
			</div>
			
			<div class="row">
							<div class="alert alert-info" id="cartsinfo" style="display: none;">
						        <button type="button" class="close" data-dismiss="alert">×</button>
					    	</div>
				<div class="col-lg-12">
					<div class="heading"><h2>新品上架</h2></div>
					<div class="products lm-products">
					<ul class="lm-imgList">
					<%ArrayList<HashMap> goodslist = (ArrayList<HashMap>)dao.select("select * from goods where delstatus='0' order by id desc limit 12"); 
					int a=0;
					for(HashMap goodsmap:goodslist){
						a++;
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
			
			
			<div class="row">
				<div class="col-lg-12">
					<div class="heading"><h2>限时抢购</h2><span id="LeftTime" style="color:red"></span></div>
					<div class="products lm-products">
					<ul class="lm-imgList">
					<%ArrayList<HashMap> tjgoodslist = (ArrayList<HashMap>)dao.select("select * from goods where delstatus='0' and istj='yes' order by id desc limit 8");  
					int b = 0;
					for(HashMap tjgoodsmap:tjgoodslist){
					b++;
					%>
					
					<li class="lm-imgItem">
					        <a href="good.jsp?id=<%=tjgoodsmap.get("id") %>"><img src="upfile/<%=tjgoodsmap.get("filename") %>"/></a>
			                <div class="buttons">
									<a class="btn cart" href="javascript:tocar(<%=tjgoodsmap.get("id") %>)" title="加入购物车"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="/daoweigou/daoweigou?ac=addfav&goodid=<%=tjgoodsmap.get("id") %>&page=index.jsp" title="收藏此商品"><span class="glyphicon glyphicon-heart"></span></a>
						    </div>
						    <div class="caption">
									<div class="name lm-name"><a href="good.jsp?id=<%=tjgoodsmap.get("id") %>"><%=tjgoodsmap.get("goodname").toString().length()>13?tjgoodsmap.get("goodname").toString().substring(0,13)+"...":tjgoodsmap.get("goodname") %></a></div>
									<div class="price">
									<%if(tjgoodsmap.get("tprice")!=null&&!tjgoodsmap.get("tprice").equals("")){ %>
									<s>
									<%}%>
										￥<%=tjgoodsmap.get("price") %>
									<%if(tjgoodsmap.get("tprice")!=null&&!tjgoodsmap.get("tprice").equals("")){ %>
									</s>
									<%}%>
									<%if(tjgoodsmap.get("tprice")!=null&&!tjgoodsmap.get("tprice").equals("")){ %>
										￥<%=tjgoodsmap.get("tprice") %>
									<%} %>
									</div>
							</div>
					    </li>
					
						
					<%}%>
					</ul>
					</div>
				</div>
			</div>
			
			
			<%
			
			 List<HashMap> list  = dao.select("select * from scan_his where scan_his_key = 'scan_his'");
			 if(list.size()>0){
			 String value = (String)(list.get(0).get("value"));
			 String sql = "select * from goods where delstatus='0' and id in ("+ value;
			 sql += ") limit 4";
			 %>
			
			<div class="row">
				<div class="col-lg-12">
					<div class="heading"><h2>历史足迹</h2><span id="LeftTime" style="color:red"></span></div>
					<div class="products lm-products">
					<ul class="lm-imgList">
					<%ArrayList<HashMap> scanjgoodslist = (ArrayList<HashMap>)dao.select(sql);  
					int x = 0;
					for(HashMap tjgoodsmap:scanjgoodslist){
					x++;
					%>
					
					<li class="lm-imgItem">
					        <a href="good.jsp?id=<%=tjgoodsmap.get("id") %>"><img src="upfile/<%=tjgoodsmap.get("filename") %>"/></a>
			                <div class="buttons">
									<a class="btn cart" href="javascript:tocar(<%=tjgoodsmap.get("id") %>)" title="加入购物车"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="/daoweigou/daoweigou?ac=addfav&goodid=<%=tjgoodsmap.get("id") %>&page=index.jsp" title="收藏此商品"><span class="glyphicon glyphicon-heart"></span></a>
						    </div>
						    <div class="caption">
									<div class="name lm-name"><a href="good.jsp?id=<%=tjgoodsmap.get("id") %>"><%=tjgoodsmap.get("goodname").toString().length()>13?tjgoodsmap.get("goodname").toString().substring(0,13)+"...":tjgoodsmap.get("goodname") %></a></div>
									<div class="price">
									<%if(tjgoodsmap.get("tprice")!=null&&!tjgoodsmap.get("tprice").equals("")){ %>
									<s>
									<%}%>
										￥<%=tjgoodsmap.get("price") %>
									<%if(tjgoodsmap.get("tprice")!=null&&!tjgoodsmap.get("tprice").equals("")){ %>
									</s>
									<%}%>
									<%if(tjgoodsmap.get("tprice")!=null&&!tjgoodsmap.get("tprice").equals("")){ %>
										￥<%=tjgoodsmap.get("tprice") %>
									<%} %>
									</div>
							</div>
					    </li>
					
						
					<%}%>
					</ul>
					</div>
				</div>
			</div>
			
			
			
			<%
			}
			 %>
			
			
			
			
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

<script type="text/javascript">
function checktime(i){  
    if(i<10){  
        i="0"+i;  
  
    }  
    else{i=i;}  
    return i;  
   }  
   function freshTime(){  
    var endtime=new Date('2018/03/15');  
    var nowtime=new Date();  
    var lefttime=parseInt(endtime.getTime()-nowtime.getTime()); 
    
    var dm=24*60*60*1000;  
    var d=parseInt(lefttime/dm);  
    var hm=60*60*1000;  
    var h=parseInt((lefttime/hm)%24);  
    var mm=60*1000;  
    var m=parseInt((lefttime/mm)%60);  
    var s=parseInt((lefttime/1000)%60);  
    m=checktime(m);  
    s=checktime(s);  
    document.getElementById('LeftTime').innerHTML="还剩"+d+"天"+h+"小时"+m+"分钟"+s+"秒";  
    if (lefttime<0) {  
         document.getElementById('LeftTime').innerHTML="团购活动已经结束！";  
    }  
   }   
   freshTime();  
   var sh;  
   sh=setInterval('freshTime()',1000)  
</script>

</body>
</html>
