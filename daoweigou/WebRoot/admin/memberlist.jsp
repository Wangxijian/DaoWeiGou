<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
<%@page import="dao.CommDAO"%>
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
    
    <%	 CommDAO dao = new CommDAO(); 
	 String sql = "select * from member where 1=1  and delstatus=0 ";
	 String url = "/daoweigou/admin/memberlist.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 key = Info.getUTFStr(key);
	 }
	 if(!key.equals(""))
	 {
	 sql+=" and (uname like'%"+key+"%' or tname like'%"+key+"%')";
	 url+="&key="+key;
	 }
	 sql+=" order by id desc";
	%>

	<jsp:include page="/admin/top.jsp"></jsp:include>
    
    <jsp:include page="/admin/left.jsp"></jsp:include>
    

    
       <div class="content">
        
          <div class="header">
            
            <h1 class="page-title">会员管理</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="admin/index.jsp">Home</a> <span class="divider">/</span></li>
            <li class="active">会员管理</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
            
            	<div class="btn-toolbar">
					<div class="search-well">
						<form action="admin/memberlist.jsp?f=f" method="post" class="form-inline">
							<input class="input-xlarge" placeholder="用户名或姓名..." id="key" name="key" type="text" value="<%=key %>">
		                    <button class="btn" type="submit"><i class="icon-search"></i> Go</button>
						</form>	
					</div>  	
				</div>
<div class="well">

    <table class="table">
      <thead>
        <tr>
          <th>登陆名</th>
          <th>登陆密码</th>
          <th>姓名</th>
          <th>性别</th>
          <th>邮编</th>
          <th>联系电话</th>
          <th>email</th>
          <th>qq</th>
          <th>注册日期</th>
          <th style="width: 26px;"></th>
        </tr>
      </thead>
      <tbody>
      <%String did = request.getParameter("did");
	   if(did!=null)
	   {
			dao.commOper("update member set delstatus='1' where id="+did);
	   }
	   PageManager pageManager = PageManager.getPage(url,10, request);
	   pageManager.doList(sql);
	   PageManager bean= (PageManager)request.getAttribute("page");
	   ArrayList<HashMap> list=(ArrayList)bean.getCollection();
	   for(HashMap map:list){
	    %>
        <tr>
          <td><%=map.get("uname") %></td>
          <td><%=map.get("upass") %></td>
          <td><%=map.get("tname") %></td>
          <td><%=map.get("sex") %></td>
          <td><%=map.get("ybcode") %></td>
          <td><%=map.get("tel") %></td>
          <td><%=map.get("email") %></td>
          <td><%=map.get("qq") %></td>
          <td><%=map.get("savetime") %></td>
          <td>
              <a href="admin/memberlist.jsp?did=<%=map.get("id") %>" ><i class="icon-remove"></i></a>
          </td>
        </tr>
        <%} %>
      </tbody>
    </table>
</div>
<div class="pagination">
    ${page.info }
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
