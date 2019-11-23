<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.bjjs.gov.cn/bjjs/index/index.shtml -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link href="./北京市住房和城乡建设委员会门户网站_files/default.css" rel="stylesheet" id="lhgdialoglink">
 
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" href="./layui/css/layui.css"  media="all">
<script src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

 <meta name="viewport" content="width=device-width">  
 </head>
 <body><style type="text/css">
/*header*/
 .header_bg{
 width:100%;
 height:140px;
 background:url("./images/index_img/tian1.jpg")  no-repeat ;
 }
 </style>

<div class="header_bg" style="background: url('./images/index_img/tian1.jpg')  no-repeat ">
	<div >
	<img src="./images/logo.png" alt="标志释义" title="标志释义" width="304" height="55"  style="padding-top:30px;padding-left:20px">
	<div  style="position: relative;left:60%;" >
	<form class="layui-form" >
	<input class="layui-hide-xs"id="keyword" name="keyword" type="text"   placeholder='  请输入关键词' style= "background-color:#fff ;border:0px; width:250px;height:40px; "/>  
	
	 <i class="layui-icon layui-icon-search layui-hide-xs" name="search"  id="search"  style="font-size: 30px; color: #1E9FFF;"></i> 
	<%-- <a href="${pageContext.request.contextPath}/login.jsp" target="_top"> 登录</a>
	 --%>
	
	</form>
	
	</div></div></div>
<script>
$("#search").click(function(){
var keyword=$("#keyword").val();
layui.use(['layer'],function(){
	layer = layui.layer;
	
	
if (keyword == ""){
	layer.msg("关键词不能为空");
}
var url = "${pageContext.request.contextPath}/getMoreInfo.do?keyword="+keyword;

window.open(url,"_top");

      });
});


</script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

<script>
layui.use('element', function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
</script>
<style type="text/css">
  .layui-nav .layui-nav-item {
   
   padding-right:105px;
     color: #FFFFFF ! important;
     font-size:16px ! important;
   
  }
  .layui-nav{
    /* background-color: #3687bc !important; */
    height: 10px !important ;
    font-size:18 px;
      
  }

</style>
<div style="height:50px;"><center>
 <ul class="layui-nav layui-bg-green" style="height:20px; margin:0;padding:0" lay-filter="demo">
  <script type="text/javascript">
    function index(){
      this.href='index_content.html'
    }
function letter(){
  th
}

  </script>
  
  <li class="layui-nav-item  layui-hide-xs"><a href="${pageContext.request.contextPath}/index.do" target="_top">首页</a></li>
  <li class="layui-nav-item  layui-nav-itemed layui-hide-xs">
    <a href="${pageContext.request.contextPath}/getMoreInfo.do"  target="_top"> 新闻实况</a>
    <!--<dl class="layui-nav-child">
      <dd><a href="">选项1</a></dd>
      <dd><a href="">选项2</a></dd>
      <dd><a href="">选项3</a></dd>
    </dl>-->
  </li>
  <!-- <li class="layui-nav-item"><a href="">大数据</a></li> -->
  
   <li class="layui-nav-item layui-nav-itemed layui-hide-xs">
    <a href="${pageContext.request.contextPath}/gongkai.jsp"  target="_top">政务公开</a>
    <!--<dl class="layui-nav-child">
      <dd><a href="">移动模块</a></dd>
      <dd><a href="">后台模版</a></dd>
      <dd class="layui-this"><a href="">选中项</a></dd>
      <dd><a href="">电商平台</a></dd>
    </dl>-->
  </li>
  <!-- <li class="layui-nav-item layui-nav-itemed layui-show-xs"> -->
  <c:if test="${user==null}">
   <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/toLogin.do" target="_top" >  登录</a></li>
   </c:if>
   <c:if test="${user!=null}">
   <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/tomain.do" target="_parent" >  个人管理</a></li>
   </c:if>
  
  <%--  <a href="${pageContext.request.contextPath}/login.jsp" target="_top"> 登录</a>
  </li> --%>
  <%-- <li class="layui-nav-item layui-show-xs">
  <a href="javascript:;">55<i class="layui-icon layui-icon-more" style="font-size: 20px; color: #fff"></i> 
 </a><dl class="layui-nav-child">
 <dd><a href="${pageContext.request.contextPath}/index.do" target="_top"> 首页</a><dd>
  <dd><a href="${pageContext.request.contextPath}/login.jsp" target="_top"> 登录</a><dd>
  </dl></li> --%>
</ul>
</center>
</div>
   <script>
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
   element = layui.element;
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
</script>
</body></html>