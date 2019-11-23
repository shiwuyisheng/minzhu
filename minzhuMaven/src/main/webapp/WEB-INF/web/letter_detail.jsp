<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
   
</title><link href="css/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="css/jbox.css" rel="stylesheet" type="text/css" /><link href="css/ks.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.4.2.min.js" type="text/javascript"></script>
   

    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/letter.css"  media="all">
    
    <script src="../layui/layui.js" charset="utf-8"></script>


</head>
<body style="margin:auto">
<style>
a{color:#009688;
font-size:20px;

}
a:hover{color:blue}

table, th, td
  {
  border: 2px solid #009688;
  width:500px;
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
  } 
</style>

<div class="layui-container" style="padding:1px; margin: 0">  
  <a onclick="javascript:history.go(-1);" ><i class="layui-icon layui-icon-return" style="font-size: 30px; color: #009688;"></i> </a>
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
<textarea  readonly id="content" name="content"  class="layui-textarea">
${letter.content}

</textarea>
    
</label>
<label>
<span>回复 :</span>
<textarea  readonly id="content" name="content"  class="layui-textarea">
${letter.answer}

</textarea>
    
</label>
</div>
      
    </div>
<%-- 
<table>
<tr>
<td  >主题</td> <td  >${letter.title}</td>
</tr>
<tr>
<td   >日期</td> <td  >${letter.createTimeOuput}</td>
</tr>
<tr>
<td  >发信人</td> <td > ${letter.userid}</td>
</tr>

<tr>
<tr>
<td  >信件内容</td> <td>${letter.content}</td>
</tr>
<tr>
<td  >附件</td> <td >    </td>
</tr>
<tr><td >回复信息</td><td>${letter.answer}</td></tr> 
</table> --%>
  
</body>
</html>
