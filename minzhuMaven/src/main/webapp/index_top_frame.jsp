<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.bjjs.gov.cn/bjjs/index/index.shtml -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link href="./北京市住房和城乡建设委员会门户网站_files/default.css" rel="stylesheet" id="lhgdialoglink">
  
<meta name="createDate" content="2018-12-19 17:30:10">
<meta name="cacheclearDate" content="2018-11-30 17:40:45">
<meta name="version" content="7.9.7">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" href="./layui/css/layui.css"  media="all">




<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
 <meta name="viewport" content="width=device-width">  
 <script src="./layui/layui.js" charset="utf-8"></script>
 </head>
 <body> 
 <link rel="stylesheet" type="text/css" href="./css/skin.css">
<style type="text/css">
/*header*/
.header_bg{ width:100%; min-width:1200px; width:expression_r(document.body.clientWidth < 1200 ? "1200px": "auto" ); background:url(./images/index_img/tian1.jpg) no-repeat top center;}
.header{ position:relative; width:1200px; height:145px; margin:0 auto;}
.bzsy{ position:absolute; left:0; top:50px; width:434px;}
.bzsy a{ display:block;}
.sdzc{ position:absolute; right:0; top:54px; width:55px;}
.sdzc a{ display:block;}
.top_menu{ position:absolute; right:65px; top:52px; font-size:12px; color:#6bb4e5; text-align:right;}
.top_menu a{ padding:0 2px; font-family:"宋体"; font-size:12px; color:#064a77;}
.search{ position:absolute; right:70px; top:75px; width:465px; height:38px; background:url(./images/index_img/search.png) no-repeat left center;}
.search_ipt{ width:403px; height:14px; line-height:14px; border:0; padding:8px 0 8px 10px; margin:4px 0 4px 15px; font-family:"宋体"; font-size:12px; background:transparent; color:#89a2b6;}
.search_img{ width:21px; height:21px; border:0; padding:8px;}
.iptaddcolor{ color:#0d4f7b;}
</style>
<div class="header_bg">
	<div class="header">
        <div class="top_menu">
            <a href="http://www.bjjs.gov.cn/bjjs/index/wzaczsm/index.shtml" id="wzaczsm" title="无障碍操作说明" target="_blank">无障碍操作说明</a>|<a href="http://www.bjjs.gov.cn/Assistants/" title="无障碍浏览" target="_blank">无障碍浏览</a>|<a href="http://www.bjjs.gov.cn/english/309019/index.html" title="English" target="_blank">En</a>|<a href="http://www.bjjs.gov.cn/bjjs/index/bjzjwappyy/index.shtml" title="住建网app" target="_blank">住建网app</a>|<a href="http://weibo.com/u/2417827827" title="官方微博" target="_blank">官方微博</a>|<a href="http://www.bjjs.gov.cn/bjjs/index/bjzjwgfwx/index.shtml" title="官方微信" target="_blank">官方微信</a>|<a href="http://www.bjjs.gov.cn/bjjs/index/xxdy/index.shtml" title="信息订阅" target="_blank">信息订阅</a>|<a href="http://210.75.213.200/publish/portal0/" title="旧版回顾" target="_blank">旧版回顾</a>
        </div>
        <div class="bzsy"><a href="http://www.bjjs.gov.cn/bjjs/index/bzsy/index.shtml" title="标志释义" target="_blank"><img src="./images/logo.png" alt="标志释义" title="标志释义" width="304" height="55"></a></div>
        <div class="search">
        	<form id="amj-form" name="amj-form" action="http://www13.f5.bjjs.gov.cn/search/pcRender" class="" method="get" target="_blank">
                <input type="hidden" name="pageId" id="pageId" value="71ef5783036447c0aaaedb3e3421a14d">
                <input type="hidden" name="sr" id="sr" value="score desc">
                <input type="hidden" name="pNo" id="pNo" value="1">
            <table cellpadding="0" cellspacing="0" border="0">
                <tbody><tr>
                    <td><input id="q" name="q" class="search_ipt" type="text" autocomplete="off" title="请输入关键字" value="请输入关键字"></td>
                    <td><input class="search_img" type="image" src="./images/index_img/button_ss.png" alt="全网搜索提交按钮，按回车键提交搜索" title="全网搜索提交按钮，按回车键提交搜索" width="21" height="21"></td>
                </tr>
            </tbody></table>
            </form>
            
        </div>
        <!-- <div class="sdzc"><a href="" title="首都之窗" target="_blank"><img src="./images/index_img/sdzc.png" alt="首都之窗" title="首都之窗" width="55" height="61"></a></div> -->
    </div>
    
</div>
 <style type="text/css">
/*nav*/
.nav_bg{ width:100%; min-width:1200px; width:expression_r(document.body.clientWidth < 1200 ? "1200px":"auto"); margin-bottom:14px; background:#3687bc;}
.nav{ overflow:hidden; width:1200px; margin:0 auto;}
.nav ul{ width:1300px; height:44px; margin-left:-1px;}
.nav ul li{ float:left; border-left:1px solid #FFF; }
.nav ul li.hover a{ background:#064a77;}
.nav ul li a{ display:block; line-height:44px; padding:0 44px 0 43px; font-size:16px; font-family:"微软雅黑"; color:#FFF;}
</style>
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
    width: 15%;
     color: #FFFFFF ! important;
     font-size:18 px ! important;
  }
  .layui-nav{
    /* background-color: #3687bc !important; */
    height: 55px !important ;
    font-size:18 px;
  }

</style>
<div>
 <ul class="layui-nav layui-bg-green">
    
  <li class="layui-nav-item  layui-nav-itemed layui-hide-xs"><a href="index_content.jsp" target="_top">首页</a></li>
  <li class="layui-nav-item layui-this  layui-nav-itemed layui-hide-xs">
    <a href="javascript:; ">新闻实况</a>
    <!--<dl class="layui-nav-child">
      <dd><a href="">选项1</a></dd>
      <dd><a href="">选项2</a></dd>
      <dd><a href="">选项3</a></dd>
    </dl>-->
  </li>
  <!-- <li class="layui-nav-item"><a href="">大数据</a></li> -->
  <!-- <li class="layui-nav-item">
    <a href="javascript:;">解决方案</a>
    <dl class="layui-nav-child">
      <dd><a href="">移动模块</a></dd>
      <dd><a href="">后台模版</a></dd>
      <dd class="layui-this"><a href="">选中项</a></dd>
      <dd><a href="">电商平台</a></dd>
    </dl>
  </li> -->
  <li class="layui-nav-item  layui-nav-itemed layui-hide-xs"><a href="letterbox.jsp" target="_top">  信箱信息</a></li>
  <c:if test="${user==null}">
   <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/toLogin.do" target="_top" >  登录</a></li>
   </c:if>
   <c:if test="${user!=null}">
   <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/tomain.do" target="_parent" >  个人管理</a></li>
   </c:if>
</ul>
</div>

</body></html>