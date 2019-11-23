<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.bjjs.gov.cn/bjjs/index/index.shtml -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link href="./北京市住房和城乡建设委员会门户网站_files/default.css" rel="stylesheet" id="lhgdialoglink">
  <title>农村民主建设</title>
<meta name="createDate" content="2018-12-19 17:30:10">
<meta name="cacheclearDate" content="2018-11-30 17:40:45">
<meta name="version" content="7.9.7">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<link rel="stylesheet" href="../layui/css/layui.css"  media="all">



<link rel="stylesheet" type="text/css" href="../css/huilan-jquery-ui.css">
<script src="../js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="../layui/layui.js" charset="utf-8"></script>

 <meta name="viewport" content="width=device-width">   
 </head>
 <body>

  <style type="text/css">
    .n{
      width: 500px;
    }
  </style>
 
  <div class="n">
 

<div class="layui-input-inline">
        <input type="text" name="keyword" autocomplete="off"
               placeholder="姓名/手机/身份证" class="layui-input" id="keyword" >
    </div>
 <button class="layui-btn" id="searchEmailCompany" data-type="reload" >
        <i class="layui-icon" style="font-size: 20px; "></i> 搜索
    </button>
<!-- <button type="button" class="layui-btn" id="test1" >
  <i class="layui-icon">&#xe67c;</i>批量添加
</button>
 -->



 <script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    
 </div>
</script>
 <!-- <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    -->
 <table id="demo" lay-filter="demo"></table>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs " lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs"  lay-event="del">删除</a>
 <a class="layui-btn layui-btn-xs layui-bg-green" lay-event="edit">编辑</a>
</script>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
layui.use('table', function(){
  var table = layui.table;
  //工具栏事件
  table.on('toolbar(demo)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
 
      case 'getCheckData':
        var data = checkStatus.data;
        layer.confirm('确认删除选中数据？', { offset: '100px'},function(index){
        var myArray=new Array();
        for (var i = 0; i < data.length; i++){
          myArray[i] = data[i].idnumber;
        }
        $.ajax({
        type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/user/deleteSelectUsers.do" ,//url
                data: "myArray="+myArray,
                success: function (result) {
                window.location.href = location.href;                
                
                },
                error : function() {
                    //alert("异常！");
                }      
        });           
        //obj.del();
        layer.close(index);
      });
        
        
        
  
      break;
      case 'getCheckLength':
        var data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
      break;
      case 'isAll':
        layer.msg(checkStatus.isAll ? '全选': '未全选')
      break;
      case 'addmany':
      
      layui.use('upload', function(){
  var upload = layui.upload;
  
  //执行实例
  var uploadInst = upload.render({
    elem: '#addmany' //绑定元素
    ,url: '${pageContext.request.contextPath}/user/addmany.do' //上传接口
    ,done: function(res){
      //上传完毕回调
    }
    ,error: function(){
      //请求异常回调
    }
  });
  
});
     
};
  });
     
    
  //监听表格复选框选择
  table.on("checkbox(demo)", function(obj){
 
    console.log(obj);
  });
  //监听工具条
  table.on("tool(demo)", function(obj){
    var data = obj.data;  
    if(obj.event === 'detail'){
      layer.msg('ID：'+ data.idnumber + ' 的查看操作');
       window.location.href= '${pageContext.request.contextPath}/user/showUserInfo.do?idnumber='+data.idnumber;
    } else if(obj.event === 'del'){
    layer.msg('ID：'+ data.id + ' 的查看操作');
      layer.confirm('确认删除？', { offset: '100px'},function(index){
        $.ajax({
        type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/user/deleteuser.do?idnumber="+data.idnumber ,//url
                //data: "idnumber=" + data.idnumber,
                success: function (result) {
                 
                 window.location.href = location.href;
                
             
                },
                error : function() {
                    //alert("异常！");
                }
         
  
        
        });
        
        
        
        
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
      layer.alert(data.id);
     // layer.alert(JSON.stringify(data));
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
});


</script><style>
  .layui-table-cell{
     /*  display:table-cell; */
    /*   vertical-align: middle; */
  }
</style>
  <script>
 
  layui.use('table', function(){
  var table = layui.table;
  var form = layui.form;
  //第一个实例
  var tableModel = table.render({
    elem: '#demo'
 
    ,width: 892
     ,limit:10
     ,toolbar: '#toolbarDemo'
    ,url: '${pageContext.request.contextPath}/user/showAdmin.do' //数据接口
    ,page: true //开启分页
    
    ,cols: [[ //表头
   {type:'checkbox', fixed: 'left'}
    /*  ,{field:'id', width:80, sort: true, fixed: true} */
    
      ,{field:'idnumber', title:'身份证号',width:120, sort: true}
       ,{field:'username',title:'姓名', width:100}
      
      ,{field:'post',title:'职位', width:100}
      ,{field:'phone',title:'联系方式', width:120}
       ,{field:'isShow', title:'是否管理员', width:120, templet: '#switchTpl', unresize: true}
     /*  ,{fixed: 'right', width:180, align:'center', toolbar: '#barDemo'} 
     */
    ]]
  });
  //监听性别操作
  form.on('switch(showDemo)', function(obj){
  
  $.ajax({
   type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/user/updatelevelByid.do?",//url
                data: {"id" :this.value,"level":obj.elem.checked},
                success: function (result) {
                 
                // window.location.href = location.href;
               
                },
                error : function() {
                    alert("异常！");
                }    
  });
  
});
  });
  
  </script>
<script type="text/html" id="switchTpl">
  <!-- 这里的 checked 的状态只是演示 -->
  <input type="checkbox" name="isShow" id="isShow" value="{{d.id}}" lay-skin="switch" lay-text="是|否" lay-filter="showDemo" {{ d.level == 1 ? 'checked' : '' }}>
</script>
<script >
$("#searchEmailCompany").click(function(){
   var keyword=$("#keyword").val();
  layui.use('table', function(){
  var table = layui.table;
  table.reload('demo',{
    url:'${pageContext.request.contextPath}/user/searchUser.do?keyword=' + keyword //,  
   , page:{ curr:1 }
    
});
  });
  });
</script>  </div>
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