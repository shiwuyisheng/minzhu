<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
  民主建设
</title>
<link rel="stylesheet" href="../layui/css/layui.css"  media="all">
 <script src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

<script>
layui.use(['form'], function(){
  var form = layui.form
  ,layer = layui.layer
 
  
  
  
  //创建一个编辑器
  
 
  //自定义验证规则
 /*  form.verify({
    
    pass: [
      /^[\S]{6,12}$/
      ,'密码必须6到12位，且不能出现空格'
    ]
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
   */
  
  
 
  
});
</script>

</head>
<body>
    
  <form class="layui-form" action="" id="form1" lay-filter="example">
  
  <div class="layui-form-item">
    <label class="layui-form-label">原始密码</label>
    <div class="layui-input-inline">
      <input type="password" name="oldpassword" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>
  
   <div class="layui-form-item">
    <label class="layui-form-label" >新密码</label>
    <div class="layui-input-inline">
      <input type="password" name="newpassword" id="newpassword" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">确认密码</label>
    <div class="layui-input-inline">
      <input type="password" name="checkpassword" id="checkpassword"placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" id="button" name="button" type="button" >修改密码</button>
    </div>
  </div>
</form> 
<script>
$("#button").click(function(){
 layer = layui.layer;
 if($("#newpassword").val() == "" || $("#checkpassword").val() == "")
 {layer.msg("请将信息填写完整");return false;}
if($("#newpassword").val()!=($("#checkpassword").val()))
	{
	
	layer.msg("新密码与确认密码不一致");
	return false;}
$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/user/changepassword.do" ,//url
                data: $("#form1").serialize(),
                dataType:"json",
                success: function (result) {
              
               layer.confirm(result.message,{ offset: '100px',skin: 'layui-layer-molv'},function(){
               parent.location.href = "${pageContext.request.contextPath}/index.do";
               })
               // alert();
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
</body>
</html>
