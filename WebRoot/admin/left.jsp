<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<link rel="stylesheet" type="text/css" href="/daoweigou/admin/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/daoweigou/admin/stylesheets/theme.css">
    <link rel="stylesheet" href="/daoweigou/admin/lib/font-awesome/css/font-awesome.css">

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
  
  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  <body class=""> 
  <!--<![endif]-->
  
    <div class="sidebar-nav">
        <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>基础信息管理<i class="icon-chevron-up"></i></a>
        <ul id="dashboard-menu" class="nav nav-list collapse in">
            <li><a href="admin/index.jsp">Home</a></li>
            <li><a href="admin/memberlist.jsp">会员管理</a></li>
            <li><a href="admin/userlist.jsp">用户管理</a></li>
            <li><a href="admin/newslist.jsp">资讯管理</a></li>
            <li><a href="admin/yqlink.jsp">友情链接</a></li>
            <li><a href="admin/imgadv.jsp">滚动图片</a></li>
            <li><a href="admin/aboutedit.jsp">关于我们</a></li>
        </ul>
<!-- <span class="label label-info">+3</span> -->
        <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-briefcase"></i>业务功能<i class="icon-chevron-up"></i></a>
        <ul id="accounts-menu" class="nav nav-list collapse in">
            <li><a href="admin/protype.jsp">商品类别</a></li>
            <li><a href="admin/ppinfo.jsp">商品品牌</a></li>
            <li><a href="admin/goodsgl.jsp">商品管理</a></li>
            <li><a href="admin/goodskc.jsp">商品库存</a></li>
            <li><a href="admin/ddgl.jsp">订单管理</a></li>
            <li><a href="admin/msglist.jsp">留言管理</a></li>
        </ul>
        <a href="#tj-menu" class="nav-header" data-toggle="collapse"><i class="icon-briefcase"></i>统计分析<i class="icon-chevron-up"></i></a>
        <ul id="tj-menu" class="nav nav-list collapse in">
            <li><a href="admin/tj1.jsp">订单量分析</a></li>
            <li><a href="admin/tj2.jsp">销售额分析</a></li>
            <li><a href="admin/tj3.jsp">销售量分析</a></li>
        </ul>

        
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
