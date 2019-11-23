<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.bjjs.gov.cn/bjjs/index/index.shtml -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link href="./北京市住房和城乡建设委员会门户网站_files/default.css" rel="stylesheet" id="lhgdialoglink">
  <title>北京市住房和城乡建设委员会门户网站</title>
<meta name="createDate" content="2018-12-19 17:30:10">
<meta name="cacheclearDate" content="2018-11-30 17:40:45">
<meta name="version" content="7.9.7">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="北京市住房和城乡建设委员会,市住房城乡建设委,北京市建设委员会,市建委,北京建设网">
<meta name="description" content="北京建委默认频道 北京市住房和城乡建设委员会门户网站简称北京建设网建于2001年，是北京市住房和城乡建设委员会向公众提供信息和服务的综合平台。">


<link rel="stylesheet" href="./layui/css/layui.css"  media="all">


<script src="./js/jquery-1.4.2.min.js" charset="utf-8"></script>

<script src="./layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
      var InterValObj; //timer变量，控制时间
      var count = 60; //间隔函数，1秒执行
      var curCount;//当前剩余秒数
      //发送短信验证码
      function sendMessage() {
      //对手机号进行验证
      var cellphone = $('#cellphone').val();
      if(!/^1\d{10}$/.test(cellphone)){
        alert("请输入正确的手机号");
        return false;
      }
      curCount = count;
      // 设置button效果，开始计时
      document.getElementById("btnSendCode").setAttribute("disabled","true" );//设置按钮为禁用状态
      document.getElementById("btnSendCode").value=curCount + "秒后重获";//更改按钮文字
      InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器timer处理函数，1秒执行一次
      // 向后台发送处理数据,请求后台发送验证短信
      $.ajax({
        type: "POST", // 用POST方式传输
        dataType: "text", // 数据格式:JSON
        url: "", // 目标地址
        data: "flag=2",
        success: function (data){ 
          data = parseInt(data, 10);
          if(data == 1){
            $("#jbPhoneTip").html("<font color='#339933'>√ 短信验证码已发到您的手机，请查收</font>");
              }else if(data == 0){
            $("#jbPhoneTip").html("<font color='red'>× 短信验证码发送失败，请重新发送</font>");
          }
        }
      });
      }
      
      //timer处理函数
      function SetRemainTime() {
        if (curCount == 0) {//超时重新获取验证码                
          window.clearInterval(InterValObj);// 停止计时器
          document.getElementById("btnSendCode").removeAttribute("disabled");//移除禁用状态改为可用
          document.getElementById("btnSendCode").value="重获验证码";
        }else {
          curCount--;
          document.getElementById("btnSendCode").value=curCount + "秒后重获";
        }
      }
      
      //提交验证短信验证码
      function doCompare(){
        var codelast = document.getElementById("codelast").value;//获取输入的验证码
        /*提交表单，将手机和验证码发送到后台验证的时候，需要判断手机号和验证码不为空，
         *这里layui使用了lay-verify="required"
         *不使用layui时要自行判断*/
        
        //发送到后台判断验证码是否正确
        $.ajax({
          type: "POST", // 用POST方式传输
          dataType: "text", // 数据格式:JSON
          url: "", // 目标地址
          data: "flag=4&codelast="+codelast,
          success: function (data){ 
            data = parseInt(data, 10);
            if(data == 1){
                window.location.href='/aoyi/forgetpasswd/forgetpasswd3.jsp';//验证成功
                  }else if(data == 0){
              $("#jbPhoneTip").html("<font color='red'>×短信验证码不正确请重新输入</font>");
            }else if(data ==2){
              $("#jbPhoneTip").html("<font color='red'>×验证码已失效请重新获取验证码</font>");
            }
          }
        });
      }
    </script>
  
   
    <form class="layui-form" action="">
      <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-inline">
          <input type="text" name="cellphone" id="cellphone" lay-verify="required|phone" placeholder="请输入手机号" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <div class="layui-inline">
          <label class="layui-form-label">短信验证码</label>
          <div class="layui-input-inline">
            <input type="text" name="codelast" id="codelast" lay-verify="required" placeholder="请输入短信验证码" class="layui-input"/>
          </div>
          <div class="layui-input-inline">
            <input id="btnSendCode" style="width: 120px;height: 39px;text-align: center;background-color: white;border: 1px solid #E2E2E2;" name="btnSendCode" type="button"   value="获取验证码" onclick="sendMessage();" />
          </div>
        </div>
      </div>
 
      <div class="layui-form-item">
        <span id="jbPhoneTip" ></span>
      </div>
      <div class="layui-form-item">
        <div class="layui-input-block">
          <button class="layui-btn"  lay-submit lay-filter="" onClick="doCompare();">提交</button>
        </div>
      </div>
    </form>
    
   
   <!--  <script type="text/javascript" src="../../js/jquery-1.8.3.js" ></script>
    <script> -->
      <!-- layui.use(['form','layer'],function(){
        var form = layui.form,
        layer = layui.layer;
  
      });
    </script> -->
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer;
  
  
  
 
  //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return false;
  });
 
  
  
});
</script>


<center>
  <div style="width: 800px">
  <div class="layui-form">
    <label>注：投信必须填写手机号，否则将无法投递</label>
  <table class="layui-table" >
    <colgroup>
      <col width="150px">
     
      <col width="200px">
      <col>
    </colgroup>
    <tbody>
      <tr width= "100px">
        <td>寄信人信息</td>
        <td>

<div class="layui-input-inline">
      <label>身份</label><input type="text" name="title" lay-verify="title" autocomplete="off" class="layui-input" style="width: 300px;">
    </div>
        </td>
        
      </tr>
      <tr width= "100px">
        <td>信息主题</td>
        <td>

<div class="layui-input-inline">
      <input type="text" name="title" lay-verify="title" autocomplete="off" class="layui-input" style="width: 300px;">
    </div>
        </td>
        
      </tr>
      <tr>
        <td>信息类型</td>
        <td>
           <div class="layui-input-inline">
        <select name="quiz" >
          <option value="8">请选择类型</option>
       
            <option value="0">意见</option>
            <option value="1">提问</option>
            <option value="2">投诉</option>
          
        </select>
     </div>
        </td>
        
      </tr>
      <tr>
        <td><label class="layui-form-label">内容</label></td>
        <td><div class="layui-form-item layui-form-text">
    
    <div class="layui-input-inline">
      <textarea  rows = "20"  cols="70" placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>
  </td>
        
      </tr>
      
     <tr> <td colspan="2" align="center">
       <div class="layui-form-item">
    <button class="layui-btn layui-bg-blue" lay-submit="" lay-filter="demo2">投信</button>
  </div>


     </td></tr>
    </tbody>
  </table>
</div></div>

</center>
         
</body></html>