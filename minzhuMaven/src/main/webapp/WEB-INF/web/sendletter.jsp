<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.bjjs.gov.cn/bjjs/index/index.shtml -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link href="./北京市住房和城乡建设委员会门户网站_files/default.css" rel="stylesheet" id="lhgdialoglink">
  <title>农村民主</title>
<meta name="createDate" content="2018-12-19 17:30:10">
<meta name="cacheclearDate" content="2018-11-30 17:40:45">
<meta name="version" content="7.9.7">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/letter.css"  media="all">


<script src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>


<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
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
 
  if($("#content").val() == null){
  alert("内容不能为空");
  return false;}
  
    return false;
  });
  
});
</script><!-- 
<style>
.smart-green {
/* margin-left:auto;
margin-right:auto; */
max-width: 500px;
background: #F8F8F8;
padding: 30px 30px 20px 30px;
font: 12px Arial, Helvetica, sans-serif;
color: #666;
border-radius: 5px;
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
}
.smart-green h1 {
font: 24px "Trebuchet MS", Arial, Helvetica, sans-serif;
padding: 20px 0px 20px 40px;
display: block;
margin: -30px -30px 10px -30px;
color: #FFF;
background: #009688;
text-shadow: 1px 1px 1px #949494;
border-radius: 5px 5px 0px 0px;
-webkit-border-radius: 5px 5px 0px 0px;
-moz-border-radius: 5px 5px 0px 0px;
border-bottom:1px solid #89AF4C;

}
.smart-green h1>span {
display: block;
font-size: 11px;
color: #FFF;
}

.smart-green label {
display: block;
margin: 0px 0px 5px;
}
.smart-green label>span {
float: left;
margin-top: 10px;
color: #5E5E5E;
}
.smart-green input[type="text"], .smart-green input[type="email"], .smart-green textarea, .smart-green select {
color: #555;
height: 50px;
line-height:15px;
width: 100%;
padding: 0px 0px 0px 10px;
margin-top: 2px;
border: 1px solid #E5E5E5;
background: #FBFBFB;
outline: 0;
-webkit-box-shadow: inset 1px 1px 2px rgba(238, 238, 238, 0.2);
box-shadow: inset 1px 1px 2px rgba(238, 238, 238, 0.2);
font: normal 18px/18px Arial, Helvetica, sans-serif;
}
.smart-green textarea{
height:150px;
padding-top: 10px;
}
.smart-green select {
background: url('down-arrow.png') no-repeat right, -moz-linear-gradient(top, #FBFBFB 0%, #E9E9E9 100%);
background: url('down-arrow.png') no-repeat right, -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FBFBFB), color-stop(100%,#E9E9E9));
appearance:none;
-webkit-appearance:none;
-moz-appearance: none;
text-indent: 0.01px;
text-overflow: '';
width:100%;
height:30px;
}
.smart-green .button {
background-color: #009688;
border-radius: 5px;
-webkit-border-radius: 5px;
-moz-border-border-radius: 5px;
border: none;
padding: 10px 25px 10px 25px;
color: #FFF;
text-shadow: 1px 1px 1px #949494;
}
.smart-green .button:hover {
background-color:#80A24A;
}
</style> -->
 </head>
 <body margin="0">
 <div class="smart-green">
<form action="" method="post" class="STYLE-NAME"  name="form1" id="form1">
<h1>向村委会发送信件
<span></span>
</h1>
<label>
<span>信息主题 :</span>
<!-- <input id="name" type="text" name="name" placeholder="Your Full Name" /> -->
<input type="text" name="title"  style="width: 10em;">
    
</label>
<label>
<span>信息类型 :</span><!-- <select name="selection">
<option value="Job Inquiry">Job Inquiry</option>
<option value="General Question">General Question</option>
</select> -->
 <select name="status" id= "status" >
         
       
            <option value="3">意见</option>
    
         
            <option value="1">提问</option>
            <option value="2">投诉</option>
          
        </select>
</label>
<label>
<span>匿名:
<input type="checkbox" style="zoom:150%"name="niming" value="1" id = "niming"title="匿名">
</span>
</label>
  <br/><br/>


<label>
<span>内容 :</span>
<!-- <textarea id="message" name="message" placeholder="Your Message to Us"></textarea> -->
<textarea   id="content" name="content" placeholder="请输入内容" class="layui-textarea"></textarea>
    
</label>

<label>
<span>&nbsp;</span>
<input type="button" class="button" value="发送信件" id="bt" name= "bt" />
</label>
</form></div>
<!-- <center>

  <div style="width: 600px">
  <div class="layui-form">
  <table class="layui-table" >
    <colgroup>
      <col min-width="0.5em" max-width="0.5em">
     
      <col min-width="50em" max-width="50em">
      <col>
    </colgroup>
    <tbody>
      <tr width= "1em ">
        <td>信息主题</td>
        <td>
<form id="form" name="form" method="post">

      <input type="text" name="title"  autocomplete="off" class="layui-input" style="width: 10em;">
    
        </td>
        
      </tr>
      <tr>
        <td>信息类型</td>
        <td>
           <div class="layui-input-inline">
        <select name="status" id= "status" >
         
       
            <option value="3">意见</option>
    
         
            <option value="1">提问</option>
            <option value="2">投诉</option>
          
        </select>
        <input type="checkbox" name="niming" value="1" id = "niming"title="匿名">
   
     
   
     </div>
        </td>
        
      </tr>
      <tr>
        <td>文本域</td>
        <td>
      <textarea  rows = "15"  cols="60" id="content" name="content" placeholder="请输入内容" class="layui-textarea"></textarea>
    
  </td>
        
      </tr>
      <tr>
      <div class="layui-upload">
  <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button> 
  <div class="layui-upload-list">
    <table class="layui-table">
      <thead>
        <tr><th>文件名</th>
        <th>大小</th>
        <th>状态</th>
        <th>操作</th>
      </tr></thead>
      <tbody id="demoList"></tbody>
    </table>
  </div>
  <button type="button" class="layui-btn" id="testListAction">开始上传</button>
</div> 
      </tr>
     <tr> <td colspan="2" align="center">
       <div class="layui-form-item">
    <button class="layui-btn " lay-submit="" id="bt" name= "bt"lay-filter="demo1">发信</button>
  </div> -->
<script>
$("#bt").click(function(){
 
  $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/letterbox/sendletter.do" ,//url
                data: $("#form1").serialize(),
                success: function (result) {
                // alert(result.message);
                layer = layui.layer;
                 layer.confirm(result.message,{ offset: '100px',skin: 'layui-layer-molv'},function(){
                 window.location.href = "${pageContext.request.contextPath}/letterbox/toletterbox.do";
                 
                 });
               // alert(result.message);
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

   <!--   </td></tr>
    </tbody>
  </table></form> -->
</div></div>

</center>
    
<script>
/* layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
  
  
  //指定允许上传的文件类型
  upload.render({
    elem: '#test3'
    ,url: '/upload/'
    ,accept: 'file' //普通文件
    ,done: function(res){
      console.log(res)
    }
  });
  upload.render({ //允许上传的文件后缀
    elem: '#test4'
    ,url: '/upload/'
    ,accept: 'file' //普通文件
    ,exts: 'zip|rar|7z' //只允许上传压缩文件
    ,done: function(res){
      console.log(res)
    }
  });
  upload.render({
    elem: '#test5'
    ,url: '/upload/'
    ,accept: 'video' //视频
    ,done: function(res){
      console.log(res)
    }
  });
  upload.render({
    elem: '#test6'
    ,url: '/upload/'
    ,accept: 'audio' //音频
    ,done: function(res){
      console.log(res)
    }
  });
  
  //设定文件大小限制
  upload.render({
    elem: '#test7'
    ,url: '/upload/'
    ,size: 60 //限制文件大小，单位 KB
    ,done: function(res){
      console.log(res)
    }
  });
  
  //同时绑定多个元素，并将属性设定在元素上
  upload.render({
    elem: '.demoMore'
    ,before: function(){
      layer.tips('接口地址：'+ this.url, this.item, {tips: 1});
    }
    ,done: function(res, index, upload){
      var item = this.item;
      console.log(item); //获取当前触发上传的元素，layui 2.1.0 新增
    }
  })
  
  //选完文件后不自动上传
  upload.render({
    elem: '#test8'
    ,url: '/upload/'
    ,auto: false
    //,multiple: true
    ,bindAction: '#test9'
    ,done: function(res){
      console.log(res)
    }
  });
  
  //拖拽上传
  upload.render({
    elem: '#test10'
    ,url: '/upload/'
    ,done: function(res){
      console.log(res)
    }
  });
  
  //多文件列表示例
  var demoListView = $('#demoList')
  ,uploadListIns = upload.render({
    elem: '#testList'
    ,url: '/upload/'
    ,accept: 'file'
    ,multiple: true
    ,auto: false
    ,bindAction: '#testListAction'
    ,choose: function(obj){   
      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
      //读取本地文件
      obj.preview(function(index, file, result){
        var tr = $(['<tr id="upload-'+ index +'">'
          ,'<td>'+ file.name +'</td>'
          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
          ,'<td>等待上传</td>'
          ,'<td>'
            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
            ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
          ,'</td>'
        ,'</tr>'].join(''));
        
        //单个重传
        tr.find('.demo-reload').on('click', function(){
          obj.upload(index, file);
        });
        
        //删除
        tr.find('.demo-delete').on('click', function(){
          delete files[index]; //删除对应的文件
          tr.remove();
          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
        });
        
        demoListView.append(tr);
      });
    }
    ,done: function(res, index, upload){
      if(res.code == 0){ //上传成功
        var tr = demoListView.find('tr#upload-'+ index)
        ,tds = tr.children();
        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
        tds.eq(3).html(''); //清空操作
        return delete this.files[index]; //删除文件队列已经上传成功的文件
      }
      this.error(index, upload);
    }
    ,error: function(index, upload){
      var tr = demoListView.find('tr#upload-'+ index)
      ,tds = tr.children();
      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
    }
  });
  
  //绑定原始文件域
  upload.render({
    elem: '#test20'
    ,url: '/upload/'
    ,done: function(res){
      console.log(res)
    }
  });
  
}); */
</script>
         
</body></html>