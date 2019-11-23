<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.bjjs.gov.cn/bjjs/index/index.shtml -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link href="./北京市住房和城乡建设委员会门户网站_files/default.css" rel="stylesheet" id="lhgdialoglink">
  <title>农村民主建设信息管理网站</title>
<meta name="createDate" content="2018-12-19 17:30:10">
<meta name="cacheclearDate" content="2018-11-30 17:40:45">
<meta name="version" content="7.9.7">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="北京市住房和城乡建设委员会,市住房城乡建设委,北京市建设委员会,市建委,北京建设网">
<meta name="description" content="北京建委默认频道 北京市住房和城乡建设委员会门户网站简称北京建设网建于2001年，是北京市住房和城乡建设委员会向公众提供信息和服务的综合平台。">


<link rel="stylesheet" href="../layui/css/layui.css"  media="all">



<script src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

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
 
  //表单初始赋值
  form.val('example', {
    "username": "贤心" // "name": "value"
    ,"password": "123456"
    ,"interest": 1
    ,"like[write]": true //复选框选中状态
    ,"close": true //开关状态
    ,"sex": "女"
    ,"desc": "我爱 layui"
  })
  
  
});
</script>

 </head>
 <body margin="0">

  <div style="width: 800px">
  <div class="layui-form">
  <table class="layui-table" >
    <colgroup>
      <col width="150px">
     
      <col width="200px">
      <col>
    </colgroup>
    <tbody>
      <tr width= "100px">
        <td>问题<br/>
<div class="layui-input-block">
      <input type="radio" name="sex" value="张三" title="张三" ></br>
      <input type="radio" name="sex" value="李四" title="李四">
     
    </div>
            



        </td>
       
        
      <tr>
        
        <td>

<div class="layui-input-block">
     
     
    </div>



  </td>
        
      </tr>
      
     <tr> <td c align="center">
       <div class="layui-form-item">
    <button class="layui-btn layui-bg-blue" lay-submit="" lay-filter="demo2">提交问卷</button>
  </div>


     </td></tr>
    </tbody>
  </table>
</div></div>


         
</body></html>