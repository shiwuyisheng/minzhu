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
        
        body{
    background:url("${pageContext.request.contextPath}/images/public/admin_bg.jpg") no-repeat;
   
}
        </style>
        
 <body   bgcolor="red">
 
<div style="height:400px;"></div>


</body></html>