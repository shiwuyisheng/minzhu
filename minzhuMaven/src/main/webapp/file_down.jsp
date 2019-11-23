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
		<img alt="" src="${pageContext.request.contextPath}/images/public/政策.jpg" height="160px">
		
		<span style="color:green;">&nbsp;&nbsp;&nbsp;&nbsp;以下是村委会发布的文件，可供下载查看</span>
		
		
 <ul class=list>
 
<li><span>2019-05-15</span>
<a href="http://xxgk.baiyangdian.gov.cn/ueditor/php/upload/file/20190311/1552274001453727.rar" target="_blank">
<i class="layui-icon layui-icon-download-circle" style="font-size: 22px; color:#009688;"></i> 
行政审批局2019年预算公开
</a></li>
 
<li><span>2019-05-10</span>

<a href="http://xxgk.baiyangdian.gov.cn/ueditor/php/upload/file/20190311/1552274001453727.rar" target="_blank">
<i class="layui-icon layui-icon-download-circle" style="font-size: 22px; color:#009688;"></i> 
编办2019年预算公开
</a></li>
<li><span>2019-05-10</span>

<a href="http://xxgk.baiyangdian.gov.cn/ueditor/php/upload/file/20180824/1535103312105905.zip" target="_blank">
<i class="layui-icon layui-icon-download-circle" style="font-size: 22px; color:#009688;"></i>  
河北省人民政府关于进一步加强疫苗流通和预防接种管理工作的实施意见</a></li>
<li><span>2019-05-01</span>

<a href="http://xxgk.baiyangdian.gov.cn/ueditor/php/upload/file/20180824/1535103312105905.zip" target="_blank">
<i class="layui-icon layui-icon-download-circle" style="font-size: 22px; color:#009688;"></i> 
保定市人民政府关于进一步加强疫苗流通和预防接种管理工作的实施意见
</a></li>
<li><span>2019-04-20</span>

<a href="http://xxgk.baiyangdian.gov.cn/ueditor/php/upload/file/20180731/1533020708247432.zip" target="_blank">
<i class="layui-icon layui-icon-download-circle" style="font-size: 22px; color:#009688;"></i> 
关于印发《安新县2018年政务公开工作任务分工方案》的通知
</a></li>
<li><span>2018-12-23</span>

<a href="http://xxgk.baiyangdian.gov.cn/ueditor/php/upload/file/20190514/1557802369565652.rar" target="_blank">
<i class="layui-icon layui-icon-download-circle" style="font-size: 22px; color:#009688;"></i> 
2019年5月10日建设项目竣工环境保护验收申请受理情况公示
</a></li>



<!-- <li><span>2007年12月21日</span><a href="#">新闻标题02</a></li>
<li><span>2007年12月21日</span><a href="#">新闻标题03</a></li> -->
</ul>
<div id="demo7"></div>
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