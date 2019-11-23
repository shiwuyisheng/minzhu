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

<link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/jquery.jOrgChart.css"/>
    <link rel="stylesheet" href="../css/custom.css"/>
    <link href="../css/prettify.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../js/prettify.js"></script>
     <script src="../js/jquery-1.4.2.min.js" type="text/javascript"></script>
 
    <!-- jQuery includes -->
    <!-- <script type="text/javascript" src="../js/jquery.min.js"></script>
     --><script type="text/javascript" src="../js/jquery-ui.min.js"></script>
    
    <script src="../js/jquery.jOrgChart.js"></script>

    <script>
    jQuery(document).ready(function() {
        $("#org").jOrgChart({
            chartElement : '#chart',
            dragAndDrop  : true
        });
    });
    </script>
<style>
a{color:#009688;
font-size:16px;

}
a:hover{color:blue}
</style>
</head>

<body style="margin:auto" onload="prettyPrint();">
<div class="layui-container" style="padding:1px; margin: 0">  
 
<a onclick="javascript:history.go(-1);" ><i class="layui-icon layui-icon-return" style="font-size: 30px; color: #009688;"></i> </a>
<br/>
<br/>
  <div class="layui-row">
    <div class="layui-col-md6"> <h4>${hukou.master_username}户口关系图</h4>
 <div id="chart" class="orgChart">    </div>
<ul id="org" style="display:none">
    <li style="width:40px;"><br/>
    <img src="${pageContext.request.contextPath}/${hukou.image}"  width="40px" height="60px"/>
    <br />  <br />
      户主：${hukou.master_username}<!-- <img src="../person_images/1.jpg" alt="Raspberry"/> -->
      <ul>   <c:forEach items="${hurList}" var="item" varStatus="status">
   
 
         <li id="beer"><br/>
          <img src="${pageContext.request.contextPath}/${item.image}"  width="40px" height="60px"/>
          <br /><br/>
         ${item.master_relation}：${item.username}</li>
          </c:forEach></ul> </li>
        
   </ul>            
    
    </div>
    <div class="layui-col-md6" >
    <h4>${hukou.master_username}户口关系表</h4>
    <table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  
 
  <thead>
    <tr>
      <th>姓名</th>
      <th>与户主关系</th>
      <th>身份证号</th>
       <th>年龄</th> 
    </tr> 
  </thead>
  <tbody>
  <td  > ${hukou.master_username}</td> <td >户主</td> <td  > ${hukou.master_id}</td> <td  > ${hukou.age}</td>
  <c:forEach items="${hurList}" var="item" varStatus="status">
  
    <tr>
      <td>${item.username}</td>
      <td>${item.master_relation}</td>
      <td>${item.user_id}</td>
      <td>${item.age}</td>
    </tr>
   </c:forEach>
  </tbody>
</table>
      <%--  ${hukou.master_username}户口关系 --%>
     <%--  ${hukou.master_username}户口关系
与户主关系        姓名</td> <td  >身份证号</td>
</tr>
<tr>
<td >户主</td> <td  > ${hukou.master_username}</td> <td  > ${hukou.master_id}</td>
</tr>
<c:forEach items="${hurList}" var="item" varStatus="status">



<tr><td>${item.master_relation}</td><td>${item.username}</td> <td>${item.user_id}</td>  </tr>



  </c:forEach> 
</table> --%>
    </div>
  </div></div>
 
<%-- ${hukou.master_username}户口关系
<ul id="org" style="display:none">
    <li style="width:50px;"><br/>
    <img src="${pageContext.request.contextPath}/${hukou.image}" alt="Raspberry" width="80px" height="120px"/>
    <br />  <br />
      户主：${hukou.master_username}<!-- <img src="../person_images/1.jpg" alt="Raspberry"/> -->
      <ul>   <c:forEach items="${hurList}" var="item" varStatus="status">
   
 
         <li id="beer"><br/>
          <img src="${pageContext.request.contextPath}/${item.image}"  width="80px" height="120px"/>
          <br /><br/>
         ${item.master_relation}：${item.username}</li>
          </c:forEach></ul> </li>
        
   </ul>            
     --%>
    
    <script>
        jQuery(document).ready(function() {
            
            /* Custom jQuery for the example */
            $("#show-list").click(function(e){
                e.preventDefault();
                
                $('#list-html').toggle('fast', function(){
                    if($(this).is(':visible')){
                        $('#show-list').text('Hide underlying list.');
                        $(".topbar").fadeTo('fast',0.9);
                    }else{
                        $('#show-list').text('Show underlying list.');
                        $(".topbar").fadeTo('fast',1);                  
                    }
                });
            });
            
            $('#list-html').text($('#org').html());
            
            $("#org").bind("DOMSubtreeModified", function() {
                $('#list-html').text('');
                
                $('#list-html').text($('#org').html());
                
                prettyPrint();                
            });
        });
    </script>
    <!-- <style>
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
</style>  -->
<%-- <a onclick="javascript:history.go(-1);" >返回</a>
<table>
<tr>
<td  colspan="4" >${hukou.master_username}户口关系</td> 
</tr>
<tr>
<td   >与户主关系</td> <td   >姓名</td> <td  >身份证号</td>
</tr>
<tr>
<td >户主</td> <td  > ${hukou.master_username}</td> <td  > ${hukou.master_id}</td>
</tr>
<c:forEach items="${hurList}" var="item" varStatus="status">



<tr><td>${item.master_relation}</td><td>${item.username}</td> <td>${item.user_id}</td>  </tr>



  </c:forEach> 
</table> --%>
  
</body>
</html>
