<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
   
</title>  
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/letter.css"  media="all">
    
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
    <script src="../js/jquery-1.4.2.min.js" type="text/javascript"></script>
   
    <script src="../layui/layui.js" charset="utf-8"></script>


</head>
<body style="margin:auto">
<style>
a{color:#009688;
font-size:20px;

}
a:hover{color:blue}
/* 
table, th, td
  {
  border: 2px solid #009688;
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
</style>
<div >
<br/><br/><br/>

<a onclick="javascript:history.go(-1);" ><i class="layui-icon layui-icon-return" style="font-size: 30px; color: #009688;"></i> </a>

<div class = "smart-green">

<h1>决策详情信息

</h1>

<label>
<span>决策主题 :</span></h2>
 <input id="name" type="text" name="name" style="width: 10em;"  value="${decision.title}"  readonly/>
 </label>
<label>
<span>决策结果 :</span><br/> </br></br>
 <c:forEach items="${decision.resultList}" var="i">

 <input id="email" type="email" name="email" style="width: 10em;"  value=" ${i}" readonly /> 

</br></c:forEach>
</label>
<label>
<span>决策开始时间 :</span>

 <input id="email" type="email" name="email" style="width: 10em;"  value=" <fmt:formatDate value='${decision.startDate}' type='date' pattern='yyyy-MM-dd'/>" readonly />
 </label>
<label>
<span>决策结束时间 :</span> <input id="email" type="email" name="email" style="width: 10em;" value=" <fmt:formatDate value='${decision.endDate}' type='date' pattern='yyyy-MM-dd'/>" readonly />
 </label>
<label>

<c:forEach items="${question}" var="itemQuestion" varStatus="status">
<label>
<span>具体问题 :</span>
<textarea rows="5" cols="8" readonly>${itemQuestion.questionContent}</textarea>
 <%-- <input id="email" type="email" name="email" style=""  value=" ${itemQuestion.questionContent}" readonly /> 
 --%></label>
<label>
<span>问题类型 :
<c:if test="${itemQuestion.type  == '0'}"> 单选</c:if>
    <c:if test="${itemQuestion.type  == '1'}"> 多选</c:if>
 <%-- <input id="email" type="email" name="email" style="width: 10em;"  value=" ${itemQuestion.questionContent}" readonly /> 
 --%>
 </span>
 </label><br/><br/>

<c:forEach items="${itemQuestion.questionOption}" var="item" varStatus="status">
<label><br/>
<span>选项${status.count} :</span>
 <input id="email" type="email" name="email" style="width: 10em;"  value="  ${item}" readonly /> 
</label>

</c:forEach>
  </c:forEach> 
  
  <%-- <c:if test="${drList!=null}">
  <c:forEach items="${drList}" var="item" varStatus="status" >
  <label>
<span>我的选择 :</span>
 <input id="email" type="email" name="email" style="width: 10em;"  value="${item.choose}" readonly /> 
</label>
  
  </c:forEach>
 </c:if>
 --%>
</div>

<%-- 

<table >
<tr>
<td width="100">主题</td> <td width="200">${decision.title}</td>
</tr>
<tr>
<td>结果</td> <td>${decision.result}</td>
</tr>
<tr>
<td>开始日期</td> <td><fmt:formatDate value='${decision.startDate}' type='date' pattern='yyyy-MM-dd'/></label>
    </td>
</tr>
<tr>
<td>结束日期</td> <td><fmt:formatDate value='${decision.endDate}' type='date' pattern='yyyy-MM-dd'/></label>
    </td>
</tr>

<c:forEach items="${question}" var="itemQuestion" varStatus="status">
<tr><td>具体问题</td><td> ${itemQuestion.questionContent}</td></tr>
<tr><td>问题类型</td><td> <c:if test="${itemQuestion.type  == '0'}"> 单选</c:if>
    <c:if test="${itemQuestion.type  == '1'}"> 多选</c:if></td></tr>
<c:forEach items="${itemQuestion.questionOption}" var="item" varStatus="status">
<tr><td>选项${status.count}</td><td> ${item}</td></tr>
</c:forEach>
  </c:forEach> 
  
  <c:if test="${drList!=null}">
  <c:forEach items="${drList}" var="item" varStatus="status" >
  <td>我的选择</td><td> ${item.choose}</td></tr>
  </c:forEach>
 </c:if>
</table>
   --%></div>
</body>
</html>
