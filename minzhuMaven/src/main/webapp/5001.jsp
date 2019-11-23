<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>在线演示 - layui</title>
<meta name="renderer" content="webkit" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
  <meta name="apple-mobile-web-app-status-bar-style" content="black"/> 
  <meta name="apple-mobile-web-app-capable" content="yes"/>
  <meta name="format-detection" content="telephone=no"/>
    <link href="layui/css/layui.css" rel="stylesheet" type="text/css" media="all" />
    <link href="layui/css/global.css" rel="stylesheet" type="text/css"  media="all" />
</head>
<body>
<div class="layui-layout layui-layout-admin ">
  
  

<div class="layui-header header header-demo" winter>
  <div class="layui-main">
    <a class="logo" href="/">
      <img src="//res.layui.com/static/images/layui/logo.png" alt="ha">
    </a>
    <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
    <ul class="layui-nav">
      <li class="layui-nav-item ">
        <a href="/doc/">首页<!-- <span class="layui-badge-dot"></span> --></a> 
      </li>
      <li class="layui-nav-item layui-this">
        <a href="/demo/">通知<!--  --></a>
      </li>
      
   
      
      <li class="layui-nav-item layui-hide-xs">
        <a href="//fly.layui.com/" target="_blank">社区</a>
      </li>
      
      <li class="layui-nav-item">
        <a href="javascript:;"><span class="layui-badge-dot" style="margin: -5px 0 0 -15px;"></span>个人中心</a>
        <dl class="layui-nav-child">
          <dd lay-unselect>
            <a href="//fly.layui.com/extend/" target="_blank">个人中心</a>
          </dd>
          <dd lay-unselect>
            <a href="//fly.layui.com/store/" target="_blank">修改信息 <span class="layui-badge-dot"></span></a>
            <hr>
          </dd>
          
          <dd class="layui-hide-sm layui-show-xs" lay-unselect>
            <a href="//fly.layui.com/" target="_blank">修改密码</a>
            <hr>
          </dd>
          <dd lay-unselect><a href="/admin/" target="_blank">退出</a></dd>
        <!--   <dd lay-unselect><a href="/layim/" target="_blank">即时聊天</a><hr></dd>
          
          <dd lay-unselect><a href="/alone.html" target="_blank" lay-unselect>独立组件</a></dd>
          <dd lay-unselect><a href="https://fly.layui.com/jie/24209/" target="_blank">Axure 组件</a></dd>
        </dl> -->
      </li>
      
      <li class="layui-nav-item layui-hide-xs" lay-unselect>
        <a href="/admin/">退出<span class="layui-badge-dot" style="margin-top: -5px;"></span></a>
      </li>
    </ul>
  </div>
</div>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
  <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
  <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<![endif]--> 
  <div class="layui-side layui-bg-gray">
    <div class="layui-side-scroll">
      
<ul class="layui-nav layui-nav-tree site-demo-nav">
  
  <li class="layui-nav-item layui-nav-itemed">
    <a class="javascript:;" href="javascript:;">开发工具</a>
    <dl class="layui-nav-child">
      <dd>
        <a href="/demo/">调试预览</a>
      </dd>
    </dl>
  </li>

  <li class="layui-nav-item layui-nav-itemed">
    <a class="javascript:;" href="javascript:;">用户管理</a>
    <dl class="layui-nav-child">
      <dd class="">
        <a href="/demo/button.html">用户管理</a>
      </dd>
      <dd class="">
        <a href="/demo/form.html">权限管理</a>
      </dd>
      
      <dd class="">
        <a href="/demo/auxiliar.html">辅助元素</a>
      </dd>
    </dl>
  </li>
  
  <li class="layui-nav-item layui-nav-itemed">
    <a class="javascript:;" href="javascript:;">政务工作</a>
    <dl class="layui-nav-child">
      <dd class="">
        <a href="/demo/grid.html">选举管理</a>
      </dd>
      <dd class="layui-this">
        <a href="/demo/admin.html">决策管理</a>
      </dd>
      <dd class="layui-this">
        <a href="/demo/admin.html">信箱处理</a>
      </dd>
    </dl>
  </li>
  
  
  
  <li class="layui-nav-item layui-nav-itemed">
    <a class="javascript:;" href="javascript:;">数据统计</a>
    <dl class="layui-nav-child">
      <dd class="">
        <a href="/demo/layer.html">
          选举分析
        </a>
      </dd>
      <dd class="">
        <a href="/demo/laydate.html">
          问卷分析
        </a>
      </dd>
     
    
    </dl>
  </li>
  
  <li class="layui-nav-item" style="height: 30px; text-align: center"></li>
</ul>

    </div>
  </div>
  <div class="layui-tab layui-tab-brief" lay-filter="demoTitle">
    <ul class="layui-tab-title site-demo-title">
      <li class="layui-this">预览</li>
      <li>查看代码</li>
      <li>帮助</li>
    </ul>
    <div class="layui-body layui-tab-content site-demo site-demo-body">
    
    
      <div class="layui-tab-item layui-show">
        <div class="layui-main">
          <div id="LAY_preview">
<!-- <blockquote class="layui-elem-quote">
  你也可以单独打开后台布局的例子：
  <a class="layui-btn layui-btn-normal" href="layuiAdmin.html" target="_blank">单独打开</a>
</blockquote> -->
 
<!-- <iframe src="layuiAdmin.html?from=demo" frameborder="0" scrolling="no" frameborder="no" name = "right" style="width: 100%; height: 300px; "></iframe>           
  -->    <iframe src="${pageContext.request.contextPath}/user/mytask.do" style = "width: 100%;height: 400px" scrolling="no" frameborder="no" name = "right" > </iframe>           
          </div>
          
        </div>
      </div>
      
      
      <!-- <div class="layui-tab-item">
<textarea class="layui-border-box site-demo-text site-demo-code" id="LAY_democode" spellcheck="false" readonly>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
<!-- </head>
</textarea>
      </div> --> 
      
     <!--  
      <div class="layui-tab-item">
        <div class="layui-main">
          <p></p>
          
          

<div style="margin: 15px 0;">
  <ins class="adsbygoogle"
  style="display:inline-block;width:970px;height:90px"
  data-ad-client="ca-pub-6111334333458862"
  data-ad-slot="6835627838"></ins>
</div>


          
          <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
            <legend>相关</legend>
          </fieldset>
          <a class="layui-btn layui-btn-normal" href="/doc/element/layout.html#admin" target="_blank">后台布局文档</a>
        </div>
      </div> -->
      
        
    </div>
  </div>
  <div class="layui-footer footer footer-demo">
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
</div>
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<div class="site-tree-mobile layui-hide">
  <i class="layui-icon"><!-- &#xe602; -->展开</i>
</div>
<div class="site-mobile-shade"></div>
<script src="//res.layui.com/layui/dist/layui.js?t=1545041465443" charset="utf-8"></script>
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
  var $ = layui.$
  ,setIframe = function(){
    var height = $(window).height() - 370;
    $('#demoAdmin').height(height);
  };
  
  setIframe();
  $(window).on('resize', setIframe);
});
</script>

    <script src="layui/layui.all.js" type="text/javascript"></script>
    <script src="layui/comm.js" type="text/javascript"></script>
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
</div>
</body>
</html>