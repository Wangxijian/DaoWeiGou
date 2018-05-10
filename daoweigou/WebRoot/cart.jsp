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
  HashMap member = dao.select("select * from member where id="+membersession.get("id")).get(0); %>
	
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="cart.jsp">购物车</a></li>
					</ul>
				</div>
			</div>
			<div class="alert alert-info" id="tsinfo" style="display: none;">
				<button type="button" class="close" data-dismiss="alert">×</button>	
			</div>
			<%
			String did = request.getParameter("did");
			if(did!=null){
				dao.commOper("delete from car where id="+did);
			}
			ArrayList<HashMap> goodlist = (ArrayList<HashMap>)dao.select("select *,a.id as aid,b.id as bid from car a,goods b where a.gid=b.id and a.mid='"+member.get("id")+"' and b.delstatus='0' order by a.id desc");
			double totalprice = 0.0;
			for(int i=0;i<goodlist.size();i++){ 
			HashMap carmap = goodlist.get(i);
			HashMap ppmap = dao.select("select * from ppinfo where id="+carmap.get("goodpp")).get(0); 
			HashMap fmap = dao.select("select * from protype where id="+carmap.get("fid")).get(0);
	   		HashMap smap = dao.select("select * from protype where id="+carmap.get("sid")).get(0);
	   		
	   		if(carmap.get("tprice")!=null&&!carmap.get("tprice").equals("")){ 
	   			totalprice += Double.valueOf(carmap.get("tprice").toString())*Integer.valueOf(carmap.get("sl").toString());
	   		}else{
	   			totalprice += Double.valueOf(carmap.get("price").toString())*Integer.valueOf(carmap.get("sl").toString());
	   		}
			%>
			<div class="row">
			
				<div class="product well">
					<div class="col-md-3">
						<div class="image">
							<img src="upfile/<%=carmap.get("filename") %>" />
						</div>
					</div>
					<div class="col-md-9">
						<div class="caption">
							<div class="name"><h3><a href="good.jsp?id=<%=carmap.get("bid") %>"><%=carmap.get("goodname") %></a></h3></div>
							<div class="info">	
								<ul>
									<li>品牌: <%=ppmap.get("ppname") %></li>
									<li>类别：<%=fmap.get("typename") %> / <%=smap.get("typename") %></li>
								</ul>
							</div>
							<div class="price">
							
							
							<%if(carmap.get("tprice")!=null&&!carmap.get("tprice").equals("")){ %>
								￥<%=carmap.get("tprice") %>
							<%}else{ %>
								￥<%=carmap.get("price") %>
							<%} %>
							
							</div>
							<label>Qty: </label> 
							<input type="hidden" value="<%=carmap.get("aid") %>" id="carid<%=i %>" name="carid<%=i %>">
							<input type="number" min="1" id="sl<%=i %>" value="<%=carmap.get("sl") %>" required ><a href="javascript:updatecar(<%=i %>)" class="btn btn-2 ">修改</a>
							<hr>
							<a href="cart.jsp?did=<%=carmap.get("aid") %>" class="btn btn-default pull-right">REMOVE</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>	
			</div>
			<%} %>
			<div class="row">
				<div class="col-md-4 col-md-offset-8 ">
					<center><a href="goods.jsp" class="btn btn-1">继续购物</a></center>
				</div>
			</div>
			<div class="row">
				<div class="pricedetails">
					<div class="col-md-4 col-md-offset-8">
						<table>
							<h6>Price Details</h6>
							<tr>
								<td>Total</td>
								<td id="dprice"><%=totalprice %></td>
							</tr>
							<tr style="border-top: 1px solid #333">
								<td><h5>TOTAL</h5></td>
								<td id="tprice"><%=totalprice %></td>
							</tr>
						</table>
						<%if(goodlist.size()>0){ %>
						<center><a href="checkout.jsp" class="btn btn-1">创建订单</a></center>
						<%}else{ %>
						<center><a href="goods.jsp" class="btn btn-1">购物车内无商品，快去选购吧!</a></center>
						<%} %>
					</div>
				</div>
			</div>
		</div>
	</div>	
	
	<jsp:include page="foot.jsp"></jsp:include>
<script type="text/javascript">
	function addradd(){
		location.href="addradd.jsp";
	}
	function updatecar(i){
		var carid=document.getElementById("carid"+i).value;
		var sl=document.getElementById("sl"+i).value;
		if(sl==""||sl<=0){
		    $("#tsinfo").show();
		    $("#tsinfo").html("请填写正确的数量");
		    return;
		 }  
		 $.ajax({  
		        type: "POST",      
		         url: "/daoweigou/daoweigou?ac=updatecart", //servlet的名字     
		          data: "carid="+carid+"&sl="+sl, 
		         success: function(data){       
		    if(data=="true"){     
		    	$("#tsinfo").show();
		     	$("#tsinfo").html("数量已更新");
		     	updatetprice();
		    }else{    
		    	$("#tsinfo").show(); 
		     	$("#tsinfo").html("数量更新失败");
		    }     
		 }     
		}); 
	}

	function updatetprice(){
		$.ajax({  
	        type: "POST",      
	         url: "/daoweigou/daoweigou?ac=updatetprice", //servlet的名字     
	          data: "", 
	         success: function(data){       
	    if(data!=null){     
	    	$("#dprice").html(data);
	    	$("#tprice").html(data);
	    }else{    
	    }     
	 }     
	}); 
	}
</script>
</body>
</html>
