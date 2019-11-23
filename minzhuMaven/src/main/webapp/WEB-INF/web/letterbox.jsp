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


<link rel="stylesheet" href="../layui/css/layui.css"  media="all">



<link rel="stylesheet" type="text/css" href="../css/huilan-jquery-ui.css">
<script src="../js/jquery-1.4.2.min.js" type="text/javascript"></script>
 <meta name="viewport" content="width=device-width">   
 </head>
 <body>

  <style type="text/css">
    .n{
      /* width: 500px; */
    }
  </style>
 
  <div class="n">
  <div class="layui-btn-group demoTable">
  <button class="layui-btn" onclick= "tosendletter()"id="sendLetter">发信件</button>
  <!-- <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
  <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
  <button class="layui-btn" data-type="isAll">验证是否全选</button> -->
</div>
 <script >
 $("#sendLetter").click(function(){
 
 self.location="${pageContext.request.contextPath}/letterbox/tosendletter.do"; 


}); 
</script>
<table class="layui-table" lay-data="{width: 952, height:442, url:'${pageContext.request.contextPath}/letterbox/showuserletters.do', page:true, id:'idTest'}" lay-filter="demo">
  <thead>
    <tr>
    <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
      <!-- <th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th> -->
      <th lay-data="{field:'title'}">主题</th>
      <th lay-data="{field:'createTimeOuput', width:120, sort: true}">时间</th>
       <th lay-data="{field:'content'}">内容</th>
      <th lay-data="{field:'deal_result', width:100}">查看情况</th>
      <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
         </tr>
  </thead>
</table>
 
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs " lay-event="detail">查看</a>
 
  <a class="layui-btn layui-btn-danger layui-btn-xs"  lay-event="del">删除</a>
</script>
               
      <!--    <a class="layui-btn layui-btn-xs layui-bg-blue" lay-event="edit">编辑</a> -->  
<script src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('table', function(){
  var table = layui.table;
  //监听表格复选框选择
  table.on("checkbox(demo)", function(obj){
 
    console.log(obj);
  });
  //监听工具条
  table.on("tool(demo)", function(obj){
    var data = obj.data;
   
    if(obj.event === 'detail'){
    
      window.location.href="${pageContext.request.contextPath}/letterbox/getLetter.do?id="+data.id + "&flag=1";
    
    } else if(obj.event === 'del'){
      layer.confirm('真的删除行么', { offset: '100px',skin: 'layui-layer-molv'},function(index){
        $.ajax({
        type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/letterbox/deleteletter.do" ,//url
                data: "id=" + data.id,
                success: function (result) {
                 
                 window.location.href = location.href;
                
                //alert(result.message);
                   // console.log(result);//打印服务端返回的数据(调试用)
                    //if (result.resultCode == 200) {
                       // alert("SUCCESS");
                   // }
                    //;
                },
                error : function() {
                    alert("异常！");
                }
         
  
	
	
        
        
        
        })
        
        
        
        
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      layer.alert('编辑行：<br>'+ JSON.stringify(data))
    }
  });
  
  var $ = layui.$, active = {
    getCheckData: function(){ //获取选中数据
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
    }
    ,getCheckLength: function(){ //获取选中数目
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
    }
    ,isAll: function(){ //验证是否全选
      var checkStatus = table.checkStatus('idTest');
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});




</script>
  
  </div>
<%-- <div class="layui-btn-group demoTable">
  <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
  <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
  <button class="layui-btn" data-type="isAll">验证是否全选</button>
</div>
 <div class="n">
<table class="layui-table" id="t" lay-data="{width: 800, height:332, url:'${pageContext.request.contextPath}/letterbox/showuserletters.do', page:true,



 id:'idTest'}"  lay-filter="demo">
  <thead>
    <tr>
      <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
      <th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
      <th lay-data="{field:'title', width:80}">主题</th>
      <th lay-data="{field:'create_time', width:120, sort: true}">时间</th>
      <th lay-data="{field:'deal_result', width:130}">查看情况</th>
     
      
    </tr>
  </thead> 
</table>
 </div> --%>

               
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<!-- <script>
layui.use('table', function(){
	
  var table = layui.table;
   /* table.render({
    elem: '#t',
    /* ,url:"${pageContext.request.contextPath}/letterbox/showuserletters.do"
    
    ,title: "用户数据表"
   
    ,cols: [[
    {type:'checkbox', fixed: 'left'},
    {field:'id', width:80, sort: true, fixed: true,title:"id"},
    {field:'title', width:80,title:"主题"},
    {field:'create_time', title:"发送时间",width:120, sort: true},
      {field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true, totalRowText: '合计行'}
      ,{field:'username', title:'用户名', width:120, edit: 'text'}
      /* ,{field:'email', title:'邮箱', width:150, edit: 'text'}
      ,{field:'experience', title:'积分', width:80, sort: true, totalRow: true}
      ,{field:'sex', title:'性别', width:80, edit: 'text', sort: true}
      ,{field:'logins', title:'登入次数', width:100, sort: true, totalRow: true}
      ,{field:'sign', title:'签名'}
      ,{field:'city', title:'城市', width:100}
      ,{field:'ip', title:'IP', width:120}
      ,{field:'joinTime', title:'加入时间', width:120} 
    ]]
    ,page: true
     , response: {
      statusCode: 200 //重新规定成功的状态码为 200，table 组件默认为 0
    }
    ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
    alert(res.data[0].id);
      return {
        "code": res.code, //解析接口状态
        "msg": res.msg, //解析提示文本
        "count": res.count, //解析数据长度
        "data": res.data //解析数据列表
      };
    } 
  }); 
  
  
  //监听表格复选框选择
  table.on('checkbox(demo)', function(obj){
    console.log(obj)
  });
  //监听工具条
  table.on('tool(demo)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
      layer.msg('ID：'+ data.id + ' 的查看操作');
    } else if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      layer.alert('编辑行：<br>'+ JSON.stringify(data))
    }
  });
  
  var $ = layui.$, active = {
    getCheckData: function(){ //获取选中数据
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.alert(JSON.stringify(data));
    }
    ,getCheckLength: function(){ //获取选中数目
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.msg('选中了：'+ data.length + ' 个');
    }
    ,isAll: function(){ //验证是否全选
      var checkStatus = table.checkStatus('idTest');
      layer.msg(checkStatus.isAll ? '全选': '未全选')
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});*/
</script> -->
</body></html>