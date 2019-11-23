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
		<%-- <iframe src="${pageContext.request.contextPath}/content.jsp"  id="content"  scrolling = "no" style="width:100%;margin:0;padding:0;"></iframe>
		 --%>		
 
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
white-space:nowrap; overflow:hidden; text-overflow:ellipsis;
}
.list li span{
float: right;/*使span元素浮动到右面*/
text-align: right;/*日期右对齐*/
}
.list li a:hover{
color: #336699;
}
</style> 
 
   <div class="layui-row">
    <div class="layui-col-xs6 layui-col-sm6 layui-col-md9  layui-hide-xs">
    <br/>

      <div class="layui-carousel" id="test10">
  <div carousel-item="">
    <div><img  width="808px" src="${pageContext.request.contextPath}/北京市住房和城乡建设委员会门户网站_files/2017110311492519519.jpg"></div>
    <div><img  width="808px" src="${pageContext.request.contextPath}/images/index_img/轮播1.jpeg"></div>
    <div><img  width="808px" src="${pageContext.request.contextPath}/images/index_img/轮播2.jpg"></div>
    <div><img  width="808px" src="${pageContext.request.contextPath}/images/index_img/轮播3.jpg"></div>
    <div><img  width="808px" src="${pageContext.request.contextPath}/images/index_img/轮播4.jpg"></div>
    <div><img  width="808px" src="${pageContext.request.contextPath}/images/index_img/轮播5.jpg"></div>
    <div><img  width="808px" src="${pageContext.request.contextPath}/北京市住房和城乡建设委员会门户网站_files/2017110311492519519.jpg"></div>
  </div>
</div>
<script>
layui.use(['carousel', 'form'], function(){
  var carousel = layui.carousel
  ,form = layui.form;
  //改变下时间间隔、动画类型、高度
  carousel.render({
    elem: '#test2'
    ,interval: 1800
    ,anim: 'fade'
    ,height: '120px'
  });
  
  //图片轮播
  carousel.render({
    elem: '#test10'
    ,width: '808px'
    ,height: '282px'
    ,interval: 5000
  });
  
  
  var $ = layui.$, active = {
    set: function(othis){
      var THIS = 'layui-bg-normal'
      ,key = othis.data('key')
      ,options = {};
      
      othis.css('background-color', '#5FB878').siblings().removeAttr('style'); 
      options[key] = othis.data('value');
      ins3.reload(options);
    }
  };
  
  //监听开关
  form.on('switch(autoplay)', function(){
    ins3.reload({
      autoplay: this.checked
    });
  });
  
  $('.demoSet').on('keyup', function(){
    var value = this.value
    ,options = {};
    if(!/^\d+$/.test(value)) return;
    
    options[this.name] = value;
    ins3.reload(options);
  });
  
  //其它示例
  $('.demoTest .layui-btn').on('click', function(){
    var othis = $(this), type = othis.data('type');
    active[type] ? active[type].call(this, othis) : '';
  });
});
</script>
  
    </div>
    <div class="layui-col-xs12 layui-col-sm6 layui-col-md3" style="heigth:282px;padding-left:10;margin-left:10">
    <br/>
     <p  class="layui-bg-green" style="height:40px;font-size:16px;color:#fff; font-weight:blod;line-height:40px">&nbsp;&nbsp;&nbsp;热点关注</p>  
 <ul class=list>
 <c:forEach items="${hotList}"  var="item" >
<li><span><fmt:formatDate value='${item.createDate}' type='date' pattern='yyyy-MM-dd'/></span>

<a href="./${item.path}" target="_blank">${item.title}</a></li></c:forEach>
<!-- <li><span>2007年12月21日</span><a href="#">新闻标题02</a></li>
<li><span>2007年12月21日</span><a href="#">新闻标题03</a></li> -->
<%-- <li><a href="${pageContext.request.contextPath}/index_frame.jsp" style="text-align: right;">查看更多...</a></li>
 --%></ul>
    </div>
    <!-- <div class="layui-col-xs4 layui-col-sm12 layui-col-md4">
      移动：4/12 | 平板：12/12 | 桌面：4/12
    </div>
    <div class="layui-col-xs4 layui-col-sm7 layui-col-md8">
      移动：4/12 | 平板：7/12 | 桌面：8/12
    </div>
    <div class="layui-col-xs4 layui-col-sm5 layui-col-md4">
      移动：4/12 | 平板：5/12 | 桌面：4/12
    </div> -->
  </div>
  <hr class="layui-bg-green" size=" 50px" height="5px">
  
  
   <div class="layui-row">
    <div class="layui-col-xs12 layui-col-sm6 layui-col-md8">
   <div class="layui-tab layui-tab-card ">
  <ul class="layui-tab-title ">
    <li class="layui-this layui-bg-green">通知公告</li>
    <li class=" layui-bg-green">政务公开</li>
    <li class=" layui-bg-green">热点关注</li>
    
  </ul>
  <div class="layui-tab-content" style="height: 200px;">
    <div class="layui-tab-item layui-show">
    <ul class=list>
 <c:forEach items="${clist}"  var="item" >
<li><span><fmt:formatDate value='${item.createDate}' type='date' pattern='yyyy-MM-dd'/></span>

<a href="./${item.path}" target="_blank">${item.title}</a></li></c:forEach>

<li><a href="${pageContext.request.contextPath}/getMoreInfo.do" style="text-align: right;">查看更多...</a></li>
</ul>
</div>
    <div class="layui-tab-item">
    <ul class=list>
 
<li><span>2019-05-15</span>
<a href="/minzhuMaven/communicate_html/1558832300299.html" target="_blank">
<i class="layui-icon layui-icon-read" style="font-size: 22px; color:#009688;"></i> 
河北雄安新区总体规划（2018—2035年）》解读：蓝图已绘 未来可待
</a></li>
 
<li><span>2019-05-10</span>

<a href="/minzhuMaven/communicate_html/1558840218351.html" target="_blank">
<i class="layui-icon layui-icon-read" style="font-size: 22px; color:#009688;"></i> 
人社部解读《关于2018年提高全国城乡居民基本养老保险基础养老金最低标准的通知》
</a></li>
<li><span>2019-05-10</span>

<a href="/minzhuMaven/communicate_html/1558832281108.html" target="_blank">
<i class="layui-icon layui-icon-read" style="font-size: 22px; color:#009688;"></i>  
河北省人民政府关于进一步加强疫苗流通和预防接种管理工作的实施意见</a></li>
<li><span>2019-05-01</span>

<a href="/minzhuMaven/communicate_html/1558839898993.html" target="_blank">
<i class="layui-icon layui-icon-read" style="font-size: 22px; color:#009688;"></i> 
河北印发人口发展规划！实施支持雄安新区建设的人口政策
</a></li>



</ul>
    
    
    </div>
    <div class="layui-tab-item">
<ul class=list>
 <c:forEach items="${hotList}"  var="item" >
<li><span><fmt:formatDate value='${item.createDate}' type='date' pattern='yyyy-MM-dd'/></span>

<a href="./${item.path}" target="_blank">${item.title}</a></li></c:forEach>
<!-- <li><span>2007年12月21日</span><a href="#">新闻标题02</a></li>
<li><span>2007年12月21日</span><a href="#">新闻标题03</a></li> -->
<%-- <li><a href="${pageContext.request.contextPath}/index_frame.jsp" style="text-align: right;">查看更多...</a></li>
 --%></ul>

</div>
    <div class="layui-tab-item">4</div>
    <div class="layui-tab-item">5</div>
    <div class="layui-tab-item">6</div>
  </div>
</div>
 
<br/>
    
  
    </div>
    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4" style="padding-left:0%;">
    
    <!-- 右侧图片 -->
    <div class="layui-col-xs12 layui-col-sm12 layui-col-md12" style="padding-left:10%;padding-top:2%">
    
    <div> <img src="./images/public/changtu1.jpg" style="width:350px;height:85px; " ></div>
    <div><img src="./images/public/changtu2.jpg" style="width:350px;height:85px; "></div>
    </div>
    <!-- 右侧政务公开 -->
     <div class="layui-col-xs12 layui-col-sm12 layui-col-md12 " style="padding-left:8%;">
    
    
    <div style="border-top : 2px solid blue; background:#fff; width: 350px;border-bottom: 10px; margin:10px;">
    <style>
    
    table{
/* border-top:1px solid gray;
border-bottom:1px solid gray; */
background:#fff;
text-align: center;
color:black;
width:300px;
}
table td{
height:40px;
width:200px;
font-size:16px;
border-bottom:1px dashed  gray;
}
table td:hover{
color:blue;
}
a:hover{
color:blue
}
</style>

政府信息公开
<br/>
    <table>
    <tr><td><img src="./images/public/icon4.png" > <a href="./lingdaoxinxi.jsp" target="_blank" >领导信息</a></td>
    <td><img src="./images/public/icon3.png" >
    <a href="./gongkai.jsp" target="_blank">
    政务公开
    </a></td></tr>
     <tr><td><img src="./images/public/icon2.png" ><a href="./file_down.jsp" target="_blank">文件下载</a></td>
     <td><img src="./images/public/icon.png" ><a href="./gongkai.jsp" target="_blank" >政策解读</a></td></tr>
    </table>
    </div>
    </div>
   
  </div>
  
  
  
   
		<%--  <div class="container-wrap" id="cont">
			<div class="container">
		<iframe class="right" src="${pageContext.request.contextPath}/mytask.do" style = "width: 100%; min-height:600px" scrolling="no" frameborder="no" id = "right" name = "right" > 
  
  </iframe>
					
					
			</div>
		</div>  --%>
		<!-- <div class="footer">
			<p>
				<span>&copy; 2018</span>
				<span><a href="http://www.layui.com" target="_blank">layui.com</a></span> 
				<span>MIT license</span>
			</p>
			<p><span>人生就是一场修行</span></p>
		</div> -->
	
	
	
	<script>
layui.use('element', function(){
  var $ = layui.jquery
  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
  

});
</script>

</div>
<div class="header layui-bg-gray" style="font-size:10px;">
<span  style="margin:3px;padding:3px;" >联系我们：www.minzhu.com</span>

<span  style="margin:3px;padding:3px;" >
服务承诺| 联系我们| 网站声明| 网站导航		
纪检监察监督举报</span>
<span  style="margin:3px;padding:3px;" >主办：保定市安新县白庄村员会 承办：保定市安新县白庄村员会   政府网站标识码：1100000159</span>

</div>
</body>
</html>