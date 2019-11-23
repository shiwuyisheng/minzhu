<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
   
</title><link href="css/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="css/jbox.css" rel="stylesheet" type="text/css" /><link href="css/ks.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
   

    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
    elem: '#date1'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
    ,pass: [
      /^[\S]{6,12}$/
      ,'密码必须6到12位，且不能出现空格'
    ]
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return false;
  });
 

  
  
});
</script>
</head>
<body style="margin:auto">
<style>
a{color:#009688;
font-size:20px;

}
a:hover{color:blue}
</style>
<a onclick="javascript:history.go(-1);" ><i class="layui-icon layui-icon-return" style="font-size: 30px; color: #009688;"></i> </a>
    <form class="layui-form" id ="form1" name="form1" >
   
  
   <div class="layui-form-item">
   <div class="layui-inline">
   <label class="layui-form-label" style="width: 150px;">开始报名日期</label>
    
    <div class="layui-input-inline" style="width: 150px;">
    
  
  <input type="text" class="layui-input" id="startDate"  style="width: 150px;">
</div>
 <label class="layui-form-label" style="width: 150px;">结束报名日期</label>
   
       <div class="layui-input-inline" style="width: 150px;">
      
  
  <input type="text" class="layui-input" id="endDate"  style="width: 150px;">
 </div>
       </div>
  </div>
  

   
     <div class = "layui-form-item" id="options">
     <div class="layui-input-inline">
      <label class="layui-form-label">竞选职位  <i class="layui-icon layui-icon-add-1" style="font-size: 20px; color: #00CC99;" id="add_option" onclick = "addOption()"></i></label>
      
   
    <!-- 
    <button class="layui-btn" type="button" id="add_option" onclick = "addOption()">添加职位</button>
     -->
    </div>
    </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" id="change_button" name="change_button" type="button" >保存</button>
     <!--  <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
    </div>
  </div>
</form>
  <script type="text/javascript">
  function addOption(){
 
  var option = "<div class='layui-form-item'>\
  <label class='layui-form-label'>选项</label>\
    <div class='layui-input-block'>\
    <input type='text' name='option' id ='option'  class='layui-input' style='width: 150px;'>\
    </div> </div>";
   
  $("#options").append(option);
  };
  $("#change_button").click(function(){ 
  layer = layui.layer;
   if($("#option").val() == ""){
 
  layer.alert("请添加选项");
  return;
  } 
  
  if($("#start_date").val() == ""){
  layer.alert("请添加开始日期");return;
  }
  if($("#end_date").val() == ""){
  layer.alert("请添加结束日期");return;
  }
  /* var ABC = new Array();*/
  
 
  var options = $("input[name='option']");
  
  var poption = options[0].value;
  for(var i = 1; i< options.length;i++){
  poption = poption + "," + options[i].value;
  }
   
 
  $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/enlist/addEnlist.do" ,//url
                data: $("#form1").serialize()+"&start_date="+ $("#startDate").val()+ "&end_date="+ $("#endDate").val()+"&post=" +poption,
                success: function (result) {
                 layer.alert("添加成功",{ offset: '100px',skin: 'layui-layer-molv'},function(){
                  javascript:history.go(-1);
                  window.location.href="${pageContext.request.contextPath}/enlist/to_enlist.do";
                 });
                },
                error : function() {
                   // alert("异常！");
                }
            });
  
  });
       
    </script>
   <script>
layui.use('laydate', function(){
  var laydate = layui.laydate;
  
  //执行一个laydate实例
  laydate.render({
    elem: '#startDate' //指定元素
  });
   laydate.render({
    elem: '#endDate' //指定元素
  });
});
</script>
</body>
</html>
