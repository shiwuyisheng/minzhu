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
<script type="text/html" id="switchTpl">
  <!-- 这里的 checked 的状态只是演示 -->
  <input type="checkbox" name="isShow" id="isShow" value="{{d.id}}" lay-skin="switch" lay-text="是|否" lay-filter="showDemo" {{ d.isShow == 1 ? 'checked' : '' }}>
</script>
<script src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

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
               placeholder="主题" class="layui-input" id="keyword" >
    </div>
 <button class="layui-btn" id="searchEmailCompany" data-type="reload" >
        <i class="layui-icon" style="font-size: 20px; "></i> 搜索
    </button>
 
 

<%-- <table class="layui-table" lay-data="{width: 892, height:542, url:'${pageContext.request.contextPath}/user/showUser.do' ,toolbar: '#toolbarDemo', page:true, id:'idTest'}" lay-filter="demo">
 --%> <script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">删除选中行数据</button>
  <button class="layui-btn layui-btn-sm" id="add" lay-event="add" data-type="reload" >
         发布新文章
    </button>
   
 </div>
</script>
 
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
       
        layer.confirm('确认删除选中数据？', { offset: '100px',skin: 'layui-layer-molv'},function(index){
        var myArray=new Array();
        for (var i = 0; i < data.length; i++){
          myArray[i] = data[i].id;
        }
        $.ajax({
        type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/elect/deleteSelectedElection.do" ,//url
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
      case 'add':
        
        self.location="${pageContext.request.contextPath}/communication/toAddCommunication.do"; 
        break;
        
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
     
       var index = data.path.indexOf("communicate_html");
      var path = data.path.substring(index);
      var path_real = "${pageContext.request.contextPath}/"+path; 
       window.open(path_real,"_blank");
  
    } else if(obj.event === 'del'){
    
   
      layer.confirm('确认删除？', { offset: '100px',skin: 'layui-layer-molv'},function(index){
        $.ajax({
        type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/communication/deleteCommunicationByid.do?id="+data.id ,//url
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
     // layer.alert('编辑行：<br>'+ JSON.stringify(data));
      window.location.href="${pageContext.request.contextPath}/communication/getCommucation.do?id="+data.id + "&flag=0";
    }
  });
  
  var $ = layui.$, active = {
    getCheckData: function(){ //获取选中数据
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
     
     // layer.alert(JSON.stringify(data));
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
<style>
  .layui-table-cell{
    /*   display:table-cell; */
    /*   vertical-align: middle; */
  }
</style>

  <script>
 
  layui.use('table', function(){
  var table = layui.table
  ,form = layui.form;
  //第一个实例
  var tableModel = table.render({
    elem: '#demo'
    ,width: 892
     ,toolbar: '#toolbarDemo'
    ,url: '${pageContext.request.contextPath}/communication/getAll.do' //数据接口
    ,page: true //开启分页
    ,limit:10
    ,cols: [[ //表头
   {type:'checkbox', fixed: 'left'}
    /*  ,{field:'id', width:80, sort: true, fixed: true} */
    
     // ,{field:'idnumber', title:'日期',width:120, sort: true}
       ,{field:'title',title:'主题', width:200}
      ,{field:'createDate',title:'创建日期', sort:true,width:130,templet:function (d) {
 return dateToStr(d.createDate);
 }}
 	,{field:'level',title:'优先级', width:120}
      ,{field:'isShow', title:'显示', width:85, templet: '#switchTpl', unresize: true}
      ,{fixed: 'right', width:200, align:'center', toolbar: '#barDemo'} 
    
    ]]
  });
   //监听性别操作
  form.on('switch(showDemo)', function(obj){
  
  $.ajax({
   type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/communication/updateCommunicationByid.do?",//url
                data: {"id" :this.value,isShow:obj.elem.checked},
                success: function (result) {
                 
                 //window.location.href = location.href;
               
                },
                error : function() {
                    //alert("异常！");
                }    
  });
   // layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
  });
});
  
  
  </script>
  
  <script >
  $("#searchEmailCompany").click(function(){
   var keyword=$("#keyword").val();
  layui.use('table', function(){
  var table = layui.table;
  table.reload('demo',{
    url:'${pageContext.request.contextPath}/communication/getAll.do?keyword=' + keyword //,
    
   , page:{ curr:1 }
   
   // where:{'idnumber':keyword}

});
  });
  });
  
  
  </script>
<!--转换时间格式-->
<script type="text/javascript">
 function dateToStr(date) {

 var time = new Date(date);
 
 var y = time.getFullYear();
  
 var M = time.getMonth() + 1;
 M = M < 10 ? ("0" + M) : M;
 var d = time.getDate();
 d = d < 10 ? ("0" + d) : d;
 var h = time.getHours();
 h = h < 10 ? ("0" + h) : h;
 var m = time.getMinutes();
 m = m < 10 ? ("0" + m) : m;
 var s = time.getSeconds();
 s = s < 10 ? ("0" + s) : s;
 var str = y + "-" + M + "-" + d ;//+ " " + h + ":" + m + ":" + s;
 console.log(str);
 return str;
 }
</script>
  </div>

</body></html>