<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	农村民主建设
</title><link href="../css/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="../css/jbox.css" rel="stylesheet" type="text/css" /><link href="../css/ks.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../js/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../js/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="../js/Common.js" type="text/javascript"></script>
    <script src="../js/Data.js" type="text/javascript"></script>
   
    
    <script src="Script/changeOption.js" type="text/javascript"></script>
    <script src="Script/rl.js" type="text/javascript"></script>
    
    
     <script type="text/javascript">
        $().ready(function () {
            setStudMsgHeadTabCheck();
            showUnreadSysMsgCount();
        });

        //我的信息头部选项卡
        function setStudMsgHeadTabCheck() {
            var currentUrl = window.location.href;
            currentUrl = currentUrl.toLowerCase();
            var asmhm = "";
            $("#ulStudMsgHeadTab li").each(function () {
                asmhm = $(this).find('a').attr("href").toLowerCase();
                if (currentUrl.indexOf(asmhm) > 0) {
                    $(this).find('a').attr("class", "tab1");
                    return;
                }
            });
        }

        //显示未读系统信息
        function showUnreadSysMsgCount() {
            var unreadSysMsgCount = "0";
            if (Number(unreadSysMsgCount) > 0) {
                $("#unreadSysMsgCount").html("(" + unreadSysMsgCount + ")");
            }
        }

        //退出
        function loginOut() {
            if (confirm("确定退出吗？")) {
                StudentLogin.loginOut(function (data) {
                    if (data == "true") {
                        window.location = "/Login.aspx";
                    }
                    else {
                        jBox.alert("退出失败！", "提示", new { buttons: { "确定": true} });
                    }
                });
            }
        }
        //更改报考类别
        function changeCateory(thisObj, id) {
            var oldCateoryId = $("#cateoryId").val();
            var cateoryId = "";
            if (id != null) {
                cateoryId = id;
            }
            else {
                cateoryId = thisObj.val();
            }
            var studentId = $("#studentId").val();
            if (cateoryId.length <= 0) {
                jBox.tip("报考类别不能为空！");
                if (id == null) {
                    thisObj.val(oldCateoryId);
                }
            }
            else {
                studentInfo.changeStudentCateory(cateoryId, function (data) {
                    var result = $.parseJSON(data);
                    if ((String(result.ok) == "true")) {
                        window.location.href = "/Index.aspx";
                    }
                    else {
                        jBox.tip(result.message);
                    }
                });
            }
        }
    </script>
</head>
<body>

<!--

    <div class="banner">
        <div class="bgh">
            <div class="page">
                <div id="logo">
                    <a href="Index.aspx.html">
                        <img src="images/userImages/Student/log.gif" alt="" width="165" height="48" />
                    </a>
                </div>
                <div class="topxx">
                    <select onchange="changeCateory($(this))" style="font-size: 11px; background: #4991cf;
                        color: #fff;">
                        
                        <option 
                            value="4">
                            远程</option>
                        
                        <option selected='selected'
                            value="1">
                            自考</option>
                        
                    </select>
                    910513201419学员：欢迎您！ <a href="MyInfo/Index.aspx.html">我的信息</a> <a href="User/StudentInfor/systemMsge.aspx.html">
                        通知</a> <a href="User/Account/ChangePasswd.aspx.html">密码修改</a> <a onclick="loginOut()"
                            href="javascript:">安全退出</a>
                </div>
                <div class="blog_nav">
                    <ul>
                        <li><a href="Index.aspx.html">我的信息</a></li>
                        <li><a href="EducationCenter/Score.aspx.html">教务中心</a></li>
                        <li><a href="MyAccount/wdcw.aspx.html">我的学费</a></li>
                        <li><a href="OnlineTeaching/StudentMaterial.aspx.html">资料中心</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    -->
    <style type="text/css">
    .box {
    	height: 600px !important;


    }	
    .mtop {
    	height: 600px !important;
    }
.leftbox{

width: 160px !important;
height: 300px !important;

}
.rightbox{

width: 660px !important;
height: 900px !important;

}
.cdlist{
	font-size: 20px !important;
	
}
.cdlist div {height: 30px;
    font-size: 16px;
    
    
}
.ta1{
    font-size: 18px;
   
}
 .title{

       height: 500px;
       width: 30%
         
         border :0;
    }
    .header{
        width: 100%;
        height: 110px;
    }
    .right{
       
        height: 450px;
        width: 100%;
    }
    </style>
    <script type="text/javascript">
        function operator(url){
            alert(url);
            alert($("#rightbox").attr('class'))
        $("#rightbox").load(url); 

        }

    </script>
    <div class="banner"> 
     <div class="bgh">
            <div class="page">
                <div id="logo">
                    <a href="Index.aspx.html">
                        <img src="images/userImages/Student/log.gif" alt="" width="165" height="48" />
                    </a>
                </div>
                <div class="topxx">
                    
                    ${user.idnumber}：欢迎您！ <a href="MyInfo/Index.aspx.html">我的信息</a> <a href="User/StudentInfor/systemMsge.aspx.html">
                        通知</a> <a href="User/Account/ChangePasswd.aspx.html">密码修改</a> <a onclick="loginOut()"
                            href="javascript:">安全退出</a>
                </div>
                <div class="blog_nav">
                    <ul>
                        <li><a href="Index.aspx.html">我的信息</a></li>
                        <!-- <li><a href="EducationCenter/Score.aspx.html"></a></li> -->
                        <li><a href="juece.html">民主决策</a></li>
                        <li><a href="letterbox.html">信箱管理</a></li>
                    </ul>
                </div>
            </div>
        </div>
    
    
    
   </div>
    
    <div class="page">
        <div class="box mtop">
            <div class="leftbox">
                <div class="l_nav2">
                    <div class="ta1">

                        <strong>个人中心</strong>
                        <div class="leftbgbt">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="showUserInfo.do" target="right">我的信息</a></div>
                        <div>
                            <a href="showchangepassword.do" target="right">修改密码 </a>
                        </div>
                        
                        <div>
                            <a href="userinfo.html" target="right">修改个人信息</a></div>
                        <!-- <div>
                            <a href="MyInfo/Objection.aspx.html" target="right">我的异议</a></div> -->
                    </div>
                    <div class="ta1">
                        <strong>民主权利</strong>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="${pageContext.request.contextPath}/candidate/toaddcate.do" target="right">候选人报名</a></div>
                       
                           <div> <a href="${pageContext.request.contextPath}/candidate/showcate.do" target="right">选举村干</a></div>
                        <!-- <div>
                            <a href="sendletter.html" target="right">民主监督</a></div>
                        --> <div>
                            <a href="${pageContext.request.contextPath}/decision/todecision.do" target="right">民主决策</a></div>
                           <div>
                            <a href="${pageContext.request.contextPath}/letterbox/toletterbox.do" target="right">发信箱</a></div> 
                            <div>
                            <a href="questionsbox.html" target="right">决策记录</a></div>
                           
                    </div>
                  
      <!--  <iframe src="title.html" class="title" scrolling="no" frameborder="no"> </iframe>  -->
    </div>
         
                
   </div>
   <div class="dhbg">
   <div class="rightbox" id="rightbox">
   <!-- <div id="iframeContent" style = "width: 100%;height: 1000px"></div>
    -->
   
             <iframe src="${pageContext.request.contextPath}/user/mytask.do" style = "width: 100%;height: 1000px" scrolling="no" frameborder="no" name = "right" > </iframe>
           <!-- <script type="text/javascript"> 
    $(function(){
        
        var url = "work_space.html" //被加载的页面url
        $("#rightbox").load(url,null,function(){alert("加载成功")}); 

    
    });
</script>
       -->     
   </div>
          </div>
        </div>
    
        
        
   
</body>
</html>
