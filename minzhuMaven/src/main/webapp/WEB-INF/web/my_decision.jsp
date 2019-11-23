<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.bjjs.gov.cn/bjjs/index/index.shtml -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link href="./北京市住房和城乡建设委员会门户网站_files/default.css" rel="stylesheet" id="lhgdialoglink">
  
  
  <title>农村民主建设</title>
<meta name="version" content="7.9.7">


<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
<script src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

 <meta name="viewport" content="width=device-width">   
 </head>
 <body>

  <style type="text/css">
     .n{
       width: 500px; 
     margin: 0;
     text-align: center;
     
         } 
  </style>
<div class="layui-form" >
  <div class="n">
  <div class = "layui-form-item" >
<div class="layui-input-inline">
        <input type="text" name="keyword" autocomplete="off"
               placeholder="主题" class="layui-input" id="keyword" >
               
    </div>
    <div class="layui-input-inline">
      <select name="status" id="status" >
      	<option value="1">我参与的决策</option>
      	 <option value="0">全部决策</option>
         <option value="2">我未参与的决策</option>
        </select>
        
    </div>
 <button class="layui-btn" id="searchEmailCompany" data-type="reload" >
        <i class="layui-icon" style="font-size: 20px; "></i> 搜索
    </button>
 
 </div>
</div>
 
 <table id="demo" lay-filter="demo"></table>
<script type="text/html" id="barDemo">

 
  <a class="layui-btn layui-btn-primary layui-btn-xs " lay-event="detail">查看</a>
 

</script>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script >

 $("#add").click(function(){
 
 self.location="${pageContext.request.contextPath}/decision/toAddDecision.do"; 


}); 
</script>
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
                url: "${pageContext.request.contextPath}/decision/deleteSelectedDecision.do" ,//url
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
        
        self.location="${pageContext.request.contextPath}/decision/toAddDecision.do"; 
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
       window.location.href="${pageContext.request.contextPath}/decision/getMyDecisionById.do?id="+data.id + "&flag=1";
  
    } else if(obj.event === 'del'){
   
      layer.confirm('确认删除？', { offset: '100px',skin: 'layui-layer-molv'},function(index){
        $.ajax({
        type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/decision/deleteDecisionByid.do?id="+data.id ,//url
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
      window.location.href="${pageContext.request.contextPath}/decision/todecision.do?id="+data.id + "&flag=0";
    }
  });
  

  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});




</script>
<style>
  .layui-table-cell{
      display:table-cell;
      vertical-align: middle;
  }
</style>
  <script>
 
  layui.use('table', function(){
  var table = layui.table;
  
  //第一个实例
  var tableModel = table.render({
    elem: '#demo'
    ,width: 892
    
     ,toolbar: '#toolbarDemo'
    ,url: '${pageContext.request.contextPath}/decision/getMyDecision.do?status=1' //数据接口
    ,page: true //开启分页
    
    ,cols: [[ //表头
   {type:'checkbox', fixed: 'left'}
    /*  ,{field:'id', width:80, sort: true, fixed: true} */
    
     // ,{field:'idnumber', title:'日期',width:120, sort: true}
       ,{field:'title',title:'主题',width:150}
      ,{field:'startDate',title:'开始日期', sort:true,width:150,templet:function (d) {
 return dateToStr(d.startDate);
 }}
      ,{field:'endDate',title:'结束日期', sort:true,width:150,templet:function (d) {
 return dateToStr(d.endDate);}}
      ,{field:'result',title:'结果', width:120}
      ,{fixed: 'right', width:100, align:'center', toolbar: '#barDemo'} 
    
    ]]
  });
  
});
  
  
  </script>
  
  <script >
  $("#searchEmailCompany").click(function(){
   var keyword=$("#keyword").val();
  
   var status=$("#status").val();
  layui.use('table', function(){
  var table = layui.table;
  table.reload('demo',{
    url:'${pageContext.request.contextPath}/decision/getMyDecision.do?' //,
    
   , page:{ curr:1 }
   
   , where:{
    'status':status,
    'keyword' :keyword
    }

});
  });
  });
  
  
  </script>
  
  <script>
  <script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate
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