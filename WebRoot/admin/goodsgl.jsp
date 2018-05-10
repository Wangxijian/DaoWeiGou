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
     String sql = "select * from goods where 1=1 and delstatus='0' ";
	 String url = "/daoweigou/admin/goodsgl.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 key = Info.getUTFStr(key);
	 }
	 if(!key.equals(""))
	 {
		 sql+=" and (goodname like'%"+key+"%' or goodno like'%"+key+"%')";
	 url+="&key="+key;
	 }
	 if(!key1.equals(""))
	 {
	 sql+=" and (fid ='"+key1+"')";
	 url+="&key1="+key1;
	 }
	 if(!key2.equals(""))
	 {
	 sql+=" and (sid ='"+key2+"')";
	 url+="&key2="+key2;
	 }
	 sql+=" order by id desc";
%>

	<jsp:include page="/admin/top.jsp"></jsp:include>
    
    <jsp:include page="/admin/left.jsp"></jsp:include>
    

    
       <div class="content">
        
        <div class="header">
            
            <h1 class="page-title">商品管理</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="admin/index.jsp">Home</a> <span class="divider">/</span></li>
            <li class="active">商品管理</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
            <%String suc = (String)request.getAttribute("suc");
			if(suc!=null){%>
			    <div class="alert alert-info">
			        <button type="button" class="close" data-dismiss="alert">×</button>
			        	<%=suc %>
			        	<script type="text/javascript">
			        		location.href="admin/goodsgl.jsp";
			        	</script>
		    	</div>
			<%}%>
				<div class="btn-toolbar">
					<div class="search-well">
						<form action="admin/goodsgl.jsp?f=f" method="post" class="form-inline">
							<input class="input-xlarge" placeholder="商品编号或名称..." id="key" name="key" type="text" value="<%=key %>">
							<select id="key1" name="key1" onChange="Change_Select()" class="input-xlarge">
							<option value="">请选择大类</option>
					    		<%ArrayList<HashMap> fprotypelist = (ArrayList<HashMap>)dao.select("select * from protype where delstatus='0' and fatherid='0' "); 
					    		for(HashMap fprotype:fprotypelist){%>
					    		<option value="<%=fprotype.get("id") %>" <%if(key1.equals(fprotype.get("id"))){out.print("selected==selected");} %>><%=fprotype.get("typename") %></option>
					    		<%} %>
							</select>
							<select id="key2" name="key2" class="input-xlarge">
						    		<option value="">请选择小类</option>
						    		<%ArrayList<HashMap> sprotypelist = (ArrayList<HashMap>)dao.select("select * from protype where  fatherid='"+key1+"' "); 
						    		for(HashMap sprotype:sprotypelist){%>
						    		<option value="<%=sprotype.get("id") %>" <%if(key2.equals(sprotype.get("id"))){out.print("selected==selected");} %>><%=sprotype.get("typename") %></option>
						    		<%} %>
						    </select>
		                    <button class="btn" type="submit"><i class="icon-search"></i> Go</button>
						    <button class="btn btn-primary" onclick="goodsadd()" type="button"><i class="icon-plus"></i> 商品</button>
						</form>	
					</div>  	
				</div>
			
<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th>商品编号</th>
          <th>商品名称</th>
          <th>所属大类</th>
          <th>所属小类</th>
          <th>价格/特价</th>
          <th>商品品牌</th>
          <th>是否推荐</th>
          <th>商品评价</th>
          <th style="width: 26px;"></th>
        </tr>
      </thead>
      <tbody>
      <%String did = request.getParameter("did");
      if(did!=null)
      {
   	   dao.commOper("update goods set delstatus='1' where id="+did);
      }
      String tjid = request.getParameter("tjid");
      if(tjid!=null)
      {
   	   dao.commOper("update goods set istj='yes' where id="+tjid);
      }
      String qxtjid = request.getParameter("qxtjid");
      if(qxtjid!=null)
      {
   	   dao.commOper("update goods set istj='no' where id="+qxtjid);
      }
   PageManager pageManager = PageManager.getPage(url,10, request);
   pageManager.doList(sql);
   PageManager bean= (PageManager)request.getAttribute("page");
   ArrayList<HashMap> list=(ArrayList)bean.getCollection();
   	for(HashMap map:list){
   		HashMap fmap = dao.select("select * from protype where id="+map.get("fid")).get(0);
   		HashMap smap = dao.select("select * from protype where id="+map.get("sid")).get(0);
   		HashMap ppmap = dao.select("select * from ppinfo where id="+map.get("goodpp")).get(0);
	    %>
        <tr>
          <td><%=map.get("goodno") %></td>
          <td><%=map.get("goodname") %></td>
          <td><%=fmap.get("typename") %></td>
          <td><%=smap.get("typename") %></td>
          <td><%=map.get("price") %>/<%=map.get("tprice")==null?"":map.get("tprice") %>
          <a href="admin/goodstjset.jsp?id=<%=map.get("id") %>">特价</a>
          </td>
          <td><%=ppmap.get("ppname") %></td>
          <td><%=map.get("istj") %></td>
          <td><a href="admin/goodpj.jsp?gid=<%=map.get("id") %>">查看</a></td>
          <td>
              <%
			    if(map.get("istj").equals("no")){ %>
			    <a href="admin/goodsgl.jsp?tjid=<%=map.get("id") %>" title="限时抢购"><i class="icon-thumbs-up"></i></a>
			    <%}else{ %>
			    <a href="admin/goodsgl.jsp?qxtjid=<%=map.get("id") %>" title="取消限时抢购"><i class="icon-thumbs-down"></i></a>
			    <%} %>
              <a href="admin/goodsedit.jsp?id=<%=map.get("id") %>"><i class="icon-pencil"></i></a>
              <a href="admin/goodsgl.jsp?did=<%=map.get("id") %>" ><i class="icon-remove"></i></a>
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
    	function goodsadd(){
			location.href="admin/goodsadd.jsp";
        }
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
        
        var req;
        function Change_Select(){//当第一个下拉框的选项发生改变时调用该函数
          var fprotype = document.getElementById('key1').value;
          var url = "/daoweigou/daoweigou?ac=searchsontype&fprotype="+ escape(fprotype);
          if(window.XMLHttpRequest){
            req = new XMLHttpRequest();
          }else if(window.ActiveXObject){
            req = new ActiveXObject("Microsoft.XMLHTTP");
          }  
          if(req){
            req.open("GET",url,true);
             //指定回调函数为callback
            req.onreadystatechange = callback;
            req.send(null);
          }
        }
        //回调函数
        function callback(){
          if(req.readyState ==4){
            if(req.status ==200){
            //var msg = req.responseText;
    		//		alert(msg);
            
              parseMessage();//解析XML文档
            }else{
              alert("不能得到描述信息:" + req.statusText);
            }
          }
        }
        //解析返回xml的方法
        function parseMessage(){
          var xmlDoc = req.responseXML.documentElement;//获得返回的XML文档
          var xSel = xmlDoc.getElementsByTagName('select');
          //获得XML文档中的所有<select>标记
          var select_root = document.getElementById('key2');
          //获得网页中的第二个下拉框
          select_root.options.length=0;
          //每次获得新的数据的时候先把每二个下拉框架的长度清0
         
          for(var i=0;i<xSel.length;i++){
            var xValue = xSel[i].childNodes[0].firstChild.nodeValue;
            //获得每个<select>标记中的第一个标记的值,也就是<value>标记的值
            var xText = xSel[i].childNodes[1].firstChild.nodeValue;
            //获得每个<select>标记中的第二个标记的值,也就是<text>标记的值
           
            var option = new Option(xText, xValue);
            //根据每组value和text标记的值创建一个option对象
            try{
              select_root.add(option);//将option对象添加到第二个下拉框中
            }catch(e){
            }
          }
        }    
    </script>
  </body>
</html>
