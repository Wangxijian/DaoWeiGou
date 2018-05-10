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
  <%CommDAO dao = new CommDAO(); 
  String id = request.getParameter("id");
  HashMap map = dao.select("select * from goods where id="+id).get(0);
  
  
  List<HashMap> list  = dao.select("select * from scan_his where scan_his_key = 'scan_his'");
  
  if(list.size()<=0){
  String sql = "insert into scan_his (scan_his_key,value) values ('scan_his','"+id+"')";
  dao.commOper(sql);
  }else{
  String  scan_value = list.get(0).get("value") + "," +id;
  String sql = "update scan_his set  value = '"+scan_value+"' where scan_his_key = 'scan_his'";
  dao.commOper(sql);
  }
  
  
  %>
  
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
						<li><a href="good.jsp?id=<%=id %>"><%=map.get("goodname") %></a></li>
					</ul>
				</div>
			</div>
			<div class="row">

						    <div class="alert alert-info" id="tsinfo" style="display: none;">
						        <button type="button" class="close" data-dismiss="alert">×</button>
						        	
					    	</div>

				<div id="main-content" class="col-md-8">
					<div class="product">
						<div class="col-md-6">
							<div class="image">
								<img src="upfile/<%=map.get("filename") %>" />
								<div class="image-more">
									 <ul class="row">
										 <li class="col-lg-3 col-sm-3 col-xs-4">
											<a href="good.jsp?id=<%=map.get("id") %>"><img class="img-responsive" src="upfile/<%=map.get("filename") %>"></a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<%HashMap ppmap = dao.select("select * from ppinfo where id="+map.get("goodpp")).get(0); 
						 HashMap fmap = dao.select("select * from protype where id="+map.get("fid")).get(0);
				   		 HashMap smap = dao.select("select * from protype where id="+map.get("sid")).get(0); %>
						<div class="col-md-6">
							<div class="caption">
								<div class="name"><h3><%=map.get("goodname") %></h3></div>
								<div class="info">
									<ul>
										<li>编号:  <%=map.get("goodno") %></li>
										<li>品牌:  <%=ppmap.get("ppname") %></li>
										<li>类别:  <%=fmap.get("typename") %> / <%=smap.get("typename") %></li>
										<li>价格:  
										
											<%if(map.get("tprice")!=null&&!map.get("tprice").equals("")){ %>
											<s>
											<%}%>
												￥<%=map.get("price") %>
											<%if(map.get("tprice")!=null&&!map.get("tprice").equals("")){ %>
											</s>
											<%}%>
											<%if(map.get("tprice")!=null&&!map.get("tprice").equals("")){ %>
												￥<%=map.get("tprice") %>
											<%} %>
										
										
										元</li>
									</ul>
								</div>
								<%ArrayList salelist = (ArrayList)dao.select("select * from dddetail where goodid="+map.get("id")); %>
								<div class="rating">已售: <%=salelist.size() %> 件</div>
								<div class="well"><label>Qty: </label> 
								<input type="hidden" value="<%=map.get("id") %>" id="gid" name="gid" >
								<input type="number" min="1" value="1" id="sl" name="sl" required>
								<a href="javascript:tocar()" class="btn btn-2 ">添加到购物车</a>
								<a href="javascript:tobuy()" class="btn btn-2 ">直接购买</a>
								</div>
								
							</div>
						</div>
						<div class="clear"></div>
					</div>	
					<div class="product-desc">
						<ul class="nav nav-tabs">
							<li class="active"><a href="javascript:void(0)" onclick="selectTag('tagContent0',this)">商品描述</a></li>
							<li><a href="javascript:void(0)" onclick="selectTag('tagContent1',this)">商品评价</a></li>
						</ul>
						<div class="tab-content" id="tags">
							<div id="tagContent0" class="tab-pane fade in active">
								<p><%=map.get("note") %></p>
							</div>
							<div id="tagContent1" class="tab-pane fade">
							  
							  <table class="bordered">  
									<thead>  
										<tr>  
										<th>评分等级</th>  
										<th>评价内容</th>  
										<th>回复</th>
										<th>评价人</th>
										<th>评价时间</th>  
										</tr>  
									</thead>
									<%String sql = "select  * from pj where goodid='"+id+"' order by savetime desc "; 
	                                String url ="/schoolseclivegoodsjysys/goodsx.jsp?1=1&id="+id;
	                                PageManager pageManager = PageManager.getPage(url,10, request);
								    pageManager.doList(sql);
								    PageManager bean= (PageManager)request.getAttribute("page");
								    ArrayList<HashMap> pjlist=(ArrayList)bean.getCollection();
								    for(HashMap pjmap :pjlist)
								    {
								    HashMap mmm = dao.select("select * from member where id="+pjmap.get("memberid")).get(0);
								    %>
									<tr>  
										<td><%=pjmap.get("jb") %>分</td>  
										<td><%=pjmap.get("msg") %></td>  
										<td><%=pjmap.get("hf") %></td>  
										<td><%=mmm.get("tname") %></td>
										<td><%=pjmap.get("savetime") %></td>
									</tr>  
									<%} %>
									<tr>
										<td colspan="9">${page.info }</td>
									</tr>
								</table>
							  
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="right.jsp"></jsp:include>
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

	function tocar(){     
		 var gid=document.getElementById("gid").value;
		 var sl=document.getElementById("sl").value;    
		 if(sl==""||sl<=0){
		    $("#tsinfo").show();
		    $("#tsinfo").html("请填写正确的数量");
		    return;
		 }  
		 $.ajax({  
		        type: "POST",      
		         url: "/daoweigou/daoweigou?ac=tocar", //servlet的名字     
		          data: "gid="+gid+"&sl="+sl, 
		         success: function(data){       
		    if(data=="true"){     
		    	$("#tsinfo").show();
		     	$("#tsinfo").html("该商品已加入到购物车");
		    }else{    
		    	$("#tsinfo").show(); 
		     	$("#tsinfo").html("加入购物车失败");
		     	location.href="login.jsp";
		    }     
		 }     
		});     
	}     


	function tobuy(){     
		 var gid=document.getElementById("gid").value;
		 var sl=document.getElementById("sl").value;    
		 if(sl==""||sl<=0){
		    $("#tsinfo").show();
		    $("#tsinfo").html("请填写正确的数量");
		    return;
		 }  
		 $.ajax({  
		        type: "POST",      
		         url: "/daoweigou/daoweigou?ac=tobuy", //servlet的名字     
		          data: "gid="+gid+"&sl="+sl, 
		         success: function(data){       
		    if(data=="true"){     
		    	$("#tsinfo").show();
		    	$("#tsinfo").html("订单已生成");
		    	location.href="mydd.jsp";
		    }else{    
		    	$("#tsinfo").show(); 
		    	$("#tsinfo").html("购买失败,登录或未维护收货地址");
		    }     
		 }     
		});     
	}     
	
	</script>
</body>
</html>
