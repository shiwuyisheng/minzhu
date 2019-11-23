<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0055)http://demo1.mycodes.net/houtai/jiandanlogin/login.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta content="IE=11.0000" http-equiv="X-UA-Compatible">
 
 
<title>登录页面</title> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
  <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

<script type="text/javascript" async="" src="${pageContext.request.contextPath}/js/auto_dup"></script>
<script type="text/javascript" async="" src="${pageContext.request.contextPath}/js/bottomSearchBar.js.下载">
</script><script src="${pageContext.request.contextPath}/js/hm.js.下载"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js.下载" type="text/javascript"></script>
 
<style>
body{
	background: #ebebeb;
	font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",Arial,sans-serif;
	color: #222;
	font-size: 12px;
	height:600px;
}
a:hover{
	color:blue;
}
*{padding: 0px;margin: 0px;}
.top_div{

	background: #009688;/* #008ead; */
	width: 100%;
	height: 10%;/* 300px; */
}
/* .ipt{
	border: 1px solid #d3d3d3;
	padding: 10px 10px;
	width: 290px;
	border-radius: 4px;
	padding-left: 35px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	-webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
	transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
}
.ipt:focus{
	border-color: #66afe9;
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
	box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
}
.u_logo{
	background: url("${pageContext.request.contextPath}/images/login/username.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 43px;
	left: 40px;

}
.p_logo{
	background: url("${pageContext.request.contextPath}/images/login/password.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 12px;
	left: 40px;
}
a{
	text-decoration: none;
	color:blue;
}
a:hover{
	color:red;
}
.tou{
	background: url("${pageContext.request.contextPath}/images/login/tou.png") no-repeat;
	width: 97px;
	height: 92px;
	position: absolute;
	top: -87px;
	left: 140px;
}
.left_hand{
	background: url("${pageContext.request.contextPath}/images/login/left_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	left: 150px;
}
.right_hand{
	background: url("${pageContext.request.contextPath}/images/login/right_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	right: -64px;
}
.initial_left_hand{
	background: url("${pageContext.request.contextPath}/images/login/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	left: 100px;
}
.initial_right_hand{
	background: url("${pageContext.request.contextPath}/images/login/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	right: -112px;
}
.left_handing{
	background: url("${pageContext.request.contextPath}/images/login/left-handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -24px;
	left: 139px;
}
.right_handinging{
	background: url("${pageContext.request.contextPath}/images/login/right_handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -21px;
	left: 210px;
}
 */
</style>
     
<script type="text/javascript">
$(function(){
	//得到焦点
	$("#password").focus(function(){
		$("#left_hand").animate({
			left: "150",
			top: " -38"
		},{step: function(){
			if(parseInt($("#left_hand").css("left"))>140){
				$("#left_hand").attr("class","left_hand");
			}
		}}, 2000);
		$("#right_hand").animate({
			right: "-64",
			top: "-38px"
		},{step: function(){
			if(parseInt($("#right_hand").css("right"))> -70){
				$("#right_hand").attr("class","right_hand");
			}
		}}, 2000);
	});
	//失去焦点
	$("#password").blur(function(){
		$("#left_hand").attr("class","initial_left_hand");
		$("#left_hand").attr("style","left:100px;top:-12px;");
		$("#right_hand").attr("class","initial_right_hand");
		$("#right_hand").attr("style","right:-112px;top:-12px");
	});
});
</script>
 
<body>
<div class="top_div" style="color:#fff;font-size:18px;"><center><label >
<br/>
农村民主建设管理系统登录入口</label></center></div>
<!-- 电脑端 -->
 <center>
<div style=" margin:0;auto; position:relative;
            width:400px;
            height:60%;" id="content">
           <br>
           <br/> <br/>
<form class="layui-form" action="" name="form1" id="form1">
<div class="layui-form-item">
 <label class="layui-form-label" style="width:50px; text-align: right;margin-right:4px;padding-right:4px;">
 <i class="layui-icon layui-icon-username" style="font-size: 20px; color: black;"></i> 
 </label>
 <div class="layui-input-inline" style="width:250px; padding-bottom:5px">
 <input  type="text" name="idnumber" id= "idnumber" style="width:280px; "  
 
 placeholder="请输入身份证号" class="layui-input" value=""> 
    </div>
    <div class="layui-form-item" style="margin-bottom: 0;padding-bottom:0;">
      <label class="layui-form-label"  style="width:50px; text-align: right;margin-right:4px;padding-right:4px;">
 	<i class="layui-icon layui-icon-password" style="font-size: 20px; color: #black;"></i>

 </label>
    
     <div class="layui-input-inline"  style="width:250px;"  >  
   
<input  id="password" name="password"style="width:280px;"  type="password" placeholder="请输入密码" value="" class="layui-input">
  </div> </div>
  
   <div class="layui-form-item" style="margin-bottom: 0;padding-bottom:0;">
   
    <div class="layui-input-block" style="text-align: left;margin-bottom: 0;padding-bottom:0;margin-left:0;" >
      &nbsp;  &nbsp;  &nbsp;&nbsp;  &nbsp;  &nbsp;  &nbsp;
       &nbsp;  &nbsp;  &nbsp;&nbsp;  <input type="radio" name="level" id = "level" value="0" title="普通用户" checked>
      &nbsp;  &nbsp;  &nbsp;  &nbsp;&nbsp;   &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;
      <input type="radio" name="level" id = "level" value="1" title="管理员" >
    </div>
  </div>
    <center><div id="captcha"></div>
  <div id="msg"></div></center>
 <br/>

             <button class="layui-btn" id="bt-login" style="width:60%;" lay-submit="" lay-filter="demo1" type="button">登录</button>
 <br/>
  <a  id="forget"  name="forget" herf="javascript:void(0);" style="     cursor:pointer ;">忘记密码?</a>

<a  href="${pageContext.request.contextPath}/index.do" target="_top">

&nbsp;&nbsp;&nbsp;&nbsp;返回首页</a> 
           
      

</form>

</div></center>
<%-- <div style="background: rgb(255, 255, 255); margin: -300px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 510px; text-align: center;">
<div style="width: 165px; height: 196px; position: absolute;">
<div class="tou"></div>
<div class="initial_left_hand" id="left_hand" style="left:100px;top:-12px;"></div>
<div class="initial_right_hand" id="right_hand" style="right:-112px;top:-12px"></div></div>
<p style="padding: 30px 0px 10px; position: relative;"><span class="u_logo"></span>  
<form class="layui-form" action="" name="form1" id="form1">

       <input class="ipt" type="text" name="idnumber" id= "idnumber"  placeholder="请输入用户名或邮箱" value=""> 
    </p>
<p style="position: relative;"><span class="p_logo"></span>         
<input class="ipt" id="password" name="password" type="password" placeholder="请输入密码" value="">   
  </p> 
   <div class="layui-form-item">
   
    <div class="layui-input-inline"  style="width: 300px;" >
      <input type="radio" name="level" id = "level" value="0" title="普通用户">
      <input type="radio" name="level" id = "level" value="1" title="管理员" checked>
    </div>
  </div>
    <div id="captcha"></div>
  <div id="msg"></div>

<div style="height: 50px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">

<p style="margin: 0px 35px 20px 45px;"><span style="float: left;">

<a  id="forget"  name="forget" herf="javascript:void(0);" >忘记密码?</a>
</span> 
 <span style="float: left;"><a  href="${pageContext.request.contextPath}/index.do" target="_top">&nbsp;&nbsp;&nbsp;&nbsp;返回首页</a></span> 
           
             <!--  <a style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;" href="">登录</a>  -->
        <button class="layui-btn" id="bt-login" lay-submit="" lay-filter="demo1" type="button">登录</button>
  
        
           </span>         </p>
           
           
           </div>
		<form/>  
</center>
</div></div></div>

<div class="layui-row">
    <div class="layui-col-xs6 layui-col-sm6 layui-col-md12  layui-show-sm layui-hide-md">
    5555
</div></div> --%>
<script>
if (!window.jigsaw) {
  document.write('<script src="${pageContext.request.contextPath}/js/jigsaw.min.js"><\/script>')
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
   
   <script type="text/javascript">
   if ((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i))) {
   /* alert('手机端');
   $("#content").attr("style","margin:0;auto; position:relative;   width:800px;\
            height:80%;"); */
   
}
   
   </script>
   
 <script type="text/javascript">
 	layui.use(['form', 'layedit'], function(){
  var form = layui.form
  ,layer = layui.layer
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  
  
});


 $("#idnumber").blur(function(){
        var data = $("#idnumber").val();
        if (data == null || data == "") {
            $("#msg").text("用户名不能为空！");
            $("#msg").css("color","red");
            return false;
        }
        $("#msg").text("");
        
         $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/user/checkLoginUsername.do",
            data:{"idnumber":data},
            beforeSend:function(XMLHttpRequest)
            {
                $("#msg").text("正在查询");
	 			$("#msg").css("color","red");
            },
            success:function(data) /*msg*/
             {
            	//$("#showResult").text(data.message); 
            	var msg = data.message;
                if(msg ==="yes"){
                    $("#msg").text("该用户名可以被使用");
                }else if(msg === 'no'){
                    $("#msg").text("该用户名不存在");
                    $("#msg").css("color","red");
                }else {
                    $("#msg").text("系统异常！");
                    $("#msg").css("color","red");
                }
            },
            error:function()
            {
                $("#msg").text("系统异常！");//错误处理
            }
        }); 
    });

 
    $("#bt-login").click(function(){
   
        var data = $("#idnumber").val();
        if (data == null || data == "") {
         
            $("#msg").text("用户名不能为空！");
            $("#msg").css("color","red");
            return false;
        }
        var data = $("#password").val();
        if (data == null || data == "") {
            $("#msg").text("密码不能为空！");
            $("#msg").css("color","red");
            return false;
        }
        if(flag != 1){
         $("#msg").text("请验证图片！");
            $("#msg").css("color","red");
            return false;
        }
        //异步提交请求，进行验证
        $.ajax({
    	   "url":"${pageContext.request.contextPath}/user/login.do",
    	   "data":$("#form1").serialize(),//"idnumber="+$("#idnumber").val()+"&password="+$("#password").val()+"level="+$("#level").val(),
    	   "type":"POST",
    	   "dataType":"json",
    	   "success":function(obj){
   
    		   if(obj.state==1){
    			   
    			   location.href="${pageContext.request.contextPath}/user/tomain.do";
    		   }else if(obj.state==2){
    			   
    			   location.href="${pageContext.request.contextPath}/user/toadminmain.do";
    		   }else{ 
    		    $("#msg").text(obj.message);
    		flag=0
    		   }
    	   }
       }); 
    });
</script>
 
   
<script>
$("#forget").click(function(){
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,laydate = layui.laydate;
  
  
});


//iframe层


layer.open({
  type: 2,
  title: '重置密码',
  shadeClose: true,
  shade: 0.8,
  area: ['460px', '640px'],
  content: '${pageContext.request.contextPath}/user/toFindPassword.do' //iframe的url



});});

</script>
      
   
   
</body></html>