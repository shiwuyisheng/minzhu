<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>农村民主建设</title>
<meta name="renderer" content="webkit" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
  <meta name="apple-mobile-web-app-status-bar-style" content="black"/> 
  <meta name="apple-mobile-web-app-capable" content="yes"/>
  <meta name="format-detection" content="telephone=no"/>
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${pageContext.request.contextPath}/layui/css/global.css" rel="stylesheet" type="text/css"  media="all" />
   <%-- <script src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
  --%><%--  <script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript"></script>
    --%>
   <script src="${pageContext.request.contextPath}/layui/layui.all.js" type="text/javascript"></script>
   
    <script src="${pageContext.request.contextPath}/layui/comm.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript"></script>



  <style>
       .test{
    width:100%;
    height: 100%;
    overflow: auto;
    float: left;
    margin: 5px;
    border: none;
}
.scrollbar{
    width: 0px;
    height: 300px;
    margin: 0 auto;
 
}
.test-1::-webkit-scrollbar {/*滚动条整体样式*/
        width: 0px;     /*高宽分别对应横竖滚动条的尺寸*/
        height: 1px;
    }
.test-1::-webkit-scrollbar-thumb {/*滚动条里面小方块*/
        border-radius: 10px;
         -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
        background: #535353;
    }
.test-1::-webkit-scrollbar-track {/*滚动条里面轨道*/
        -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
        border-radius: 10px;
        background: #EDEDED;
    }
        
        </style>
</head>
<body style="background-color:#f4f8ff;" class="test test-1">
<div class="layui-layout layui-layout-admin ">
  
  

<div class="layui-header header header-demo  layui-bg-green" winter>
  <div class="layui-main" >
    <a class="logo" >
      <img src="${pageContext.request.contextPath}/images/logo.png" alt="" style="width:120px;height: 50px;max-height: 10em;min-height: 2em;max-width: 7em; min-width:3em ;overflow:hidden; " >
    </a> 
  
  <!--   <label>欢迎登录</label> -->
    <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
    <ul class="layui-nav" lay-filter="demo" >
   <li class="layui-nav-item layui-nav-itemed layui-hide-xs">
    <a class="" href="${pageContext.request.contextPath}/mytask.do" target="right"> 
   <i class="layui-icon layui-icon-notice" style="font-size: 20px; color: #00CC99;""></i>  
    
    我的通知</a>
   
  </li>
  
  <%-- <li class="layui-nav-item layui-nav-itemed layui-hide-xs"> 
    <a class="" href="${pageContext.request.contextPath}/candidate/showcate.do" target="right">参与选举</a>
    <!-- <dl class="layui-nav-child">
      <dd class="">
        <a href="/demo/grid.html">选举管理</a>
      </dd>
      <dd class="layui-this">
        <a href="/demo/admin.html">决策管理</a>
      </dd>
      <dd class="layui-this">
        <a href="/demo/admin.html">信箱处理</a>
      </dd>
    </dl> -->
  </li> 
  --%>
  <li class="layui-nav-item layui-nav-itemed layui-hide-xs">
   <a class="" href="${pageContext.request.contextPath}/decision/to_my_decision.do"   target="right">
   <i class="layui-icon layui-icon-file-b" style="font-size: 10px; color: #00CC99;""></i>  
  
   我的决策</a>
  </li>
  <li class="layui-nav-item layui-nav-itemed layui-hide-xs">
   
   <a class="" href="${pageContext.request.contextPath}/letterbox/toletterbox.do"   target="right">
   <i class="layui-icon layui-icon-survey" style="font-size: 20px; color: #00CC99;""></i>  
  
   参与监督</a>
  </li>
     <li class="layui-nav-item layui-nav-itemed layui-hide-xs">
   
   <a class="" href="${pageContext.request.contextPath}/user/showUserInfo.do" target="right">
      <i class="layui-icon layui-icon-username" style="font-size: 20px; color: #00CC99;""></i>  
  
   个人信息</a>
  </li>
   <li class="layui-nav-item layui-nav-itemed layui-hide-xs">
      
   <a class="" href="${pageContext.request.contextPath}/hukou/to_my_hukou.do?flag=0"   target="right">
   <i class="layui-icon layui-icon-group" style="font-size: 20px; color: #00CC99;""></i>  
   
   我的户籍</a>
  </li>
   <c:if test="${user.level==1}">
  <li class="layui-nav-item layui-nav-itemed  ">
        <a href="${pageContext.request.contextPath}/user/toadminmain.do">切换至管理员<!-- <span class="layui-badge-dot"></span> --></a> 
      </li></c:if>
      <li class="layui-nav-item layui-nav-itemed  ">
        <a href="${pageContext.request.contextPath}/index.do">首页<!-- <span class="layui-badge-dot"></span> --></a> 
      </li> 
     <!--  <li class="layui-nav-item layui-this">
        <a href="/demo/">通知</a>
      </li> -->
      <li class="layui-nav-item layui-hide-md">
    <a href="javascript:;">选项</a>
    <dl class="layui-nav-child">
      <dd> <a class="" href="${pageContext.request.contextPath}/mytask.do" target="right">我的任务</a>
  </dd>
      <dd><a class="" href="${pageContext.request.contextPath}/decision/to_my_decision.do"   target="right">我的决策</a>
 </dd>
      <dd class="layui-this"><a class="" href="${pageContext.request.contextPath}/letterbox/toletterbox.do"   target="right">参与监督</a></dd>
      <!-- <dd><a href="">电商平台</a></dd> -->
    </dl>
  </li>
           
      <li class="layui-nav-item layui-hide-md">
        <a href="javascript:;"><span class="layui-badge-dot" style="margin: -5px 0 0 -15px;"></span>个人中心</a>
        <dl class="layui-nav-child">
          <!-- <dd lay-unselect>
            <dl class="layui-nav-child"> -->
      <dd> <a href="showUserInfo.do" target="right">修改信息 <span class="layui-badge-dot"></span></a>
          </dd>
      <dd><a href="showchangepassword.do" target="right">修改密码</a>
           </dd>
      <dd> <a class="" href="${pageContext.request.contextPath}/hukou/to_my_hukou.do?flag=0"   target="right">我的户籍</a></dd>
     <dd lay-unselect><a href="${pageContext.request.contextPath}/user/logout.do" >退出</a></dd>
      
    </dl>
         <!--  </dd></dl> -->
        
      </li>
      
      <li class="layui-nav-item layui-nav-itemed   layui-hide-xs" lay-unselect>
        <a href="${pageContext.request.contextPath}/user/logout.do">退出</a>
      </li>
    </ul>
  </div>
</div>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->

 
  <div class="layui-side" id="layui-side" style="font-family:'幼圆'; width:300px;background-color:#d6eaf8; background-size: cover ;">
   <!--  <div class="layui-side-scroll" id="layui-side-scroll"> -->
     <style>
     .card {
 /*  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); */
  max-width: 300px;
  min-width:250px;
  margin: auto;
  text-align: left;
  font-family: arial;
 
}

.container {
  padding: 0 36px;
  
}

.container::after {
  content: "";
  clear: both;
  display: table;
}
     
     
     </style><br/><br/><br/><br/><br/><br/>
    
<div class="card" >
  
  <div class="container"> 
  <img src="${pageContext.request.contextPath}/${sessionScope.user.image}"  style="width:40%">
 </br>
  </br>
    <h4>姓名：${sessionScope.user.username}</h4> </br>
   <h4> 年龄：${sessionScope.user.age}岁</h4> </br>
   <h4> 性别：<c:if test="${user.sex==0}"> 男</c:if><c:if test="${user.sex!=0}"> 女</c:if>
   </h4> </br>
   <h4> 面貌：<c:if test="${user.face==0}">群众</c:if>
   <c:if test="${user.face==1}">党员</c:if>
    <c:if test="${user.face==2}">预备党员</c:if>
     <c:if test="${user.face==3}">团员</c:if>
   </h4> </br>
   
   <h4> 学历：${sessionScope.user.education} <c:if test="${user.education==null || user.education==''}"> 未知</c:if></h4> </br>
    <h4> 联系电话：  </br>${sessionScope.user.phone} </br><c:if test="${user.phone==null}"> 未知</c:if></h4></br>
    <h4>家庭地址： </br>${sessionScope.user.address} </br><c:if test="${user.address==null}"> 未知</c:if></h4>
    
  <!--  <p><button>Contact</button></p> -->
 <!--  </div> -->
</div>
     
     </center>
      
 <%--    
<ul class="layui-nav layui-nav-tree site-demo-nav" >
<li class="layui-nav-item layui-nav-itemed">
    &nbsp;
   
  </li>
  <li class="layui-nav-item layui-nav-itemed">
    <a class="" href="${pageContext.request.contextPath}/mytask.do" target="right"> 
   <i class="layui-icon layui-icon-notice" style="font-size: 20px; color: #00CC99;""></i>  
    
    我的通知</a>
   
  </li>
  
  <li class="layui-nav-item layui-nav-itemed"> 
    <a class="" href="${pageContext.request.contextPath}/candidate/showcate.do" target="right">参与选举</a>
    <!-- <dl class="layui-nav-child">
      <dd class="">
        <a href="/demo/grid.html">选举管理</a>
      </dd>
      <dd class="layui-this">
        <a href="/demo/admin.html">决策管理</a>
      </dd>
      <dd class="layui-this">
        <a href="/demo/admin.html">信箱处理</a>
      </dd>
    </dl> -->
  </li> 
 
  <li class="layui-nav-item layui-nav-itemed">
   <a class="" href="${pageContext.request.contextPath}/decision/to_my_decision.do"   target="right">
   <img alt="" src="${pageContext.request.contextPath}/images/public/green_pixel_137.gif">
    <i class="layui-icon layui-icon-file-b" style="font-size: 20px; color: #00CC99;""></i>  
  
   我的决策</a>
  </li>
  <li class="layui-nav-item layui-nav-itemed">
   
   <a class="" href="${pageContext.request.contextPath}/letterbox/toletterbox.do"   target="right">
   <i class="layui-icon layui-icon-survey" style="font-size: 20px; color: #00CC99;""></i>  
  
   参与监督</a>
  </li>
     <li class="layui-nav-item layui-nav-itemed">
   
   <a class="" href="${pageContext.request.contextPath}/user/showUserInfo.do" target="right">
      <i class="layui-icon layui-icon-username" style="font-size: 20px; color: #00CC99;""></i>  
  
   个人信息</a>
  </li>
   <li class="layui-nav-item layui-nav-itemed">
      
   <a class="" href="${pageContext.request.contextPath}/hukou/to_my_hukou.do?flag=0"   target="right">
   <i class="layui-icon layui-icon-group" style="font-size: 20px; color: #00CC99;""></i>  
   
   我的户籍</a>
  </li>
  <li class="layui-nav-item layui-nav-itemed">
   
   <a class="" href="showchangepassword.do" target="right">
   <i class="layui-icon layui-icon-password" style="font-size: 20px; color: #00CC99;""></i>  
  修改密码</a>
  </li>  
  <li class="layui-nav-item layui-nav-itemed">
   
  </li>
  
  <li class="layui-nav-item" style="height: 30px; text-align: center"></li>
</ul>
 --%>
    </div>
  </div>
  <div class="layui-tab layui-tab-brief" lay-filter="demoTitle" >     
     <style>
      .layui-body{
     left:310px !important;
     bottom:0px !important;
     } 
     .layui-tab-item layui-show{
    
     bottom:0px !important;
     } 
      .layui-main{
     bottom:0px !important;
     height:100%;
     } 
     </style>
    <div class="layui-body layui-tab-content site-demo site-demo-body" style="top:103px;margin:0;padding:0;background-color:#f4f8ff;">     
      <div class="layui-tab-item layui-show">
        <div class="layui-main">
          <div id="LAY_preview">
<!-- <blockquote class="layui-elem-quote">
  你也可以单独打开后台布局的例子：
  <a class="layui-btn layui-btn-normal" href="layuiAdmin.html" target="_blank">单独打开</a>
</blockquote> -->
 <center>
    <iframe class="right" src="${pageContext.request.contextPath}/mytask.do" style = "width: 100%; height:505px" frameborder="no" id = "right" name = "right" > 
  
  </iframe>    </center>       
      <script language="JavaScript">
  
function reload(e){
alert($("#layui-side").attr('class'));

$("#right").attr('src', $(e).attr('href'));

//alert($("#right").attr('src'));//.attr('class'));
}
</script>
          </div>
          
        </div>
      </div>
      
      
        
    </div>
  </div>
  <!-- <div class="layui-footer footer footer-demo">
  <div class="layui-main">
    <p>&copy; 2019 <a href="/">layui.com</a> MIT license</p>
    <p>
      <a href="http://fly.layui.com/case/2019/" target="_blank">案例</a>
      <a href="http://fly.layui.com/jie/3147/" target="_blank">支持</a>
      <!--<a href="javascript:;" site-event="contactInfo">联系</a>
      <a href="https://github.com/sentsin/layui/" target="_blank" rel="nofollow">GitHub</a>
      <a href="https://gitee.com/sentsin/layui" target="_blank" rel="nofollow">码云</a>
      <a href="http://fly.layui.com/jie/2461/" target="_blank">公众号</a>
      <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">赣ICP备13006272号-2</a>
    </p>
    <p class="site-union">
      <a href="https://www.upyun.com?from=layui" target="_blank" rel="nofollow" upyun><img src="//res.layui.com/static/images/other/upyun.png?t=1" alt="upyun"></a>
      <span>提供 CDN 赞助</span>
    </p>
  </div>
</div> -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<div class="site-tree-mobile layui-hide">
  <i class="layui-icon"><!-- &#xe602; -->展开</i>
</div>
<div class="site-mobile-shade"></div>
<script>
window.global = {
  pageType: 'demo'
  ,preview: function(){
    var preview = document.getElementById('LAY_preview');
    return preview ? preview.innerHTML : '';
  }()
};
layui.config({
  base: '//res.layui.com/static/lay/modules/layui/'
  ,version: '1545041465443'
}).use('global');
</script>
 
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?d214947968792b839fd669a4decaaffc";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

</div>
<div id="LAY_democodejs">
<script>
</script>
</div>
<script>
layui.use('layer', function(){
   $ = layui.$
  ,setIframe = function(){
    var height = $(window).height() - 370;
    $('#demoAdmin').height(height);
  };
  
  setIframe();
  $(window).on('resize', setIframe);
});
</script>

  
<script>

    $(function () {
        $(".site-tree-mobile").click(function () {
            $("body").addClass("site-mobile");
            $(".site-mobile-shade").click(function () {
                $("body").removeClass("site-mobile");
            });
        });
    });
</script>

<script>

window.onload=function(){ 
//假设这里每个五分钟执行一次test函数 
personBusi(); 
} 

function personBusi(){ 
setTimeout(personBusi,1000*60*1);//这里的1000表示1秒有1000毫秒,1分钟有60秒,5表示总共5分钟 
  $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/user/checkUser.do" ,//url
                success: function (result) {
               		if(result.state == -1 || result.state == 201){
               		layui.use(['layer'],function(){
               		layer = layui.layer;
                layer.confirm("已退出登录，请重新登录",function(){
               // window.location.href = "${pageContext.request.contextPath}/index.do";
                window.open(  "${pageContext.request.contextPath}/index.do"   ,   "_parent" );
                });});
               		}
                
                },
                error : function() {
                   // alert("异常！");
                }
            });
  } 


</script>

</div>
<script>
layui.use('element', function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
 
});
</script>
</body>
</html>