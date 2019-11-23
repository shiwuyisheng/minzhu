<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.bjjs.gov.cn/bjjs/index/index.shtml -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>农村民主建设</title>
<meta name="createDate" content="2018-12-19 17:30:10">
<meta name="cacheclearDate" content="2018-11-30 17:40:45">
<meta name="version" content="7.9.7">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
<script src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>


<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->


 </head>
 <body margin="0">
 <style>
a{color:#009688;
font-size:16px;

}
a:hover{color:blue}
</style>
<a onclick="javascript:history.go(-1);" ><i class="layui-icon layui-icon-return" style="font-size: 30px; color: #009688;"></i> </a>
 <a href="${pageContext.request.contextPath}/candidate/toMyCandidate.do"><h3>已经报名的职位</h3></a>

  <div style="min-width: 10em max-width:10em">
  <div class="layui-form">
  <table class="layui-table" >
    <colgroup>
      <col min-width="0.5em" max-width="0.5em">
     
      <col min-width="50em" max-width="50em">
      <col>
    </colgroup>
    <tbody>
    <!--   <tr min-width= "1em" max-width="2em">
        <td max-width="2em">姓名</td>
        <td>
<form id="form1" name="form1" method="post">
<div class="layui-input-inline">
      <input  name="username" id="username" autocomplete="off" class="layui-input" style="min-width:;">
    </div>
        </td>
        
      </tr> -->
    <form id="form1" name="form1" method="post"> 
    <input type="hidden" id="elect_id" value="${elect_id}" name="elect_id"/> 
      <tr>
        <td>参选职位 </td>
        <td>
           <div class="layui-input-inline">
        <select name="post" id= "post" >
         
       
            <<!-- option value="3">职位</option>
    
         
            <option value="村长">村长</option>
            <option value="副村长">副村长</option>
          <option value="计生主任">计生主任</option>
          <option value="治保主任">治保主任</option>
          <option value="文书">文书</option> -->
        </select>
      
   
     </div>
        </td>
        
      </tr>
      <tr>
        <td>个人经历</td>
        <td><!-- <div class="layui-form-item layui-form-text"> -->
    
    <!-- <div class="layui-input-inline"> -->
      <textarea  rows = "13"  cols="40" id="experience" name="experience" placeholder="请输入内容" class="layui-textarea"></textarea>
   <!--  </div> -->
  <!-- </div> -->
  </td>
        
      </tr>
      <tr>
      </form>
     <!--  <div class="layui-upload">
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
      </tr> -->
     <tr> <td colspan="2" align="center">
       <div class="layui-form-item">
    <button class="layui-btn" lay-submit="" id="bt" name= "bt"lay-filter="demo1">报名</button>
  </div>
<script>
$("#bt").click(function(){

 $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/candidate/addcandidate.do" ,//url
                data: $("#form1").serialize(),
                success: function (result) {
                layer= layui.layer;
                layer.msg(result.message,function(){
                window.location.href = location.href;
                })
                 
                  //window.location.href = location.href;
                // layer.confirm(result.message);
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

})





</script>

     </td></tr>
    </tbody>
  </table></form>
</div></div>


       <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
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
 
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
 
  
});
</script>  
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  $.ajax({
//提交数据的类型 POST GET
type: "POST",
//提交的网址
url: "${pageContext.request.contextPath}/enlist/getPost.do?elect_id=${elect_id}",
//提交的数据
//返回数据的格式
datatype: "json",//“xml”, “html”, “script”, “json”, “jsonp”, “text”.
//成功返回之后调用的函数
success: function (data) {
$.each(data.data, function (index, item) {
$("#post").append(new Option(item, item));// 下拉菜单里添加元素
});
layui.form.render("select");
}
});

  
  
  
});
</script>      
</body></html>