<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.bjjs.gov.cn/bjjs/index/index.shtml -->
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>门户网站</title>
<meta name="createDate" content="2018-12-19 17:30:10">
<meta name="cacheclearDate" content="2018-11-30 17:40:45">
<meta name="version" content="7.9.7">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
 <script src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->


 </head>
 <body >
    

<div style="padding: 20px; background-color: #F2F2F2;">
  <div class="layui-row layui-col-space15">
    <c:if test="${not empty cList}">
     
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header"><h3> 村长选举</h3></div>
        <div class="layui-card-body">
         
        <c:forEach  items="${cList}"  var="i" >
    <%--  <img class="layui-upload-img" id="demo1"  src="${pageContext.request.contextPath}/${i.image}">
       --%>  <image src="${pageContext.request.contextPath}/${i.image}" id="${i.id}"
     style="width:350px;height: auto;max-height: 10em;min-height: 2em;max-width: 7em; min-width:3em ;overflow:hidden; " 
    onclick="openDetail(this)"></image> 
    </br>
    <div  onclick="openDetail(this)" id="${i.id}">${i.username }</br></div>
    <div class="layui-form-item">
   
      <button class="layui-btn" id="bt" value="${i.id}" param="村长" name="bt" onclick = "elect(this)">投票</button>
   
      </div>
        </c:forEach>   
        </div>
      </div>
    </div>
    </c:if>
     <c:if test="${not empty fList}">
   
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header">副村长选举</div>
        <div class="layui-card-body">
        <c:forEach  items="${fList}"  var="i"   varStatus="<string>">
  
          <image src="${pageContext.request.contextPath}/${i.image}" id="${i.id}"   onclick="openDetail(this)"
     style="width:350px;height: auto;max-height: 10em;min-height: 2em;max-width: 7em; min-width:3em ;overflow:hidden; " 
    ></image>
    </br>
    
    <div  onclick="openDetail(this)" id="${i.id}">${i.username }</br></div>
    <div class="layui-form-item">
   
      <button class="layui-btn" id="bt" value="${i.id}" param="副村长" name="bt" onclick = "elect(this)">投票</button>
   
      </div>
      </c:forEach>
        </div>
      </div>
    </div>
    </c:if>
     <c:if test="${wList!=null}">
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header">文书选举</div>
        <div class="layui-card-body">
        <c:forEach  items="${wList}"  var="i"   varStatus="<string>">
  
         <image src="${pageContext.request.contextPath}/${i.image}" id="${i.id}"   onclick="openDetail(this)"
     style="width:350px;height: auto;max-height: 10em;min-height: 2em;max-width: 7em; min-width:3em ;overflow:hidden; " 
    ></image>
    </br>
   <div  onclick="openDetail(this)" id="${i.id}">${i.username }</br></div>
    <div class="layui-form-item">
   
      <button class="layui-btn" id="bt" value="${i.id}" param="文书" name="bt" onclick = "elect(this)">投票</button>
   
      </div>
      </c:forEach>
        </div>
      </div>
    </div>
    </c:if>
     <c:if test="${not empty jList}">
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header">计生主任选举</div>
        <div class="layui-card-body">
        <c:forEach  items="${jList}"  var="i"   varStatus="<string>">

          <image src="${pageContext.request.contextPath}/${i.image}" id="${i.id}"   onclick="openDetail(this)"
     style="width:350px;height: auto;max-height: 10em;min-height: 2em;max-width: 7em; min-width:3em ;overflow:hidden; " 
    ></image>
    </br>
    <div  onclick="openDetail(this)" id="${i.id}">${i.username }</br></div>
    <div class="layui-form-item">
   
      <button class="layui-btn" id="bt" value="${i.id}" param="计生主任" name="bt" onclick = "elect(this)">投票</button>
   
      </div>
       </c:forEach>
        </div>
      </div>
    </div>
   </c:if>
   <c:if test="${zList!=null}">
    <div class="layui-col-md12">
      <div class="layui-card">
        <div class="layui-card-header">治保主任</div>
        <div class="layui-card-body">
         <c:forEach  items="${zList}"  var="i"   varStatus="<string>">
    <%-- <img src="${pageContext.request.contextPath}/${i.image}"   onclick="openDetail(this)" >
     --%>      <image src="${pageContext.request.contextPath}/${i.image}"   onclick="openDetail(this)"  id="${item.id}" style="width:350px;height: auto;max-height: 10em;min-height: 2em;max-width: 7em; min-width:3em ;overflow:hidden;" >
     
     </image>
    </br>
     <div  onclick="openDetail(this)" id="${i.id}">${i.username }</br></div>
    <div class="layui-form-item">
   
      <button class="layui-btn" id="bt" value="${i.id}" param="治保主任" name="bt" onclick = "elect(this)">投票</button>
   
      </div> </c:forEach>
        </div>
      </div>
    </div>
   </c:if> 
  </div>
</div> 
  <div style="width: 800px">
 
  <table class="layui-table" >
    
    
<!-- <script>
layui.use(['element', 'layer'], function(){
  var element = layui.element;
  var layer = layui.layer;
  //监听折叠
  element.on('collapse(test)', function(data){
    layer.msg('展开状态：'+ data.show);
  });
});
</script> -->
<tr><td>

<c:if test="${nothing ==[]}"><%-- ${cList==null && fList==null && wList==null && zList == null && jList == null}">
 --%><h1>已完成投票</h1>
</c:if>

</td></tr>
    
  </table>
</div>

 
<%-- div class="layui-input-block">
<c:forEach
    items="${cList}"
    var="i"
    varStatus="<string>">
    <image src="${pageContext.request.contextPath}/${i.image} "
     style="width:350px;height: auto;max-height: 10em;min-height: 2em;max-width: 7em; min-width:3em ;overflow:hidden; " 
    ></image>
    </br>
    ${i.username }</br>
     <div class="layui-form-item">
   
      <button class="layui-btn" id="bt" value="${i.id}" name="bt" onclick = "elect(this)">投票</button>
   
      </div>
    </c:forEach>   
    </div> --%>
     
      <!--  <div class="layui-form-item">
    <button class="layui-btn layui-bg-blue" id="bt" name="bt">投票</button>
      </div> -->
    
<script >

function elect(e){
layer = layui.layer;
layer.confirm('确定投票？', {
offset: '100px',skin: 'layui-layer-molv',
  btn: ['确定', '取消'] 
}, function(index, layero){
var id = $(e).attr('value');//$("input[name='person']:checked").val()
var post = $(e).attr('param');
$.ajax({
	 		type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/candidate/vote.do" ,//url
                data: {"id" :id ,"post":post,"enlist_id":${enlist_id}},
                success: function (result) {
                layer.confirm('投票成功',{btn:['确定']},function(){
              
                window.location.href="${pageContext.request.contextPath}/candidate/showcate.do?enlist_id=${enlist_id}";
                
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

}
</script>
<!-- <script>
$("#b").click(function(){
//$("input[name='person']:checked").val();
var id = $("input[name='person']:checked").val()
if(id){

	
	$.ajax({
	 		type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/candidate/vote.do" ,//url
                data: "id=" + id,
                success: function (result) {
                alert(result.message);
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
	
	
}
else{
alert("未选人");}

});


</script>
 -->
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  
});


//iframe层
function openDetail(e){
var id = $(e).attr("id");

layer.open({
  type: 2,
  title: '候选人详细信息',
  shadeClose: true,
  shade: 0.8,
  area: ['480px', '90%'],
  content: '${pageContext.request.contextPath}/candidate/getCandidate.do?flag=1&id='+id //iframe的url
});
}
</script>
      
         
</body></html>