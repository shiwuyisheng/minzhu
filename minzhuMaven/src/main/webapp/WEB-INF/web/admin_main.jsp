<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>农村民主建设</title>
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="format-detection" content="telephone=no" />
<link href="${pageContext.request.contextPath}/css/scrollbar.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/layui/css/layui.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/layui/css/global.css"
	rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.request.contextPath}/layui/layui.all.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/layui/comm.js"
	type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript"></script>
</head>
<body clss="">
<style>
.auto{
a:{color:#000000}
a:hover{color: #000000; transition: all .5s; -webkit-transition: all .5s}
a.this{color: #fff}
.layui-header.header.hdader-demo.a{color:#000000!important;}
}


</style>
 <div class="layui-layout layui-layout-admin" >
<div class="layui-header header header-demo layui-bg-green"  >
  <div class="layui-main"  >
   <!--  <a class="logo" href="/"> -->
      <img src="${pageContext.request.contextPath}/images/logo.png" style="width:120px;height: 50px;max-height: 10em;min-height: 2em;max-width: 7em; min-width:3em ;overflow:hidden; " alt="ha">
   <!--  </a>  -->
 <label>${sessionScope.admin.username}</label>
    <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
    <ul class="layui-nav">
    
      <li class="layui-nav-item">
        <a href="${pageContext.request.contextPath}/index.do" class="auto">首页</a> 
      </li>
       <li class="layui-nav-item ">
        <a href="${pageContext.request.contextPath}/user/tomain.do">切换至用户<!-- <span class="layui-badge-dot"></span> --></a> 
      </li>
      <!-- <li class="layui-nav-item layui-this">
        <a href="/demo/">通知</a>
      </li>
      <li class="layui-nav-item layui-hide-xs">
        <a href="//fly.layui.com/" target="_blank">社区</a>
      </li> -->
      
      <li class="layui-nav-item">
        <!-- <a href="javascript:;"><span class="layui-badge-dot" style="margin: -5px 0 0 -15px;"></span>个人中心</a>
        <dl class="layui-nav-child">
          <dd lay-unselect>
            <a href="//fly.layui.com/extend/" target="_blank">个人中心</a>
          </dd>
          <dd lay-unselect>
            <a href="//fly.layui.com/store/" target="_blank">修改信息 <span class="layui-badge-dot"></span></a>
            <hr>
          </dd> -->
          
          <dd class="layui-hide-sm layui-show-xs" lay-unselect>
            <a href="showchangepassword.do" target="_blank">修改密码</a>
            <hr>
          </dd>
         <!--  <dd lay-unselect><a href="/admin/" target="_blank">退出</a></dd>
       
           -->
         
        </dl> 
      </li>
      
      <li class="layui-nav-item layui-hide-xs" lay-unselect>
        <a href="${pageContext.request.contextPath}/user/logout.do">退出</a>
      </li>
    </ul>
  </div>
</div> 
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
  <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
  <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<![endif]--> 
  <div class="layui-side layui-bg-black" lay-filter="test">
    <div class="layui-side-scroll">
   <ul id="demo55" class="layui-nav layui-nav-tree"></ul>   
<%--  <ul class="layui-nav layui-nav-tree">
 

  <li class="layui-nav-item">
    <a class="javascript:;" href="javascript:;">用户管理</a>
    <dl class="layui-nav-child">
      <dd class="">
        <a href="${pageContext.request.contextPath}/user/toUserManage.do" target="right">用户管理</a>
      </dd>
      <dd class="">
        <a href="${pageContext.request.contextPath}/user/toUserLevelManage.do" target="right">权限管理</a>
      </dd>
      
     
    </dl>
  </li>
  
  <li class="layui-nav-item layui-nav-itemed">
    <a class="javascript:;" href="javascript:;">政务工作</a>
    <dl class="layui-nav-child">
     <dd class="">
        <a href="${pageContext.request.contextPath}/communication/tocommunicationManager.do" target = "right">政务公布</a>
      </dd>
      <dd class="">
        <a href="${pageContext.request.contextPath}/elect/toElectManager.do" target = "right">选举管理</a>
      </dd>
      
      <dd class="">
        <a href="${pageContext.request.contextPath}/decision/toDecisionManager.do" target = "right">决策管理</a>
      </dd>
      
      <dd class="layui-this">
        <a href="${pageContext.request.contextPath}/letterbox/tolettermanage.do" target= "right">信箱处理</a>
      </dd>
    </dl>
  </li>
  
  
  <li class="layui-nav-item layui-nav-itemed">
    <a class="javascript:;" href="javascript:;">数据统计</a>
    <dl class="layui-nav-child">
    <dd class="">
        <a href="${pageContext.request.contextPath}/user/toUserAnalyse.do" target="right">
         用户分析
        </a>
      <dd class="">
        <a href="${pageContext.request.contextPath}/elect/toElectionAnalyse.do" target="right">
          选举分析
        </a>
      </dd>
      <dd class="">
        <a href="${pageContext.request.contextPath}/decision/toDecisionAnalyseManager.do" target="right">
          问卷分析
        </a>
      </dd>
     
    
    </dl>
  </li>
  
  <!-- <li class="layui-nav-item" style="height: 30px; text-align: center"></li> -->
</ul>
  --%>
    </div>
  </div>
  <style>
  .layui-body{
  bottom:0 !important;
  background:#fff !important;
  }
  
  </style>
 <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="background:#fff !important;padding: 0;margin:0;position:relative;top:50px;left:60px;"><iframe src="" style = "width: 100%;height:600px;margin: 0;padding:0;"  frameborder="no" name = "right" > </iframe>           
        </div>
  </div>
<%--   <div class="layui-tab layui-tab-brief"  lay-filter="demoTitle" style="width:1024px">
    <!-- <ul class="layui-tab-title site-demo-title">
      <li class="layui-this">预览</li>
      <li>查看代码</li>
      <li>帮助</li>
    </ul>  -->
    <div class="layui-body layui-tab-content site-demo site-demo-body"  style="margin: 0;padding:0;height:500px;"style="background: url(${pageContext.request.contextPath}/images/bj.jpg) no-repeat  ;background-position: center 0;
background-size: cover;">
    
    
      <div class="layui-tab-item layui-show"   class="test test-1" style="margin: 0;padding:0;" >
         <div class="layui-main" > <!--
          <div id="LAY_preview" > -->

<!-- <iframe src="layuiAdmin.html?from=demo" frameborder="0" scrolling="no" frameborder="no" name = "right" style="width: 100%; height: 300px; "></iframe>           
  -->    <iframe src="" style = "width: 100%;height:450px;margin: 0;padding:0;"  frameborder="no" name = "right" > </iframe>           
         <!--  </div>-->
          
        </div>
      </div> 
       
      
  
        
    </div>
  </div> --%>
 <!--  <div class="layui-footer footer footer-demo"> -->
  <!-- <div class="layui-main">
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
  </div> -->
<!-- </div> -->
<!-- <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
 --><div class="site-tree-mobile layui-hide">
  <i class="layui-icon"><!-- &#xe602; -->展开</i>
</div>
<div class="site-mobile-shade"></div>
 

 
<script>
/* var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?d214947968792b839fd669a4decaaffc";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})(); */
</script>

</div>
<div id="LAY_democodejs">
<script>
</script>
</div>
<!-- <script>
layui.use('layer', function(){
  var $ = layui.$
  ,setIframe = function(){
    var height = $(window).height() - 370;
    $('#demoAdmin').height(height);
  };
  
  setIframe();
  $(window).on('resize', setIframe);
});
</script>
 -->
 
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
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>



</div>
<style>

/*左侧导航 使用方法：skin: 'sidebar' */

.layui-tree-skin-sidebar li i{

color: rgba(255,255,255,.7);

display: none;

}

.layui-tree-skin-sidebar li a cite{

color: rgba(255,255,255,.7)

}

.layui-tree-skin-sidebar li .layui-tree-spread{

display: block;

position: absolute;

right: 30px;

}

.layui-tree-skin-sidebar li{

line-height: 45px;

position: relative;

}

.layui-tree-skin-sidebar li ul{

margin-left: 0;

background: rgba(0,0,0,.3);

}

.layui-tree-skin-sidebar li ul a{

padding-left: 20px;

}

.layui-tree-skin-sidebar li a{

height: 45px;

border-left: 5px solid transparent;

box-sizing: border-box;

width: 100%;

}

.layui-tree-skin-sidebar li a:hover{

background: #4E5465;

color: #fff;

border-left: 5px solid #009688;

}

.layui-tree-skin-sidebar li a.active{

background: #009688;

}

</style>
<script>
layui.use('tree', function(){
layui.tree({
  elem: '#demo55' //传入元素选择器
  ,skin:'sidebar'
  
  ,target: 'right'
  ,nodes: [{name: ' &nbsp;'},{ //节点
    name: '用户管理',spread: true
    ,children: [{
      name: '用户管理'
      ,href: '${pageContext.request.contextPath}/user/toUserManage.do'
    },{
      name: '户籍管理'
      ,href: '${pageContext.request.contextPath}/hukou/toHuKouManage.do'
    },{
      name: '权限管理'
       ,href: '${pageContext.request.contextPath}/user/toUserLevelManage.do'
    }]
  },{ //节点
    name: '政务工作',spread: true
    ,children: [{
      name: '政务公开'
      ,href: '${pageContext.request.contextPath}/communication/tocommunicationManager.do'
    },{
      name: '选举报名管理'
       ,href: '${pageContext.request.contextPath}/enlist/to_enlist.do'
    }
,{
      name: '选举管理'
       ,href: '${pageContext.request.contextPath}/elect/toElectManager.do'
    },{
      name: '决策管理'
       ,href: '${pageContext.request.contextPath}/decision/toDecisionManager.do'
    },{
      name: '信箱管理'
       ,href: '${pageContext.request.contextPath}/letterbox/tolettermanage.do'
    }]
  },{ //节点
    name: '数据统计',spread: true
    ,children: [{
      name: '用户分析'
      ,href: '${pageContext.request.contextPath}/user/toUserAnalyse.do'
    },{
      name: '选举分析'
       ,href: '${pageContext.request.contextPath}/elect/toElectionAnalyse.do'
    },{
      name: '决策统计分析'
       ,href: '${pageContext.request.contextPath}/decision/toDecisionAnalyseManager.do'
    }]
  }]
  
});
});
</script>
</body>
</html>