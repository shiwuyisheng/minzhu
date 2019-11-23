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
<body style="margin:auto ;font-size:16px;">
 <style>
     .card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 400px;
  margin: auto;
  text-align: left;
  font-family: arial;
}

.container {
  padding: 0 16px;
}

.container::after {
  content: "";
  clear: both;
  display: table;
}
     
     
     </style>
<style>

a{color:#009688;
font-size:14px;

}
a:hover{color:blue}
</style>

<div>
 

</div>
    <form class="layui-form" id ="form1" name="form1" lay-filter="form1">
    <!-- <div class="card"> -->
     <input  type="hidden" value="${candidate.id}" name="id" id="id" placeholder="" class="layui-input" style="width: 300px;">
  
<img src="${pageContext.request.contextPath}/${candidate.image}" alt="John" style="width:60px;heigth:100px;">
 </img>
  <div class="container" style="font-size:18px;"> </br>
    <i class="layui-icon layui-icon-username" style="font-size: 25px; color: #1E9FFF;"></i> 
    &nbsp;
     基本信息： </br>
    ${user.username}   &nbsp;&nbsp; &nbsp;&nbsp;${user.age}岁 
     &nbsp;&nbsp; &nbsp;
   <c:if test="${user.sex==0}"> 男</c:if><c:if test="${user.sex!=0}"> 女</c:if>&nbsp;&nbsp; &nbsp;
   
   <c:if test="${user.face==0}">群众</c:if>
   <c:if test="${user.face==1}">党员</c:if>
    <c:if test="${user.face==2}">预备党员</c:if>
     <c:if test="${user.face==3}">团员</c:if> &nbsp;&nbsp; &nbsp;
      <c:if test="${user.education != '未知'}">${user.education} </c:if>
    </br> </br>
   <i class="layui-icon layui-icon-cellphone" style="font-size: 25px; color: #1E9FFF;"></i>
   &nbsp;&nbsp; 
   ${user.phone}&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</br>
 </br>
 <i class="layui-icon layui-icon-home" style="font-size: 25px; color: #1E9FFF;"></i>
 &nbsp;&nbsp; &nbsp; ${user.address} </br>
 
   <i class="layui-icon layui-icon-list" style="font-size: 25px; color: #1E9FFF;"></i> &nbsp;
   竞选职位：${candidate.elect_post}</br>经历： ${candidate.experience} 
   </br>
   
</div>
     
     
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
        
<script >
$("#bt").click(function (){
layui.use(['layer'],function(){
layer = layui.layer;
layer.confirm('确定投票？', {
offset: '100px',skin: 'layui-layer-molv',
  btn: ['确定', '取消'] 
}, function(index, layero){
var id = $("#bt").attr('value');//$("input[name='person']:checked").val()
var post = $("#bt").attr('param');
$.ajax({
	 		type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/candidate/vote.do" ,//url
                data: {"id" :id ,"post":post,"enlist_id":${candidate.enlist_id}},
                success: function (result) {
                layer.confirm('投票成功',{offset: '100px',skin: 'layui-layer-molv'},{btn:['确定']},function(){
              
                window.location.href="${pageContext.request.contextPath}/candidate/showcate.do?enlist_id=${candidate.enlist_id}";
                
                });
                },
                error : function() {
                    alert("系统异常！");
                }
	});
	
  //按钮【按钮一】的回调
}, function(index){
window.href="${pageContext.request.contextPath}/candidate/showcate.do?enlist_id=${enlist_id}";
  
});

});})
</script>

</body>
</html>
