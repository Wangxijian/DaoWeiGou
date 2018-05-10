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
            <li class="active">销量额分析</li>
        </ul>
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title=" "> </a></div>
        <div class="container-fluid">
            <div class="row-fluid">
                    
<%CommDAO dao = new CommDAO();  
String sql = "select date_format(savetime,'%Y-%m-%d') as days,sum(ddprice) as ddprice from ddinfo where fkstatus='已付款' group by days";
	ArrayList<HashMap> list = (ArrayList<HashMap>)dao.select(sql);
%>
<div class="row-fluid">
    <div class="block">
        <a href="#page-stats" class="block-heading" data-toggle="collapse">销量额分析</a>
        <div id="page-stats" class="block-body collapse in">

            <div class="stat-widget-container">
                <div id="chartdiv" align="center"> FusionCharts. </div>
  	<script language="JavaScript" src="/daoweigou/admin/FusionCharts.js"></script>
  	 <script type="text/javascript">
		var chart = new FusionCharts("/daoweigou/admin/FCF_Line.swf", "ChartId", "900", "300");
		var xmlstr = "<graph showNames='1'  decimalPrecision='0'  > "+
		<%
		
//String sql = "select outtime,count(*) as sl from cwtocar where outtime is not null group by outtime  ";

		
		for(HashMap m:list){
		 %>
		  "   <set name='<%=m.get("days")%>' value='<%=m.get("ddprice")%>'/> "+
		<%}%>
		  "   </graph>"; 
		   chart.setDataXML(xmlstr);		   
		   chart.render("chartdiv");
		</script>

              

            </div>
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
