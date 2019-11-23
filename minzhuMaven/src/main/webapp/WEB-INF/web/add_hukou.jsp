<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
   
</title>
   <%--  <script src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
    --%>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/autocomplete.css"  media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
	
   <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
  <%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
   --%>  <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

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


<style>
	.ui-autocomplete-loading {
		background: white url("${pageContext.request.contextPath}/images/public/load.gif") right center no-repeat;
	}
	</style>
	

<a onclick="javascript:history.go(-1);" ><i class="layui-icon layui-icon-return" style="font-size: 30px; color: #009688;"></i> </a>
    <form class="layui-form" id ="form1" name="form1" >
   
 
   <div class="layui-form-item">
   <div class="layui-inline">
   <label class="layui-form-label">户主</label>
    <div class="layui-input-inline" style="width: 200px;">
   <!--   <div class="ui-widget">  -->
<input type="text" name="autokeyword" id="autokeyword"  placeholder="请输入身份证号" class="layui-input"  style="width:150px">
</input>
<!-- </div> -->
</div>
 
   
       <div class="layui-input-inline" style="width: 150px;">
      

  
 </div>
       </div>
  </div>
  
 
    <div class = "layui-form-item" id="others">
    <label class="layui-form-label">添加成员      <i class="layui-icon layui-icon-add-1" style="font-size: 20px; color: #00CC99;" onclick="addOption()"></i> </label>
   
    <div class="layui-inline" >
   
    </div>
    </div>
     
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" id="change_button" name="change_button" type="button" >添加</button>
     <!--  <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
    </div>
  </div>
</form>
  <script type="text/javascript">
  function addOption(){
 
  var option = "<div class='layui-form-item' id='info' >\
  <label class='layui-form-label'>\
  <i class='layui-icon layui-icon-delete' onclick='delOption(this)' style='font-size: 20px; color: 	#FF6633'></i>\
  成员：</label>\
    <div class='layui-input-inline'>\
    <input type='text' placeholder='与户主关系'  name='relation' id ='relation'  class='layui-input' style='width: 100px;'>\
    </div>\
     <div class='layui-inline' >\
    <input type='text' placeholder='身份证号'  name='other_idnumber' id ='other_idnumber'  class='layui-input' style='width: 150px;'>\
    </div> ";
   
  $("#others").append(option);
  var numbers =  $("input[id=other_idnumber]");
 
  for(var i = 0;i<numbers.length;i++){
  var obj =numbers[i];
  $(obj).autocomplete({
			source:  "${pageContext.request.contextPath}/user/getAutoUserInfo.do" ,
			minLength: 1,
			multiple: true,    
   width:150,    
   max:50,    
  			select: function( event, ui ) {
				$(this).val( ui.item.idnumber );//log( "Selected: " + ui.idnumber + " aka " + ui.id );
			 return false;
			}
		})
		.data( "ui-autocomplete" )._renderItem = function( ul,item){
            return $( "<li>" )
            .append(  "<a>" +item.idnumber +  item.username +"</a>" )
            .appendTo( ul );
        }; 
        
		
  
  
  }
   
  
  
  
  
  
  
  
  
  
  };
  function delOption(obj){
  $(obj).parent().parent().remove();
  
  }
  
  
  
  $("#change_button").click(function(){ 
  layui.use(['layer'],function(){
  layer = layui.layer;
  });
  
  if($("#master").val() == ""){
  
  layer.alert("请添加户主信息");
  return;
  } 
  
  
 
  var infos = $("div[id=info]"); 
  
  console.log(infos.length);
  var relation = "";
  var idnumbers = "";
  if(infos.length>=1){
  relation= $(infos[0]).children().children('#relation').val();
  idnumbers= $(infos[0]).children().children('#other_idnumber').val();
  }
  for (var i = 1 ;i<infos.length;i++){
  	var one = infos[i];
  	var r = $(one).children().children('#relation').val();
  	var id = $(one).children().children('#other_idnumber').val();
  	relation = relation + ","+r;
  	idnumbers = idnumbers + ","+id;
  }
  
  master_idnumber = $("#autokeyword").val();
  
  $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/hukou/addHuKou.do" ,//url
                data: {"idnumbers":idnumbers,"relation":relation,"master_idnumber":master_idnumber},
                success: function (result) {
                if(result.state == 201){
              
                layer.msg(result.message);
                return ;
                }else if(result.state == 200){
                
                layer.msg("添加成功",function(){
                 javascript:history.go(-1);
                });
               
               }else{
              
                layer.msg("异常"); return ;
               }
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

	
 
<!-- <div class="ui-widget" style="margin-top:2em; font-family:Arial">
	Result:
	<div id="log" style="height: 200px; width: 300px; overflow: auto;" class="ui-widget-content"></div>
</div>
 -->

<script>

		
			


$( function() {
		function log( message ) {
			$( "<div>" ).text( message ).prependTo( "#log" );
			$( "#log" ).scrollTop( 0 );
		}
		
		
		$( "#autokeyword" ).autocomplete({
			source:  "${pageContext.request.contextPath}/user/getAutoUserInfo.do" ,
			minLength: 1,
			multiple: true,    
   width:150,    
   max:50,    
  
 
			select: function( event, ui ) {
				$( "#autokeyword" ).val( ui.item.idnumber );//log( "Selected: " + ui.idnumber + " aka " + ui.id );
			 return false;
			}
			  
  //加入对返回的json对象进行解析函数，函数返回一个数组      
  /*  parse: function(data) {  
     var rows = [];  
     for(var i=0; i<data.length; i++){  
    
      rows[rows.length] = {   
        data:1,//data[i].idnumber +"-"+data[i].username,   
        value:1,//data[i].idnumber,   
        result:1//data[i].idnumber   
        };   
      }  
   return rows;  
     },  
   formatItem: function(row, i, n) {  
      return row;        
  }  */
		})
		.data( "ui-autocomplete" )._renderItem = function( ul,item){
            return $( "<li>" )
            .append(  "<a>" +item.idnumber +  item.username +"</a>" )
            .appendTo( ul );
        }; 
        
        
        
       
        
	});
	

/* 
  layui.config({
version: false,
debug: false,
base: '${pageContext.request.contextPath}/layui/'
}); 


layui.use('autocomplete',function(data){
autocomplete = layui.autocomplete;

autocomplete.render({
            elem: $('input[name=autokeyword]')[0],
            //url: '${pageContext.request.contextPath}/user/getAutoUserInfo.do',
            cache:true,
            template_val: '{{d.idnumber}}',
            template_txt: '{{d.idnumber}}<span class=\'layui-badge layui-bg-gray\'>   {{d.username}}</span>',
            onselect: function (resp) {
                $("#autokeyword").val(resp.idnumber);
            }
        });
}); */

</script>

</body>
</html>
