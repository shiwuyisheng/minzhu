<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
    
</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/global.css"  media="all">
    

    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>



  <style>
       .test{
    width:100%;
    height: 100%;
    overflow: auto;
    float: left;
    margin: 5px;
    border: none;
}
.scrollbar{
    width: 0px;
    height: 300px;
    margin: 0 auto;
 
}
.test-1::-webkit-scrollbar {/*滚动条整体样式*/
        width: 0px;     /*高宽分别对应横竖滚动条的尺寸*/
        height: 1px;
    }
.test-1::-webkit-scrollbar-thumb {/*滚动条里面小方块*/
        border-radius: 10px;
         -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
        background: #535353;
    }
.test-1::-webkit-scrollbar-track {/*滚动条里面轨道*/
        -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
        border-radius: 10px;
        background: #EDEDED;
    }
        
        </style>
</head>
<body style="margin:auto" class="test test-1">
<style>
a{color:#009688;
font-size:20px;

}
a:hover{color:blue}
</style>
<a onclick="javascript:history.go(-1);" ><i class="layui-icon layui-icon-return" style="font-size: 30px; color: #009688;"></i> <!-- 返回 --></a>
    <form class="layui-form" id ="form1" name="form1" lay-filter="form1">
     <input  type="hidden" value="${user.id}" name="id" id="id" placeholder="" class="layui-input" style="width: 300px;">
   
<div class="layui-upload">
  
  <div class="layui-upload-list">
  <div class="layui-form-item">
    <div class="layui-input-block">
    <img  id="demo1" class="layui-upload-img" style="width:350px;height: auto;max-height: 10em;min-height: 2em;max-width: 7em; min-width:3em ;overflow:hidden; "  src="${pageContext.request.contextPath}/${user.image}" />
    <p id="demoText"></p> <button type="button" class="layui-btn" id="test1">修改头像</button>
  </div></div>
  </div>
 
</div>  
  <div class="layui-form-item">
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-block">
      <input type="text" name="username" value="${user.username}" id ="username"  placeholder="用户名" class="layui-input" style="width: 150px;">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">身份证号</label>
    <div class="layui-input-block">
      <input type="text" value="${user.idnumber}" name="idnumber" id="idnumber" placeholder="" class="layui-input" style="width: 300px;">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">年龄</label>
    <div class="layui-input-inline">
      <input type="text" name="age" value="${user.age}" id ="age"  placeholder="年龄" class="layui-input" style="width: 150px;">
    </div>
     <label class="layui-form-label">性别</label>
    <div class="layui-input-inline">
      <input type="radio" name="sex" id ="sex"value="0" title="男" checked="">
      <input type="radio" name="sex" id = "sex" value="1" title="女">
      
    </div>
  </div>
  <!-- <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-inline">
      <input type="radio" name="sex" id ="sex"value="0" title="男" checked="">
      <input type="radio" name="sex" id = "sex" value="1" title="女">
      
    </div>
  </div> -->
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">政治面貌</label>
      <div class="layui-input-inline" style="width:100px;">
        <select name="face" id="face"  >
          <option value="-1">选择</option>
   <!--       <optgroup label="党员">--->
            <option value="0" id="0" >群众</option>
            <option value="1" id="1" >党员</option>
            <option value="2" id="2">预备党员</option>
           <option value="3" id="3">团员</option>
        </select>
      </div>
      <label class="layui-form-label">学历</label>
    <div class="layui-input-inline">
      <input type="text" value="${user.education}" name="education"  placeholder="性别" class="layui-input" style="width: 100px;">
    </div>
    <label class="layui-form-label">村内职务</label>
    <div class="layui-input-inline">
      <input type="text" value="${user.post}" id = "post"name="post"  class="layui-input" style="width: 100px;">
    </div>
    </div>
    <script>
     $("#${user.face}").selected="selected";
   $("input[name=sex][value='0']").attr("checked", ${user.sex} == 0 ? true : false);
$("input[name=sex][value='1']").attr("checked", ${user.sex} == 1 ? true : false);
    </script>
 <%--  <div class="layui-form-item">
    <label class="layui-form-label">学历</label>
    <div class="layui-input-inline">
      <input type="text" value="${user.education}" name="education"  placeholder="性别" class="layui-input" style="width: 100px;">
    </div>
  </div> --%>
 <%--  <div class="layui-form-item">
    <label class="layui-form-label">村内职务</label>
    <div class="layui-input-inline">
      <input type="text" value="${user.post}" id = "post"name="post"  class="layui-input" style="width: 100px;">
    </div>
  </div> --%>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">联系电话</label>
      <div class="layui-input-inline">
        <input type="tel" name="phone" id = "phone"value="${user.phone}" lay-verify="required|phone" readonly autocomplete="off" class="layui-input">
      </div>
      <style>
      .bangding{
      color:red; 
      font-size:16px; 
     
      }
      .bangding:hover{
      color:blue;
      
      }
      </style>
      <div class="layui-input-inline">
      <!-- <label class="bangding" id="bangding">绑定手机号后可便于联系和忘记密码服务</label> -->
<button class="layui-btn" id="phonebt" type="button">绑定手机号</button>
      </div>
      
    </div>
  <div class="layui-form-item">
    <label class="layui-form-label">家庭住址</label>
    <div class="layui-input-block">
      <input type="text" value="${user.address}" name="address" id = "address"   class="layui-input" style="width: 500px;">
    </div>
  </div>
 
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" id="change_button" name="change_button" type="button" >修改</button>
     <!--  <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
    </div>
  </div>
</form>
  <script type="text/javascript">
  $("#change_button").click(function(){
 
  
  $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/user/changeUserInfo.do" ,//url
                data: $("#form1").serialize(),
                success: function (result) {
                layer = layui.layer;
                layer.confirm("修改成功",{ offset: '100px',skin: 'layui-layer-molv'},function(){
                window.location.href = location.href;
                });
                
                  
                },
                error : function() {
                    alert("异常！");
                }
            });
  
  });
      $("#bangding").click(function(){
  $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/user/changeUserInfo.do" ,//url
                data: $("#form1").serialize(),
                success: function (result) {
                layer = layui.layer;
                layer.confirm("修改成功",{ offset: '100px',skin: 'layui-layer-molv'},function(){
                window.location.href = location.href;
                });
                
                   // console.log(result);//打印服务端返回的数据(调试用)
                    //if (result.resultCode == 200) {
                       // alert("SUCCESS");
                   // }
                    //;
                },
                error : function() {
                    alert("异常！");
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
  var sex =${user.sex};
  var face = ${user.face};
  form.val('form1', {
    
    "face": face
   
    //,"sex": sex
    
  })
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
 <script>
$("#phonebt").click(function(){
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,laydate = layui.laydate;
  
  
});


//iframe层


layer.open({
  type: 2,
  title: '绑定手机号',
  shadeClose: true,
  shade: 0.8,
  area: ['460px', '465px'],
  content: '${pageContext.request.contextPath}/user/updatePhone.do' //iframe的url



});

});

</script>
  
  
</body>
</html>
