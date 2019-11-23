<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.bjjs.gov.cn/bjjs/index/index.shtml -->
<html><head>
  <title></title>
<meta name="version" content="7.9.7">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/global.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui_fly_file.css">

<script src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript"></script>


 <meta name="viewport" content="width=device-width">   
 </head>
  <script type="text/javascript">
            function IFrameResize()
            {
                    //得到父页面的iframe框架的对象
                var obj = parent.document.getElementById("right");
              
                    //把当前页面内容的高度动态赋给iframe框架的高
                obj.height = this.document.body.scrollHeight+100;
               
              
            } 
        </script>
        <style>
       .test{
    width:100%;
    height: 100%;
    overflow: auto;
    float: left;
    margin: 5px;
    border: none;
}
.scrollbar{
    width: 0px;
    height: 300px;
    margin: 0 auto;
 
}
.test-1::-webkit-scrollbar {/*滚动条整体样式*/
        width: 0px;     /*高宽分别对应横竖滚动条的尺寸*/
        height: 1px;
    }
.test-1::-webkit-scrollbar-thumb {/*滚动条里面小方块*/
        border-radius: 10px;
         -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
        background: #535353;
    }
.test-1::-webkit-scrollbar-track {/*滚动条里面轨道*/
        -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
        border-radius: 10px;
        background: #EDEDED;
    }
        
        </style>
 <body  class="test test-1">
  <div class="layui-container"  >
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md8">
      <div class="fly-panel" class="scrollbar"">
        <div class="fly-panel-title fly-filter" >
          <a>消息任务</a>
          <a href="#signin" class="layui-hide-sm layui-show-xs-block fly-right" id="LAY_goSignin" style="color: #FF5722;">去签到</a>
        </div>
        <ul class="fly-list" id ="ul">
         <c:if test="${enlist!=null}">
         <c:forEach items="${enlist}" var="item" varStatus="status">
 
          <li>
            <a href="user/home.html" class="fly-avatar">
              <img src="${pageContext.request.contextPath}/images/public/vote.jpg" >
            </a>
            <h2> 
              <a class="layui-badge">动态</a>
              <a href="${pageContext.request.contextPath}/candidate/toaddcate.do?elect_id=${item.id}">${item.year}年${item.post}等职位报名链接</a>
            </h2>
            <div class="fly-list-info">
             
              <span>
              [<fmt:formatDate value='${item.startDate}' type='date' pattern='yyyy-MM-dd'/>
              --
              <fmt:formatDate value='${item.endDate}' type='date' pattern='yyyy-MM-dd'/>
              ]</span>
              
              <span class="fly-list-kiss layui-hide-xs" ><i class="iconfont icon-kiss"></i> 60</span>
             <!--  <span class="layui-badge fly-badge-accept layui-hide-xs">未完成</span>
              --> <span class="fly-list-nums"> 
             
              </span>
            </div>
            <div class="fly-list-badge">
            
            </div>
          </li>
          </c:forEach>
          </c:if>
          <c:if test="${electList!=null}">
          <c:forEach items="${electList}" var="item1" varStatus="status">

          <li>
            <a href="user/home.html" class="fly-avatar">
              <img src="${pageContext.request.contextPath}/images/public/vote.jpg" alt="">
            </a>
            <h2> 
              <a class="layui-badge">动态</a>
                 <a href="${pageContext.request.contextPath}/candidate/showcate.do?enlist_id=${item1.enlist_id}">${item1.year}年${item1.post}投票选举链接</a> 
          </h2>
            <div class="fly-list-info">
            
              <span>
              [<fmt:formatDate value='${item1.startDate}' type='date' pattern='yyyy-MM-dd'/>
              --
              <fmt:formatDate value='${item1.endDate}' type='date' pattern='yyyy-MM-dd'/>
              ]</span>
              
              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
             <!--  <span class="layui-badge fly-badge-accept layui-hide-xs"></span> -->
              <span class="fly-list-nums"> 
            
              </span>
            </div>
            <div class="fly-list-badge">
            
            </div>
          </li>
         
          </c:forEach> </c:if>
         <c:if test="${dList!=null}">
           <c:forEach items="${dList}" var="item" varStatus="status">
          <li>
            <a href="user/home.html" class="fly-avatar">
              <img src="${pageContext.request.contextPath}/images/public/decision.jpg" alt="">
            </a>
            <h2>
              <a class="layui-badge">公告</a>
              <a href="${pageContext.request.contextPath}/decision/todecision.do?id=${item.id}">${item.title}投票决策链接</a>
            
            </h2>
            <div class="fly-list-info">
              <a href="user/home.html" link>
               
                <!--
                <i class="iconfont icon-renzheng" title="认证信息：XXX"></i>
                <i class="layui-badge fly-badge-vip">VIP3</i>
                -->
              </a>
              <span> [<fmt:formatDate value='${item.startDate}' type='date' pattern='yyyy-MM-dd'/>
              --
              <fmt:formatDate value='${item.endDate}' type='date' pattern='yyyy-MM-dd'/>
              ]</span>
              
             <!--  <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span> -->
              <!--<span class="layui-badge fly-badge-accept layui-hide-xs">已结</span>-->
              <!-- <span class="fly-list-nums"> 
                <i class="iconfont icon-pinglun1" title="回答"></i> 66
              </span> -->
            </div>
            <div class="fly-list-badge">
            </div>
          </li>
         </c:forEach>
        </c:if>
        </ul>
      </div>
  </div></div>
 
 
 
 <!-- <td><h2>未完成任务</h2><br/><br/><br/> -->
 <%-- <c:if test="${user.has_elected==0 }">
 
 <button class="layui-btn" lay-submit="" id="bt" name= "bt"lay-filter="demo1">
 选举村长工作未完成(点击去完成)
 </button>
 <a href="${pageContext.request.contextPath}/candidate/showcate.do">选举村长工作未完成(点击去完成)</a>
 
 </c:if>
 <c:if test="${user.has_elected==1 }">无</c:if>
  --%>
 </div>


<script>
document.onreadystatechange = function() {
if (document.readyState == "complete") {
IFrameResize();
}
}
/* $.ajax({
	type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/vote/getmytask.do" ,//url
                
                success: function (data) {
                for(var i = 0;i <Object.keys(data).length ;i++ )
                var li = ""
                $("#ul").apend()
                }
})


 */

</script>






</body></html>