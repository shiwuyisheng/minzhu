<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>闲言轻博客</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/mian.css">
	<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript"></script>
	
</head>
<style>
.lay-bolg .header{
height:200px !important;
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
</style>
<body class="lay-blog">

	<%-- 	<div class="header" style="height:200px; margin: 0; padding:0">
			
				<iframe src="${pageContext.request.contextPath}/index_header.jsp" id = "iframeTop" scrolling = "no" style="margin:0;padding:0;"></iframe>
				
		
		</div> --%>
		<div class="layui-container">  
 <!--  常规布局（以中型屏幕桌面为例）：
  <div class="layui-row">
    <div class="layui-col-md9">
      你的内容 9/12
    </div>
    <div class="layui-col-md3">
      你的内容 3/12
    </div>
  </div> -->
   
 
  <div class="layui-row">
    <div class="layui-col-xs6 layui-col-sm6 layui-col-md8  layui-hide-xs">
      
      <div class="layui-carousel" id="test10">
  <div carousel-item="">
    <div><img  width="706" src="${pageContext.request.contextPath}/北京市住房和城乡建设委员会门户网站_files/2017110311492519519.jpg"></div>
    <div><img  width="706" src="${pageContext.request.contextPath}/images/index_img/轮播1.jpeg"></div>
    <div><img  width="706" src="${pageContext.request.contextPath}/images/index_img/轮播2.jpg"></div>
    <div><img  width="706" src="${pageContext.request.contextPath}/images/index_img/轮播3.jpg"></div>
    <div><img  width="706" src="${pageContext.request.contextPath}/images/index_img/轮播4.jpg"></div>
    <div><img  width="706" src="${pageContext.request.contextPath}/images/index_img/轮播5.jpg"></div>
    <div><img  width="706" src="${pageContext.request.contextPath}/北京市住房和城乡建设委员会门户网站_files/2017110311492519519.jpg"></div>
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
    ,width: '608px'
    ,height: '252px'
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
    <div class="layui-col-xs6 layui-col-sm6 layui-col-md4">
   
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
		</div>
	
	 -->
	
</body>
</html>