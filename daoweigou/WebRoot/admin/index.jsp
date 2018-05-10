<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理系统</title>
    
	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<link rel="stylesheet" type="text/css" href="/daoweigou/admin/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/daoweigou/admin/stylesheets/theme.css">
    <link rel="stylesheet" href="/daoweigou/admin/lib/font-awesome/css/font-awesome.css">

    <script src="/daoweigou/admin/lib/jquery-1.7.2.min.js" type="text/javascript"></script>
	
    <!-- Demo page code -->

    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">

  </head>
  
  <body class="">
    
    

	<jsp:include page="/admin/top.jsp"></jsp:include>
    
    <jsp:include page="/admin/left.jsp"></jsp:include>
    

    
    <div class="content">
        
        <div class="header">


            <h1 class="page-title">Home</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
            <li class="active">Dashboard</li>
        </ul>
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title=" "> </a></div>
        <div class="container-fluid">
            <div class="row-fluid">
                    
<%CommDAO dao = new CommDAO();  
	ArrayList list1 = (ArrayList)dao.select("select * from member where delstatus='0'");
	ArrayList list2 = (ArrayList)dao.select("select * from goods where delstatus='0'");
	ArrayList<HashMap> list3 = (ArrayList<HashMap>)dao.select("select * from ddinfo where fkstatus='已付款'");
	double salemoney =0.0;
	for(HashMap map:list3){
		salemoney += Double.valueOf(map.get("ddprice").toString());
	}
%>
<div class="row-fluid">
    <div class="block">
        <a href="#page-stats" class="block-heading" data-toggle="collapse">业务统计</a>
        <div id="page-stats" class="block-body collapse in">

            <div class="stat-widget-container">
                <div class="stat-widget">
                    <div class="stat-button">
                        <p class="title"><%=list1.size() %></p>
                        <p class="detail">注册会员量</p>
                    </div>
                </div>
                
                <div class="stat-widget">
                    <div class="stat-button">
                        <p class="title"><%=list2.size() %></p>
                        <p class="detail">商品总数</p>
                    </div>
                </div>

                <div class="stat-widget">
                    <div class="stat-button">
                        <p class="title"><%=list3.size() %></p>
                        <p class="detail">订单量</p>
                    </div>
                </div>

                <div class="stat-widget">
                    <div class="stat-button">
                        <p class="title"><%=salemoney %></p>
                        <p class="detail">销售额</p>
                    </div>
                </div>

              

            </div>
        </div>
    </div>
</div>

<div class="row-fluid">
    <div class="block span6">
        <a href="#tablewidget" class="block-heading" data-toggle="collapse">会员订单量排行</a>
        <div id="tablewidget" class="block-body collapse in">
        <%String sql = "SELECT  distinct memberid,count( *) as ddl  FROM ddinfo where fkstatus='已付款' group by memberid order by ddl desc ";
        ArrayList<HashMap> list4 = (ArrayList<HashMap>)dao.select(sql);
        %>
            <table class="table">
              <thead>
                <tr>
                  <th>用户名</th>
                  <th>姓名</th>
                  <th>订单量</th>
                </tr>
              </thead>
              <tbody>
              <%for(HashMap map2:list4){
            	  HashMap mmap = dao.select("select * from member where id="+map2.get("memberid")+"").get(0);
            	  %>
                <tr>
                  <td><%=mmap.get("uname") %></td>
                  <td><%=mmap.get("tname") %></td>
                  <td><%=map2.get("ddl") %></td>
                </tr>
               <%} %>
              </tbody>
            </table>
        </div>
    </div>
    <div class="block span6">
        <a href="#widget1container" class="block-heading" data-toggle="collapse">商品销量排行</a>
        <div id="widget1container" class="block-body collapse in">
            <%String sql2 = "SELECT distinct goodid,sum(sl) as xl  FROM dddetail a, ddinfo b where a.ddno=b.ddno and b.fkstatus='已付款' group by goodid order by xl desc ";
	        ArrayList<HashMap> list5 = (ArrayList<HashMap>)dao.select(sql2);
	        %>
            <table class="table">
              <thead>
                <tr>
                  <th>商品编号</th>
                  <th>商品名称</th>
                  <th>销售量</th>
                </tr>
              </thead>
              <tbody>
              <%for(HashMap map3:list5){
            	  HashMap gmap = dao.select("select * from goods where id="+map3.get("goodid")+"").get(0);
            	  %>
                <tr>
                  <td><%=gmap.get("goodno") %></td>
                  <td><%=gmap.get("goodname") %></td>
                  <td><%=map3.get("xl") %></td>
                </tr>
               <%} %>
              </tbody>
            </table>
        </div>
    </div>
</div>




                    
                  <!--    <footer>
                        <hr>
                        <p class="pull-right">Collect from <a href="http://www.cssmoban.com/" title=" " target="_blank"> </a></p>

                        <p>&copy; 2012 <a href="#" target="_blank">Portnine</a></p>
                    </footer>
                    -->
            </div>
        </div>
    </div>
    


    <script src="/daoweigou/admin/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
  </body>
</html>
