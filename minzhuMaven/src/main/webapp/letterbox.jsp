<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.bjjs.gov.cn/bjjs/index/index.shtml -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link href="./北京市住房和城乡建设委员会门户网站_files/default.css" rel="stylesheet" id="lhgdialoglink">
  <title>北京市住房和城乡建设委员会门户网站</title>
<meta name="createDate" content="2018-12-19 17:30:10">
<meta name="cacheclearDate" content="2018-11-30 17:40:45">
<meta name="version" content="7.9.7">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="北京市住房和城乡建设委员会,市住房城乡建设委,北京市建设委员会,市建委,北京建设网">
<meta name="description" content="北京建委默认频道 北京市住房和城乡建设委员会门户网站简称北京建设网建于2001年，是北京市住房和城乡建设委员会向公众提供信息和服务的综合平台。">
<link rel="stylesheet" href="./layui/css/layui.css"  media="all">



<script src="./layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->


<link rel="stylesheet" href="./layui/layer.css" id="layui_layer_skinlayercss" style="">
 <meta name="viewport" content="width=device-width">   
 </head>
 <body>
 
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
<iframe src="index_top_frame.jsp" id = "iframeTop" scrolling = "no"></iframe>
<center>

  <style type="text/css">
    .n{
      width: 500px;
    }
  </style>
  
 <div class="n">
  <table class="layui-hide" id="test"></table>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn layui-bg-blue" lay-submit="" lay-filter="demo1">投信</button>
    </div>
  </div>
  <script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#test'
    ,url:'/demo/table/user/'
    ,cols: [[
      {field:'id', width:80, title: 'ID', sort: true}
      ,{field:'username', width:140, title: '主题'}
      ,{field:'sex', width:160, title: '时间', sort: true}
      ,{field:'sex', width:180, title: '处理结果', sort: true}
      
    ]]
    ,page: true
  });
});
</script>

 </div>
 </center>

</body></html>