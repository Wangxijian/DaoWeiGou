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
  HashMap member = dao.select("select * from member where id="+membersession.get("id")).get(0); %>
	
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="mydd.jsp">我的订单</a></li>
					</ul>
				</div>
			</div>
						<%String suc = (String)request.getAttribute("suc");
						if(suc!=null){%>
						    <div class="alert alert-info">
						        	<%=suc %>
					    	</div>
						<%}%>
			<div class="alert alert-info" id="tsinfo" style="display: none;">
				<button type="button" class="close" data-dismiss="alert">×</button>	
			</div>
			
			<%
			String sql = "select * from ddinfo where  memberid='"+member.get("id")+"' order by id desc";
			String url ="/daoweigou/mydd.jsp?1=1";
			String did = request.getParameter("did");
			if(did!=null){
				HashMap mm = dao.select("select * from ddinfo where id="+did).get(0);
           		dao.commOper("delete from ddinfo where id="+did);
           		dao.commOper("delete from dddetail where ddno="+mm.get("ddno"));
			}
			String shid = request.getParameter("shid");
            if(shid!=null)
            {
         		dao.commOper("update ddinfo set shstatus='已收货' where id="+shid);
            }
			%>
			<div class="row">
								<table class="bordered">  
									<thead>  
										<tr>  
										<th>订单号</th>  
										<th>订单商品</th>  
										<th>订单金额</th>
										<th>付款状态</th>
										<th>发货状态</th>  
										<th>物流</th> 
										<th>收货状态</th> 
										<th>订单日期</th> 
										<th>操作</th> 
										</tr>  
									</thead>
									<%
									PageManager pageManager = PageManager.getPage(url,10, request);
								    pageManager.doList(sql);
								    PageManager bean= (PageManager)request.getAttribute("page");
								    ArrayList<HashMap> infoslist=(ArrayList)bean.getCollection();
								    for(HashMap infosmap :infoslist)
								    {
									%>
									<tr>  
										<td><%=infosmap.get("ddno") %></td>  
										<td>
										<%ArrayList<HashMap> dddetaillist = (ArrayList<HashMap>)dao.select("select * from dddetail where ddno="+infosmap.get("ddno")); 
						                for(HashMap dddetail:dddetaillist){
						                	HashMap gmap = dao.select("select * from goods where id="+dddetail.get("goodid")).get(0);
						                %>
						                <a href="good.jsp?id=<%=gmap.get("id") %>"><%=gmap.get("goodname") %></a>&nbsp;&nbsp;&nbsp;数量：<%=dddetail.get("sl") %>
						                <% ArrayList<HashMap> pjlist = (ArrayList<HashMap>)dao.select("select * from pj where goodid='"+gmap.get("id")+"' and memberid='"+member.get("id")+"'");
						                if(pjlist.size()==0&&infosmap.get("shstatus").equals("已收货")){ %>
						                	<a href="pj.jsp?id=<%=gmap.get("id") %>">[评价]</a>
						                <%} %>
						                <br/>
						                <%} %></a>
										</td>  
										<td><%=infosmap.get("ddprice") %></td>  
										<td><%=infosmap.get("fkstatus") %></td>  
										<td><%=infosmap.get("fhstatus") %></td>
										<td><%=infosmap.get("wlinfo") %></td>
										<td><%=infosmap.get("shstatus") %></td>
										<td><%=infosmap.get("savetime").toString().substring(0,10) %></td>
										<td>
										<%if(infosmap.get("fkstatus").equals("待付款")){ %>
						                <a href="ddpay.jsp?ddid=<%=infosmap.get("id") %>&ddprice=<%=infosmap.get("ddprice") %>">付款</a>|
						                <%} %>
						                <%if(infosmap.get("fhstatus").equals("待发货")){ %>
						                <a href="mydd.jsp?did=<%=infosmap.get("id") %>">撤销</a>
						                <%} %>
						                <%if(infosmap.get("shstatus").equals("待收货")&&infosmap.get("fhstatus").equals("已发货")){ %>
						                <a href="mydd.jsp?shid=<%=infosmap.get("id") %>">确认收货</a>
						                <%}%>
										</td>
									</tr>  
									<%} %>
									<tr>
										<td colspan="9">${page.info }</td>
									</tr>
								</table>
								
								
				
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
		    }else{    
		    	$("#tsinfo").show(); 
		     	$("#tsinfo").html("数量更新失败");
		    }     
		 }     
		}); 
	}
</script>
</body>
</html>
