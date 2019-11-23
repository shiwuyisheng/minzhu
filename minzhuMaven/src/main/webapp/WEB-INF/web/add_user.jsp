<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
    
</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
   

    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

</head>
<body style="margin:auto">
<style>
a{color:#009688;
font-size:20px;

}
a:hover{color:blue}
</style>
<a onclick="javascript:history.go(-1);" ><i class="layui-icon layui-icon-return" style="font-size: 30px; color: #009688;"></i> </a>
    <form class="layui-form" id ="form1" name="form1" lay-filter="form1">
        <!-- <div class="layui-form-item">
<div class="layui-upload">
  
  <div class="layui-upload-list">
    <img  id="demo1" class="layui-upload-img" style="width:350px;height: auto;max-height: 10em;min-height: 2em;max-width: 7em; min-width:3em ;overflow:hidden; "  src="">
    <p id="demoText"></p>
  </div>
  </div>
  <button type="button" class="layui-btn" id="test1">上传头像</button>
</div>   -->
  <div class="layui-form-item">
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-block">
      <input type="text" name="username" value="" id ="username"  placeholder="用户名" class="layui-input" style="width: 150px;">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">身份证号</label>
    <div class="layui-input-block">
      <input type="text" value="" name="idnumber" id="idnumber" placeholder="" class="layui-input" style="width: 300px;">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">年龄</label>
    <div class="layui-input-block">
      <input type="text" name="age" value="" id ="age"  placeholder="年龄" class="layui-input" style="width: 150px;">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block">
      <input type="radio" name="sex" id ="sex"value="0" title="男" checked="">
      <input type="radio" name="sex" id = "sex" value="1" title="女">
      
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">政治面貌</label>
      <div class="layui-input-inline">
        <select name="face" id="face"  >
          <option value="-1">选择</option>
   <!--       <optgroup label="党员">--->
             <option value="0" id="0" >群众</option>
            <option value="1" id="1" >党员</option>
            <option value="2" id="2">预备党员</option>
           <option value="3" id="3">团员</option>
        </select>
      </div>
    </div>
    
  <div class="layui-form-item">
    <label class="layui-form-label">学历</label>
    <div class="layui-input-block">
      <input type="text" value="" name="education"   class="layui-input" style="width: 100px;">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">村内职务</label>
    <div class="layui-input-block">
      <input type="text" value="" id = "post"name="post"  class="layui-input" style="width: 100px;">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">联系电话</label>
      <div class="layui-input-inline">
        <input type="tel" name="phone" id = "phone"value="" lay-verify="required|phone" autocomplete="off" class="layui-input">
      </div>
    </div>
  <div class="layui-form-item">
    <label class="layui-form-label">家庭住址</label>
    <div class="layui-input-block">
      <input type="text" value="" name="address" id = "address"   class="layui-input" style="width: 500px;">
    </div>
  </div>
 
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" id="change_button" name="change_button" type="button" >保存用户</button>
    
    </div>
  </div>
</form>
  <script type="text/javascript">
  $("#change_button").click(function(){
  layer = layui.layer;
  if($("#idnumber").val()==""){
  	layer.msg("身份证号不得为空");
  	return false;
  }
  if($("#idnumber").val().length<11){
  	layer.msg("身份证号不合法");
  	return false;
  }
     $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/user/addUser.do" ,//url
                data: $("#form1").serialize(),
                success: function (result) {
                
                layer.confirm(result.message,{ offset: '100px',skin: 'layui-layer-molv'},function(){
                window.location.href = "${pageContext.request.contextPath}/user/toUserManage.do";
                });
                
                   
                },
                error : function(result) {
                 layer = layui.layer;
                 layer.msg("系统异常");
                  
                }
            });
  
  });
       
    </script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
   <script>
//表单初始赋值
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  }); 
 </script>
<script>
 layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
  
  //普通图片上传
   var uploadInst = upload.render({
    elem: '#test1'
    ,url: '${pageContext.request.contextPath}/user/uploadHeadImage.do?id=${user.id}'
    ,before: function(obj){
      //预读本地文件示例，不支持ie8
      obj.preview(function(index, file, result){
        $('#demo1').attr('src', result); //图片链接（base64）
      });
    }
    ,done: function(res){
      //如果上传失败
      if(res.code > 0){
        return layer.msg('上传失败');
      }
      //上传成功
    }
    ,error: function(){
      //演示失败状态，并实现重传
      var demoText = $('#demoText');
      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
      demoText.find('.demo-reload').on('click', function(){
        uploadInst.upload();
      });
    }
  }); 
  }); 
  </script>
</body>
</html>
