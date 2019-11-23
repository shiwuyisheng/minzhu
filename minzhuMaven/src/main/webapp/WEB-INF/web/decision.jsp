<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.bjjs.gov.cn/bjjs/index/index.shtml -->
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title></title>
<meta name="version" content="7.9.7">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">

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
<style>

.ops {

text-align:center ;
line-height:60px;
border:2px;
border-radius:25px;
height:60px;
width:490px;
background:#eee;
font-size:25px;

}
.ops:hover{
background:lightgreen;
}
</style>
 </head>
 <body margin="0">
  
         <div class="layui-form">
          <form id="form1"> 
          <c:if test="${dqList !=null }">
   <h1>  民意决策</h1> <br/>
       <c:forEach items="${dqList}" var="i">
        
    <h2>
      决策${i.questionNumber }：${i.questionContent}
</h2> <br/><br/><br/>
 		
      <input type="hidden" name="decisionId" id="decisionId" value="${i.decisionId }" />
        <input type="hidden" name="decisionQuestionId" id="decisionQuestionId"  value="${i.id }" />
       
         <c:forEach items="${i.questionOption}" var="q"  varStatus="index">
         <div class="ops">
          <input type="radio" class = "" name="choose" value="${index.count}" id= "choose" >${q}
          <br/>
         </div> <br/> <br/>
         </c:forEach>
      
      </c:forEach>
    <button class="layui-btn" id="bt" name="bt" type="button">提交</button>
    
    
    </c:if>    </form></div>
  
<%-- <center>
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
    <c:if test="${dqList !=null }">
      <tr width= "100px">
        <td>民意决策</td></tr>
       <c:forEach items="${dqList}" var="i">
        
      <tr><td> 
      决策${i.questionNumber }：${i.questionContent}

 		 </td></tr>
      <tr><td>
      <input type="hidden" name="decisionId" id="decisionId" value="${i.decisionId }" />
        <input type="hidden" name="decisionQuestionId" id="decisionQuestionId"  value="${i.id }" />
       
         <c:forEach items="${i.questionOption}" var="q"  varStatus="index">
         <div class="op">
          <input type="radio" name="choose" value="${index.count}" id= "choose" >${q}
         </div>
         </c:forEach>
      </td> </tr>
      </c:forEach>
    <tr><td><button class="layui-btn" id="bt" name="bt" type="button">提交</button></td></tr>
    </tbody>
    
    </c:if>
    
    </form>
  </table>
</div></div>

</center> --%>
  <script >
  $("#bt").click(function(){
   $.ajax({
	 		type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/decision/addResult.do" ,//url
                data: $("#form1").serialize(),
                success: function (result) {
                             
                	var layer = layui.layer;
                	layer.confirm("提交成功 ！",{ offset: '100px',skin: 'layui-layer-molv'},function(){
              self.location=document.referrer; // window.location.href = "${pageContext.request.contextPath}/decision/todecision_list.do";
                   
                	});
                	
                },
                error : function() {
                    alert("异常！");
                }
         
  
	
	
	
	
	
	
	}); 
	
  
  
  
  
  });
  
  
  
  
  
  
  </script>
</body></html>