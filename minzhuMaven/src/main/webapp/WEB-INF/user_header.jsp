<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
    学生信息管理系统模板 - 源码之家
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
                        <!-- <li><a href="EducationCenter/Score.aspx.html"></a></li> -->
                        <li><a href="juece.html">民主决策</a></li>
                        <li><a href="letterbox.html">信箱管理</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
   
    <div style="text-align:center;">

</div>
</body>
</html>
