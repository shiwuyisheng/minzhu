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
  } 
</style>
<a onclick="javascript:history.go(-1);" ><i class="layui-icon layui-icon-return" style="font-size: 30px; color: #009688;"></i> </a>
<table>
<tr>
<td  colspan="2" >年份</td> <td  colspan="2">${election.year}</td>
</tr>
<tr>
<td  colspan="2">竞选职位</td> <td  colspan="2"> ${election.post}</td>
</tr>
<tr>
<td  colspan="2">应投票数</td> <td  colspan="2">${election.shouldNumber}</td>
</tr>
<tr>
<tr>
<td  colspan="2">实际投票数</td> <td  colspan="2">${election.hadNumber}</td>
</tr>
<tr>
<td  colspan="2">开始竞选日期</td> <td  colspan="2"><fmt:formatDate value='${election.startDate}' type='date' pattern='yyyy-MM-dd'/></label>
    </td>
</tr>
<tr>
<td  colspan="2">结束竞选日期</td> <td  colspan="2"><fmt:formatDate value='${election.endDate}' type='date' pattern='yyyy-MM-dd'/></label>
    </td>
</tr>


<tr><td>姓名</td><td>竞选职位</td> <td>获票数</td><td>竞选率</td></tr>
<c:forEach items="${election_result}" var="itemResult" varStatus="status">
<tr><td>${itemResult.username}</td><td>${itemResult.post}</td> <td>${itemResult.electedNumber}</td>

<td>


<fmt:formatNumber type="number" value="${itemResult.electedNumber/election.hadNumber*100 }" pattern="0.00" maxFractionDigits="2"/>
%</td>  </tr>



  </c:forEach> 
</table>
  
</body>
</html>
