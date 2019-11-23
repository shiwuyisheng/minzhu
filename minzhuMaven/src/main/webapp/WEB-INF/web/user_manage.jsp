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
<link rel="stylesheet" href="../layui/css/autocomplete.css"  media="all">
<script src="../js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
 <meta name="viewport" content="width=device-width">   
 </head>
 <body >

  <style type="text/css">
    .n{
     /*  width: 500px; */
     height:430px;
    }
  </style>
 
  <div >


<div class="layui-input-inline" style="width:160px">
        <input type="text" name="keyword" autocomplete="off"
               placeholder="姓名/手机/身份证" class="layui-input" id="keyword" >
    </div>
    

<div class="layui-input-inline">
 <button class="layui-btn" id="searchEmailCompany" data-type="reload" >
        <i class="layui-icon" style="font-size: 20px; "></i> 搜索
    </button></div>
   <div class="layui-input-inline"> <button type="button" class="layui-btn " id="down" >
  <i class="layui-icon layui-icon-download-circle"></i>下载模板
</button></div>
<div class="layui-input-inline"><button type="button" class="layui-btn" id="test1" >
  <i class="layui-icon">&#xe67c;</i>批量添加
</button>
</div>

<script>
$("#down").click(function(){
window.open("${pageContext.request.contextPath}/user/downfileModel.do");
})

layui.use('upload', function(){
  var upload = layui.upload;
   
  //执行实例
  var uploadInst = upload.render({
    elem: '#test1' //绑定元素
    ,url: '${pageContext.request.contextPath}/user/addmany.do' //上传接口
    ,accept:"file"
    ,before:function(){
     layer.msg("正在保存，请稍等10秒钟左右");
    }
    ,done: function(res){
     layer.msg("执行完成");
   
     var data = res;
     if(res.data.samelists != null || res.data.errorlists != null)
     layer.confirm("未全部倒入，可下载错误报告",{
      area: ['300px', '200px'],offset: '100px',skin: 'layui-layer-molv'
      ,btn: ['下载报告', '取消'] //可以无限个按钮
  ,btn3: function(index, layero){
    //按钮【按钮三】的回调
    
  }
},function(index, layero){

 window.open("${pageContext.request.contextPath}/user/downfile.do?filename="+data['message']);
window.location.href="${pageContext.request.contextPath}/user/toUserManage.do";
}
      
      );
      //上传完毕回调
    }
    ,error: function(){
      //请求异常回调
      alert(66);
      layer.msg("错误");
    }
  });
});
</script>
 
 <script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
<button class="layui-btn layui-btn-sm" lay-event="add">添加新用户</button>
    
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">删除选中行数据</button>
    
 </div>
</script>
 <table id="demo" lay-filter="demo"></table>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs " lay-event="detail">修改信息</a>
 
  <a class="layui-btn layui-btn-danger layui-btn-xs"  lay-event="del">删除</a>
 
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
        //layer.alert(JSON.stringify(data));
        //layer.alert(data[0].id);
        layer.confirm('确认删除选中数据？', {offset: '100px',skin: 'layui-layer-molv'},function(index){
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
                layer.msg("删除成功", function(){ window.location.href = location.href; });
                             
                
                },
                error : function() {
                    //alert("异常！");
                }      
        });           
        //obj.del();
        layer.close(index);
      });
     
      break;
      case 'add':
        window.location.href = "${pageContext.request.contextPath}/user/toAddUser.do";
        
      break;
      

     
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
      
       window.location.href= '${pageContext.request.contextPath}/user/showUserInfo.do?idnumber='+data.idnumber;
    } else if(obj.event === 'del'){
   
      layer.confirm('确认删除？', { offset: '100px',skin: 'layui-layer-molv'},function(index){
        $.ajax({
        type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/user/deleteuser.do?idnumber="+data.idnumber ,//url
               
                success: function (result) {
                 layer.msg("删除成功",function(){
                  window.location.href = location.href;
                
                 });
                
                
                },
                error : function() {
                    //alert("异常！");
                }
        })
        
        
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'updatepassword'){
      layer.confirm('确认重置该用户密码？', { offset: '100px',skin: 'layui-layer-molv'},function(index){
        $.ajax({
        type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/user/clearPassword.do?idnumber="+data.idnumber ,//url
               
                success: function (result) {
                 layer.msg("重置成功！");
                 window.location.href = location.href;
                
                
                },
                error : function() {
                    //alert("异常！");
                }
        })
        
        
        obj.del();
        layer.close(index);
      });
    }
  });
  
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});




</script>
<style>
  /* .layui-table-cell{
      display:table-cell;
      vertical-align: middle;
      
  } */
</style>
  <script>
 
  layui.use('table', function(){
  var table = layui.table;
  
  //第一个实例
  var tableModel = table.render({
    elem: '#demo'
    ,width:1050
  ,limit:10
     ,toolbar: '#toolbarDemo'
    ,url: '${pageContext.request.contextPath}/user/showUser.do' //数据接口
    ,page: true //开启分页
    
    ,cols: [[ //表头
   {type:'checkbox', fixed: 'left'}
    /*  ,{field:'id', width:80, sort: true, fixed: true} */
    
      ,{field:'idnumber', title:'身份证号',width:130, sort: true}
       ,{field:'username',title:'姓名', width:100}
      ,{field:'sex',title:'性别', width:65,templet: '#sex'}
      ,{field:'age',title:'年龄', width:65}
      ,{field:'post',title:'职务', width:80}
       ,{field:'face',title:'政治面貌', width:100,templet: '#face'}
        ,{field:'education',title:'学历', width:70}
      ,{field:'phone',title:'联系方式', width:140}
      ,{fixed: 'right', width:190, align:'center', toolbar: '#barDemo'} 
    
    ]]
  });
  
});
  
  
  </script>
<script type="text/html" id="sex">
 
{{#  if(d.sex == 0){ }}
   男
  {{#  } else if(d.sex==1) { }}
  女
  {{#  } }}
</script> 
<script type="text/html" id="face">
 
{{#  if(d.face == 0){ }}
    群众
  {{#  } else if(d.face==1) { }}
   党员
 
 {{#  } else if(d.face==2) { }}
   预备党员
 
 {{#  } else if(d.face==3) { }}
   团员
  {{#  } }}
</script> 
<script >
$("#searchEmailCompany").click(function(){
   var keyword=$("#keyword").val();
  layui.use('table', function(){
  var table = layui.table;
  table.reload('demo',{
    url:'${pageContext.request.contextPath}/user/searchUser.do?keyword=' + keyword //,
    ,where: { //设定异步数据接口的额外参数，任意设
    aaaaaa: 'xxx'
    ,bbb: 'yyy'
    
  }
   , page:{ curr:1 }
   
   // where:{'idnumber':keyword}

});
  });
  });
</script>  </div>



</body></html>