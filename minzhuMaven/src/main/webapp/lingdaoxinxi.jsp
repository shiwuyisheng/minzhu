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
width: 100%;font-size:18px;
}
.list li a{
color: #777777;
display: block;
padding: 6px 0px 4px 15px;
font-size:18px;
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
		<img alt="" src="${pageContext.request.contextPath}/images/public/领导.jpg" height="160px">
		
		<span style="color:green;">&nbsp;&nbsp;&nbsp;&nbsp;以下是村委会领导信息</span>
		<p style='text-align: center;'><span style='color: rgb(255, 0, 0);'><strong><span style='font-size: 24px;'>领导介绍</span></strong></span><span style='text-align: left;'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></p><p><img alt='' src='/ueditor/jsp/upload/image/20190527/1558922648245020452.png'/></p><p style='text-align: left;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style='color: rgb(0, 90, 196); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 18px;'>凌遥&nbsp; 村长：</span><span style='font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 18px;'>负<span style='font-family: sans-serif; font-size: 16px;'>责村委全面工作、人事管理、离退休干部工作，机关党建、文明单位创建、政治文化建设、党务公开等方面工作。</span></span></p><p style='text-align: left;'><span style='color: rgb(0, 90, 196); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 18px;'>&nbsp;&nbsp;&nbsp;&nbsp;周建军 副村长：</span><span style='font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 18px; text-align: center;'>
		&nbsp;<span style='font-family: arial, helvetica, sans-serif;'>
		负责村中政全面工作；主管审计、法制、信息化工作；分管信息技术中心。</span></span></p>
		<p style='white-space: normal; text-align: left;'>
		<img alt='' src='http://localhost:8080/ueditor/jsp/upload/image/20190527/1558922648245020452.png'/>&nbsp; &nbsp;&nbsp;<span style='color: rgb(0, 90, 196); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 18px; text-align: center;'>马丽&nbsp;计生主任 ：<span style='font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 18px; text-align: center; color: rgb(0, 0, 0);'>负责主管计生工作</span></span></p><p style='white-space: normal; text-align: left;'><span style='color: rgb(0, 90, 196); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 18px; text-align: center;'>&nbsp; &nbsp;&nbsp;耿晶晶&nbsp;治保委员：</span>负责主持纪委全面工作；主管纪检监察工作；分管纪检监察审计室</p>
		<p style='white-space: normal; text-align: left;'><span style='color: rgb(0, 90, 196); font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 18px; text-align: center;'>&nbsp; &nbsp; 明天&nbsp;书记： <span style='font-family: 微软雅黑, Arial, Helvetica, sans-serif; font-size: 18px; text-align: center; color: rgb(0, 0, 0);'>负责&nbsp;党组织管理。</span></span></p><p>&nbsp;</p><p style='text-align: left;'><br/></p>
	
		</div>
 
<script>
layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
   
  //完整功能
  laypage.render({
    elem: 'demo7'
    ,count: ${count}
    ,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
    ,jump: function(obj){
      console.log(obj)
      
    }
  });
  
  
  
  
  
  
});
</script>

 
<div class="header layui-bg-gray"  style="height:100px; font-size:10px; padding-top:200px;" >
<span  style="margin:3px;padding:3px;" >联系我们：www.minzhu.com</span>

<span  style="margin:3px;padding:3px;" >
服务承诺| 联系我们| 网站声明| 网站导航		
纪检监察监督举报</span>
<span  style="margin:3px;padding:3px;" >主办：保定市安新县白庄村员会 承办：保定市安新县白庄村员会   政府网站标识码：1100000159</span>

</div>
</div>
</body>
</html>