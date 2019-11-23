<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>农村民主建设信息管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/mian.css">
	<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript"></script>
	
</head>
<style>
.lay-bolg .header{
height:200px !important;
}
.lay-bolg .layui-container {

width:100% !important;
}
</style>

 <style type="text/css">
.list{
margin: 0px 10px 20px;
text-align: left;

}
.list ul{
list-style-type: none;
margin: 0px;
padding: 0px;
}
.list li{
width: 100%;font-size:14px;
}
.list li a{
color: #777777;
display: block;
padding: 6px 0px 4px 15px;
font-size:14px;
}
.list li span{
float: right;/*使span元素浮动到右面*/
text-align: right;/*日期右对齐*/
}
.list li a:hover{
color: #336699;
}
</style> 
<style type="text/css">
   #iframeTop{
            width: 100%;
            height: 200px;
            border-width: 0;
            frameborder:"no";
            border: 0;
            marginwidth:0 ;
            marginheight:0;
        }
        #content{
            width: 100%;
            height: 600px;
            border-width: 0;
            frameborder:"no";
            border: 0;
            marginwidth:0 ;
            marginheight:0;
        }
</style>
<body class="lay-blog">

		<div class="header" style="height:200px; margin: 0; padding:0">
			
				<iframe src="${pageContext.request.contextPath}/index_header.jsp" id = "iframeTop" scrolling = "no" style="margin:0;padding:0;"></iframe>
				
		
		</div>
		<div class="layui-container">  
		<div style="width:70%">
		  <div class="layui-row">
    <div class="layui-col-xs12 layui-col-sm6 layui-col-md10">
		<iframe src="${pageContext.request.contextPath}/moreInfo.jsp" id = "content" name = "content"scrolling = "no" style="height:0;"></iframe>
				
		
 <ul class=list id="ul">
 <c:forEach items="${clist}"  var="item" >
<li><span><fmt:formatDate value='${item.createDate}' type='date' pattern='yyyy-MM-dd'/></span>

<a href="./${item.path}" target="_blank">${item.title}</a></li></c:forEach>
<!-- <li><span>2007年12月21日</span><a href="#">新闻标题02</a></li>
<li><span>2007年12月21日</span><a href="#">新闻标题03</a></li> -->
</ul>
<div id="demo7"></div>
		</div>
		<div class="layui-col-xs12 layui-col-sm6 layui-col-md2 layui-hide-xs">
		   <img src="./images/public/新闻.jpg" width="300px" height="300px" style="padding-left:10%; padding-top:10%">
		   
		   </div>
		</div>
		   
		   </div>
		
 <script src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
 
<script>
layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
   
  //完整功能
  laypage.render({
    elem: 'demo7'
    ,count: ${count}
    ,layout: ['count', 'prev', 'page', 'next',  'refresh', 'skip']
    ,jump: function(obj, first){
    // window.location.href="${pageContext.request.contextPath}/getMoreInfo.do?page="+obj.curr+"&limit=10";
  //console.log(obj);
  if(!first){
 console.log(obj);
 if(obj.curr !=1){
 $("#ul").empty();
 $("#content").attr('src',"${pageContext.request.contextPath}/getMoreInfo.do?page="+obj.curr+"&limit=10");
 $("#content").attr('style',"width:100% ; height:320px; ");
 }
 else{
 window.location.href="${pageContext.request.contextPath}/getMoreInfo.do?page="+obj.curr+"&limit=10";
 }
 //window.location.href="${pageContext.request.contextPath}/getMoreInfo.do?page="+obj.curr+"&limit=10";
 }
      /* console.log(obj);
      var url = document.location.toString();
　　　　var arrUrl = url.split("?");

　　　　var para = arrUrl[1].split("&");
	  var page = para[0].split("=")[1];
     if(obj.curr != page)
      window.location.href="${pageContext.request.contextPath}/getMoreInfo.do?page="+page+"&limit=10";
    */ }
  });
  
  
  
  
  
  
});
</script>

 
<div class="header layui-bg-gray"  style="height:100px; font-size:10px;" >
<span  style="margin:3px;padding:3px;" >联系我们：www.minzhu.com</span>

<span  style="margin:3px;padding:3px;" >
服务承诺| 联系我们| 网站声明| 网站导航		
纪检监察监督举报</span>
<span  style="margin:3px;padding:3px;" >主办：保定市安新县白庄村员会 承办：保定市安新县白庄村员会   政府网站标识码：1100000159</span>

</div>
</div>
</body>
</html>