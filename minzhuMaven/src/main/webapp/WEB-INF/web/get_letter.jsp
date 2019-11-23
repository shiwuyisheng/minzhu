<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
   
</title>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/letter.css"  media="all">
    
     <script src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
   
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>


</head>
<body style="margin:auto">
<style>
a{color:#009688;
font-size:20px;

}
a:hover{color:blue}

/* table, th, td
  {
  border: 2px solid #009688;
  width:400px;
  }
th
  {
  height:170px;
  }
  td
  {
  text-align:center;
  font-size:18px;
  font-weight:bold;
  }  */
  .relpy{
  font-size:20px;
  color:#009688;
  }
</style>

<div class="layui-container" style="padding:1px; margin: 0">  
  <a onclick="javascript:history.go(-1);" >返回</a>
  <div class="layui-row">
    <div class="layui-col-md6">
     
      <div class="smart-green">

<h1>收到的信件
<span></span>
</h1>
<label>
<span>信息主题 :</span>
<!-- <input id="name" type="text" name="name" placeholder="Your Full Name" /> -->
<input type="text" name="title" value="${letter.title}" style="width: 10em;" readonly>
    
</label>

<label>
<span>收信日期 :</span>
<input type="text" name="title" value="${letter.createTimeOuput}" style="width: 10em;" readonly>
</label>
<c:if test="${letter.niming!=1 }">
<label>
<span>发信人:</span>

<input type="text" name="title" value="${letter.username}" style="width: 10em;" readonly>
</label>
</c:if>
<label>
<span>信息类型 :</span><!-- <select name="selection">
<option value="Job Inquiry">Job Inquiry</option>
<option value="General Question">General Question</option>
</select> -->
<script>
$("#${letter.status}").selected();
</script>
 <select name="status" id= "status" >
            <option value="3" id='3'>意见</option>
            <option value="1" id='1'>提问</option>
            <option value="2" id='2'>投诉</option>
          
        </select>
</label>

  <br/><br/>


<label>
<span>内容 :</span>
<!-- <textarea id="message" name="message" placeholder="Your Message to Us"></textarea> -->
<textarea  readonly id="content" name="content"  class="layui-textarea">
${letter.content}

</textarea>
    
</label>

</div>
      
    </div>
    <div class="layui-col-md6">
    
<div class="smart-green">
<form action="" method="post" class="STYLE-NAME"  name="form1" id="form1">
<h1>回复信件

</h1>
<input type="hidden" value="${letter.id}" id="id" name="id"/>

<label>
<span>回复内容 :</span>

<textarea   id="answer" name="answer" class="layui-textarea">


</textarea>
    
</label>

<label>
<span>&nbsp;</span>
<input type="button" class="button" value="回复信件" id="reply" name="reply"/>
</label>
</form></div>
      
      
    </div>
  </div>
  </div>

<%-- 

<table>
<tr>
<td  colspan="2">主题</td> <td  colspan="2">${letter.title}</td>
</tr>
<tr>
<td  colspan="2" >日期</td> <td  colspan="2">${letter.createTimeOuput}</td>
</tr>
<tr>
<td  colspan="2">发信人</td> <td  colspan="2"> ${letter.userid}</td>
</tr>

<tr>
<tr>
<td  colspan="2">信件内容</td> <td  colspan="2">${letter.content}</td>
</tr>
<tr>
<td  colspan="2">附件</td> <td  colspan="2">    </td>
</tr>


</table> --%>
</br>
</br>
<%-- <form name="form1" id="form1">
<div class="relpy">回复</div>
<input type="hidden" value="${letter.id}" id="id" name="id"/>
 <textarea  rows = "5"  cols="50" id="answer" name="answer" placeholder="请输入回复内容" class="layui-textarea"></textarea>
 <button class="layui-btn" id="reply" name="reply" type="button" >回复</button>
     
 </form>   --%>
 
 <script>
$("#reply").click(function(){
 var id = $("id").val();
  $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/letterbox/resendletter.do?",//url
                data: $("#form1").serialize() ,
                success: function (result) {
                layui.use(['layer'],function(){
                layer = layui.layer;
                layer.confirm("回复成功",{ offset: '100px',skin: 'layui-layer-molv'},function(){
                
                window.location.href = "${pageContext.request.contextPath}/letterbox/tolettermanage.do";
                });
               })
                },
                error : function() {
                    layer.alert("异常！");
                }
            });
  
  });


</script> 
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    
</body>
</html>
