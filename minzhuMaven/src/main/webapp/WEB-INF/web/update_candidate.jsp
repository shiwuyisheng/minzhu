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
<a onclick="javascript:history.go(-1);" >返回</a>
    <form class="layui-form" id ="form1" name="form1" lay-filter="form1">
    <div class="layui-form-item">
    
    <div class="layui-input-block">
   <image src="${pageContext.request.contextPath}/${user.image}"
     style="width:350px;height: auto;max-height: 10em;min-height: 2em;max-width: 7em; min-width:3em ;overflow:hidden; " 
    ></image>
      </div>
  </div>
    
     
     <input  type="hidden" value="${candidate.id}" name="id" id="id" placeholder="" class="layui-input" style="width: 300px;">
  
  <div class="layui-form-item">
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-block"> <label class="layui-form-label">${candidate.username}</label>
        </div>
  </div>
   
  <div class="layui-form-item">
    <label class="layui-form-label">年龄</label>
    <div class="layui-input-block">
     <label class="layui-form-label"> ${user.age} </label> </div>
  </div> 
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">政治面貌</label>
      <div class="layui-input-inline">
        <select name="face" id="face" disabled="disabled" >
          <option value="-1">选择</option>
   <!--       <optgroup label="党员">--->
            <option value="0" id="0" >党员</option>
            <option value="1" id="1" >预备党员</option>
            <option value="2" id="2">群众</option>
           <option value="3" id="3">团员</option>
        </select>
      </div>
    </div>
    
  <div class="layui-form-item">
    <label class="layui-form-label">学历</label>
    <div class="layui-input-block">
    <label class="layui-form-label"> ${user.education}</label>
      </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">竞选职位</label>
  
      <div class="layui-input-inline">
        <select name="elect_post" id= "elect_post" >
         
       
            <option value="3">职位</option>
    
         
            <option value="村长">村长</option>
            <option value="副村长">副村长</option>
          <option value="计生主任">计生主任</option>
          <option value="治保主任">治保主任</option>
          <option value="文书">文书</option>
        </select>
      
   <script>
    $("#${candidate.elect_post}").selected="selected";
   $("input[name=sex][value='0']").attr("checked", ${user.sex} == 0 ? true : false);
$("input[name=sex][value='1']").attr("checked", ${user.sex} == 1 ? true : false);
    </script>
     </div>
      
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">联系电话</label>
      <div class="layui-input-inline">
     <label class="layui-form-label"> ${user.phone}  </label> 
      </div>
    </div>
 
   <div class="layui-form-item">
    <label class="layui-form-label">经历</label>
    <div class="layui-input-block">
   <textarea  rows = "15"  cols="30" id="experience" name="experience"  class="layui-textarea">
   
     ${candidate.experience}
   </textarea>

    </div>
  </div> 
  <div class="layui-form-item">
    <div class="layui-input-block">
     <button class="layui-btn" id="change_button" name="change_button" type="button" >修改</button>
      
    </div>
  </div>
</form>
  <script type="text/javascript">
  $("#change_button").click(function(){
  
  $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/candidate/updateCandidateInfo.do" ,//url
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
layui.use(['form'], function(){
  var form = layui.form;
 
  
  var sex = ${user.sex};
  var face = ${user.face};
  var elect_post = "${candidate.elect_post}"
  //表单初始赋值
  form.val('form1', {
    
    "face":face,
    "elect_post":elect_post
   
  });

  
});
</script>
</body>
</html>
