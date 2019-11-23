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
 
  
});
</script>

</head>
<body>
    <br/><br/>
  <form class="layui-form" action="" id="form1" lay-filter="example">
   <div id="captcha"></div>
<center> <div id="msg"></div></center>
<br/><br/>
  <div class="layui-form-item">
    <label class="layui-form-label">绑定手机号</label>
    <div class="layui-input-inline">
      <input type="text" name="phone" id="phone" placeholder="请输入手机号" autocomplete="off" class="layui-input">
     </div>
     <style>
     .yanzheng{
     color:green;fonts-size:20px;
    
     }
     .yanzheng a:hover{
     color:blue;
     
     }
     </style><div class="yanzheng"  id="yanzheng" name="yanzheng" type="button" >
     
     <label id="m" style="cursor:pointer ; a:hover{color:blue}">获得验证码</label></div>
    
   
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label" >输入验证码</label>
    <div class="layui-input-inline">
      <input type="text" name="code" id="code" placeholder="输入验证码" autocomplete="off" class="layui-input">
    </div>
  
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" id="button" name="button" type="button" >绑定手机</button>
    </div>
  </div>
 
   
    
  
</form> 
<script>
$("#button").click(function(){
 layer = layui.layer;
 if($("#phone").val() == "" || $("#phone").val() == "")
 {layer.msg("请将信息填写完整");return false;}

$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/user/bangdingshouji.do" ,//url
                data: $("#form1").serialize(),
                dataType:"json",
                success: function (result) {
              if(result.state == 200){
               layer.confirm(result.message,{ offset: '100px',skin: 'layui-layer-molv'},function(){
               parent.location.href = "${pageContext.request.contextPath}/user/showUserInfo.do";
               });}else{
               layer.msg("验证码错误，请重新输入");
               }
               
                },
                error : function() {
                    alert("异常！");
                }
            });

});
$("#yanzheng").click(function(){
var reg=/^1\d{10}$/;
if(!reg.test($("#phone").val())){
     layer.msg('手机不合法，请重新录入！',{icon: 5});
     return false;
}

if(flag != 1){
layer.msg("请验证图片");
return false;
}
if(document.getElementById('m').innerHTML!="获得验证码"){
layer.msg("请稍后");
layer.msg($("#m").val());
return false;
}

$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/user/getCode.do?phone="+ $("#phone").val(),//url
                dataType:"json",
                success: function (result) {
                if(result.state == 200){
              var time = 60;//s
    var start = window.setInterval(function(){
        time = time - 1;
       
        document.getElementById('m').innerHTML='验证码已发送，'+time+'秒后可重新获取验证码!';
        if(time == 0){
            window.clearInterval(start);
            document.getElementById('m').innerHTML='获得验证码';
        }
    },1000);
              }else{
              layer.msg(result.message,function(){
               
               document.getElementById('m').innerHTML='获得验证码';
              });
              
              }
              
               
                },
                error : function() {
                   layer.msg("异常！");
                }
            });


});



</script>

<script>
if (!window.jigsaw) {
  document.write('<script src="../js/jigsaw.min.js"><\/script>')
}
</script>
<script>
flag=0;
  jigsaw.init({
    el: document.getElementById('captcha'),
    onSuccess: function() {
      document.getElementById('msg').innerHTML = '验证成功！'
      flag=1;
    },
    onFail: cleanMsg,
    onRefresh: cleanMsg
  })
  function cleanMsg() {
    document.getElementById('msg').innerHTML = ''
  }
</script>
   
</body>
</html>
