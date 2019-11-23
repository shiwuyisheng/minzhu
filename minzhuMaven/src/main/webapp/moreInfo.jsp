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
<body >

			
		
 <ul class=list>
 <c:forEach items="${clist}"  var="item" >
<li><span><fmt:formatDate value='${item.createDate}' type='date' pattern='yyyy-MM-dd'/></span>

<a href="./${item.path}" target="_blank">${item.title}</a></li></c:forEach>
<!-- <li><span>2007年12月21日</span><a href="#">新闻标题02</a></li>
<li><span>2007年12月21日</span><a href="#">新闻标题03</a></li> -->
</ul>

		</div>
 
</div>
</body>
</html>