<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.bjjs.gov.cn/bjjs/index/index.shtml -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link href="./北京市住房和城乡建设委员会门户网站_files/default.css" rel="stylesheet" id="lhgdialoglink">
  <title></title>

<meta name="version" content="7.9.7">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<link rel="stylesheet" href="../layui/css/layui.css"  media="all">

<script src="../js/jquery-1.4.2.min.js" type="text/javascript"></script>

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
 
  
  
  
});
</script>

 </head>
 <body margin="0">
 
<center>
  <div style="width: 800px">
  <div class="layui-form">
  <table class="layui-table" >
    <colgroup>
      <col width="150px">
     
      <col width="200px">
      <col>
    </colgroup>
    <form id="form1">
    <tbody>
    <c:if test="${dList != null }">
      <tr width= "100px">
        <td>民意决策</td></tr>
       <c:forEach items="${dList }" var="i">
        
      <tr><td> 
     <a href="${pageContext.request.contextPath}/decision/todecision.do?id=${i.id}"> [<fmt:formatDate value='${i.startDate}' type='date' pattern='yyyy-MM-dd'/> 
      -- <fmt:formatDate value='${i.endDate}' type='date' pattern='yyyy-MM-dd'/> ]
      决策：${i.title}
</a> 
 		 </td></tr>
     
      </c:forEach>
    </tbody>
    
    </c:if>
    
    </form>
  </table>
</div></div>

</center>
  <script >
  $("#bt").click(function(){
   $.ajax({
	 		type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/decision/addResult.do" ,//url
                data: $("#form1").serialize(),
                success: function (result) {
               
               
                	alert(result.message);
                	
                	window.location.href = "${pageContext.request.contextPath}/decision/todecision.do";
                   
                },
                error : function() {
                    alert("异常！");
                }
         
  
	
	
	
	
	
	
	}); 
	
  
  
  
  
  });
  
  
  
  
  
  
  </script>
</body></html>