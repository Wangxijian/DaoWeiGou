<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="<%=basePath%>">
    <meta name="description" content="Admin panel developed with the Bootstrap from Twitter.">
    <meta name="author" content="travis">
    
	<link rel="stylesheet" type="text/css" href="admin/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="admin/stylesheets/theme.css">
    <link rel="stylesheet" href="admin/lib/font-awesome/css/font-awesome.css">
    <script src="admin/lib/jquery-1.7.2.min.js" type="text/javascript"></script>

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
    <div class="navbar">
        <div class="navbar-inner">
                <ul class="nav pull-right">
                    
                </ul>
                <a class="brand" href="admin/login.jsp"><span class="first">后台管理系统</span> <!--  <span class="second">Company</span>--></a>
        </div>
    </div>
    


    

    
<div class="row-fluid">
    <div class="dialog">
    <%String error = (String)request.getAttribute("error");
	if(error!=null){%>
	    <div class="alert alert-info">
	        <button type="button" class="close" data-dismiss="alert">×</button>
	        	用户名或密码错误
    	</div>
	<%}%>
        <div class="block">
            <p class="block-heading">登录</p>
            <div class="block-body">
                <form action="/daoweigou/daoweigou?ac=login" method="post">
                    <label>用户名</label>
                    <input type="text" name="username" class="span12" required>
                    <label>密码</label>
                    <input type="password" name="userpwd" class="span12" required>
                    <input type="submit" class="btn btn-primary pull-right" value="登录">
                    <!--<label class="remember-me"><input type="checkbox"> Remember me</label>-->
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
        <!--  <p class="pull-right" style=""><a href="#" target="blank">Theme by Portnine</a></p>
        <p><a href="reset-password.html">Forgot your password?</a></p>-->
    </div>
</div>


    <script src="admin/lib/bootstrap/js/bootstrap.js"></script>
  </body>
</html>
