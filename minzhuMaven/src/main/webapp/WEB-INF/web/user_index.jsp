<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.bjjs.gov.cn/bjjs/index/index.shtml -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/北京市住房和城乡建设委员会门户网站_files/container(4).css"> 
<link href="${pageContext.request.contextPath}/北京市住房和城乡建设委员会门户网站_files/default.css" rel="stylesheet" id="lhgdialoglink">
  <title>农村民主建设网站</title>
<meta name="createDate" content="2018-12-19 17:30:10">
<meta name="cacheclearDate" content="2018-11-30 17:40:45">
<meta name="version" content="7.9.7">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="北京市住房和城乡建设委员会,市住房城乡建设委,北京市建设委员会,市建委,北京建设网">
<meta name="description" content="北京建委默认频道 北京市住房和城乡建设委员会门户网站简称北京建设网建于2001年，是北京市住房和城乡建设委员会向公众提供信息和服务的综合平台。">


<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/北京市住房和城乡建设委员会门户网站_files/container(4).css"> 
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"  media="all">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/huilan-jquery-ui.css">
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/huilan-jquery-ui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layer.css" id="layui_layer_skinlayercss" style="">
 <meta name="viewport" content="width=device-width"> 
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bjjs.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/bjjs.js"></script>
 </head>
 <body>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/skin.css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/chanelCounting.js"></script>

<style type="text/css">
   #iframeTop{
            width: 100%;
            height: 200px;
            border-width: 0;
            frameborder:"no";
            border: 0;
            marginwidth:0 ;
            marginheight:0;
        }
</style>
<iframe src="${pageContext.request.contextPath}/index_top_frame.jsp" id = "iframeTop" scrolling = "no"></iframe>

<div class="nav_bg">

	<div class="nav">
   
    
    </div>
</div>  <!--wrapper<<--> 
  <div class="wrapper"> 
   <!--w_content<<--> 
   <div class="w_content"> 
    <!--focus——pos<<--> 
    <div class="focus_pos column" id="jdt_pos" name="焦点图" runat="server">
       <div class="portlet" id="ca5fd90b68e34d648af25861148eeb14" pagemoduleid="6e4978960c9a42a38a2766ca615bd1b8">
 <div align="left" class="portlet-header" style="display: none;"> 
  <span id="menu">
        </span> 
  <div id="submenuca5fd90b68e34d648af25861148eeb14" class="shadow dn"> 
   <ul class="float_list_ul">
        </ul> 
  </div> 
 </div> 
 <div>
    <style type="text/css">
/*focus*/
.focus_pos{ float:left; width:796px;}



</style>
<div class="layui-carousel" id="test10">
  <div carousel-item="">
    <div><img  width="896" src="${pageContext.request.contextPath}/北京市住房和城乡建设委员会门户网站_files/2017110311492519519.jpg"></div>
    <div><img  width="896" src="${pageContext.request.contextPath}/images/index_img/轮播1.jpeg"></div>
    <div><img  width="896" src="${pageContext.request.contextPath}/images/index_img/轮播2.jpg"></div>
    <div><img  width="896" src="${pageContext.request.contextPath}/images/index_img/轮播3.jpg"></div>
    <div><img  width="896" src="${pageContext.request.contextPath}/images/index_img/轮播4.jpg"></div>
    <div><img  width="896" src="${pageContext.request.contextPath}/images/index_img/轮播5.jpg"></div>
    <div><img  width="896" src="${pageContext.request.contextPath}/北京市住房和城乡建设委员会门户网站_files/2017110311492519519.jpg"></div>
  </div>
</div>
<script>
layui.use(['carousel', 'form'], function(){
  var carousel = layui.carousel
  ,form = layui.form;
  //改变下时间间隔、动画类型、高度
  carousel.render({
    elem: '#test2'
    ,interval: 1800
    ,anim: 'fade'
    ,height: '120px'
  });
  
  //图片轮播
  carousel.render({
    elem: '#test10'
    ,width: '708px'
    ,height: '302px'
    ,interval: 5000
  });
  
  
  var $ = layui.$, active = {
    set: function(othis){
      var THIS = 'layui-bg-normal'
      ,key = othis.data('key')
      ,options = {};
      
      othis.css('background-color', '#5FB878').siblings().removeAttr('style'); 
      options[key] = othis.data('value');
      ins3.reload(options);
    }
  };
  
  //监听开关
  form.on('switch(autoplay)', function(){
    ins3.reload({
      autoplay: this.checked
    });
  });
  
  $('.demoSet').on('keyup', function(){
    var value = this.value
    ,options = {};
    if(!/^\d+$/.test(value)) return;
    
    options[this.name] = value;
    ins3.reload(options);
  });
  
  //其它示例
  $('.demoTest .layui-btn').on('click', function(){
    var othis = $(this), type = othis.data('type');
    active[type] ? active[type].call(this, othis) : '';
  });
});
</script>

<script>/* 
function addBtn(obj){
	var divObj = document.getElementById(obj.parentId);
	var btn =  "<div class=" + obj.btnClass + " id=" + obj.btnId + ">";
	for(var i = 1; i <= obj.len; i ++){
		btn += '<div>' + i +  '</div>';
	}
	btn += '</div>';
	$(divObj).append(btn);	
}
function addHtml(obj){
	var divObj = $(obj.contentUl);
	divObj.append(divObj.find(obj.contentLi + ":first").clone());
}
function animateFocus(obj){
	var moveObj = $(document.getElementById(obj.moveId));
	moveObj.stop().animate({
		left:- obj.s * obj.i
	},obj.t,function(){
		if(obj.i == obj.len){
			moveObj.css("left",0);	
			obj.i = 0;	
		}
	});
}
function btnCss(obj){
	var divbtn = document.getElementById(obj.btnId);
	var spanbtn = $(divbtn).find("div");
	if(obj.i == obj.len){
		spanbtn.eq(0).addClass(obj.btnChildClass).siblings().removeClass(obj.btnChildClass);	
	}
	spanbtn.eq(obj.i).addClass(obj.btnChildClass).siblings().removeClass(obj.btnChildClass);	
}
function autoPlay(obj){
	clearInterval(obj.nTime);
	obj.nTime = setInterval(function(){
		obj.i ++;
		animateFocus(obj);
		btnCss(obj);
	},obj.T);
}
function mouseSlide(obj){
	var divbtn = document.getElementById(obj.btnId);
	var spanbtn = $(divbtn).find("div");
	spanbtn.mouseenter(function(){
		clearInterval(obj.nTime);
		obj.i = $(this).index();
		animateFocus(obj);
		btnCss(obj);	
	}).eq(0).trigger("mouseenter");
	var parentDiv  = document.getElementById(obj.parentId);
	$(parentDiv).hover(function(){
		clearInterval(obj.nTime);
	},function(){
		autoPlay(obj);
	}).trigger("mouseleave");
}


//第一个a获取焦点时停止滚动
function firstAFocus(obj){
	var contentLi = $(obj.contentUl + " " + obj.contentLi);
	var mbA = document.createElement("a");
	var mbACopy = [];
	mbA.setAttribute("href","javascript:void(0)");
	function showHtml(){//第一个a获取焦点时停止滚动
		var divObj = $(obj.contentUl);
		divObj.find(obj.contentLi + ":last").css("display","block");
	}
	function hideHtml(){//第一个a获取焦点时停止滚动
		var divObj = $(obj.contentUl);
		divObj.find(obj.contentLi + ":last").css("display","none");
	}
	function aFocus(){
		clearInterval(obj.nTime);
		obj.t = 0;
		animateFocus(obj);
		btnCss(obj);
		hideHtml();
	}
	function aBlur(){
		obj.t = 500;
		autoPlay(obj);
		showHtml();
	}
	contentLi.each(function(i){
		$(this).find("a").focus(function(){
			if(i == obj.len){
				contentLi.eq(obj.len - 1).find("a:first").focus();
			}else{
				obj.i = i;
				aFocus();	
			}
		});
		$(this).find("a").blur(function(){
			if(i != obj.len){
				aBlur();	
			}	
		});
		if(i < obj.len - 1){
			mbACopy[i] = mbA.cloneNode(true);
			mbACopy[i].setAttribute("title",i);
			$(this).append(mbACopy[i]);	
			mbACopy[i].onfocus = function(){
				if(!document.keyShift){
					obj.i = i + 1;
					aFocus();
					contentLi.eq(i+1).find("a:first").focus();
				}else{
					obj.i = i;
					aFocus();
					contentLi.eq(i).find("a:first").focus();	
				}
			}
		}
    });
} */
/* function focusPic(obj){
	addBtn(obj);
	addHtml(obj);
	autoPlay(obj);
	mouseSlide(obj);
	firstAFocus(obj);//第一个a获取焦点时停止滚动
}
focusPic({
	moveId:"focus_pic", 
	parentId:"focus_show",  
	contentUl:"#focus_pic ul", 
	contentLi:"li",
	btnId:"focus_btn", 
	btnClass:"focus_btn", 
	btnChildClass:"hoverblue", 
	len:7, 
	i:0, 
	tf:true, 
	s:896, 
	t:500, 
	T:3000
}); */
</script>
 
 </div> 
</div>     </div> 
    <!--focus——pos>>--> 
    <!--login——pos<<--> 
    <div class="login_pos column" id="dl_pos" name="登录" runat="server">
      <!--  <div class="portlet" id="d420815ec71f4ae29c1506d9f4145888" pagemoduleid="f2ce260c50ce406f93a2637d00984b04"> -->
<!--  <form    method = "post" id = "form1">
<center><div   id="showResult">&nbsp;</div></center>

  <div class="layui-form-item">
    <label class="layui-form-label">账号</label>
    <div class="layui-input-inline">
      <input type="text" name="idnumber" id= "idnumber"lay-verify="title" autocomplete="off" placeholder="请输入账号/身份证号" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input type="password" name="password" id = "password" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>
 
 <style type="text/css">
 	.as{
color: gray;
a: hover:{
	color:red
}
 	}
 	
 </style>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn layui-bg-blue" id="bt-login" lay-submit="" lay-filter="demo1">登录</button>&nbsp;&nbsp;&nbsp;<a class="as">忘记密码</a>
    </div>
  </div>
</form> -->
 <div class='someclass'>
 <form class="layui-form" action="" name="form1" id="form1">

 <div class="layui-form-item">
 <label class="layui-form-label" style="font-size:23px;width:180px;color:#008B45;font-style:bold;">登录入口</label>
 </div>
 <div   id="showResult">&nbsp;</div>
 <div class="layui-form-item">
 <div class="layui-input-inline" style="width: 300px;"><input type="text" name="idnumber" id= "idnumber"  lay-verify="required" placeholder="请输入账号/身份证号" autocomplete="off" class="layui-input"></div>
 </div>
 <div class="layui-form-item">
 <div class="layui-input-inline" style="width: 300px;"><input type="password" name="password" id="password"  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input"></div>
 </div>
 <div class="layui-form-item">
   
    <div class="layui-input-inline"  style="width: 300px;" >
      <input type="radio" name="level" id = "level" value="0" title="普通用户">
      <input type="radio" name="level" id = "level" value="1" title="管理员" checked>
    </div>
  </div>
   <div class="layui-form-item">
   
    <div class="layui-input-block">
     <!--  <button class="layui-btn" id="bt-login" lay-submit lay-filter="*">登录</button> -->
    <button class="layui-btn" id="bt-login" lay-submit="" lay-filter="demo1" type="button">登录</button>
  
   <label class="layui-form-label" style="color:gray;"<a>忘记密码?</a></label>
   </div>
 
 </form>
 
  </div>
 <div>

<meta content="webkit" name="renderer">
<meta content="IE=Edge,chrome=1" http-equiv="X-UA-Compatible">
<!-- <div class="login" id="bjjslogin"> -->
<!-- <div class="login_box " style="display: block;"> -->
<!-- <form    method = "post" id = "form1">
<center><div   id="showResult">&nbsp;</div></center> -->

 <!--  <div class="layui-form-item">
    <label class="layui-form-label">账号</label>
    <div class="layui-input-inline">
      <input type="text" name="idnumber" id= "idnumber"lay-verify="title" autocomplete="off" placeholder="请输入账号/身份证号" class="layui-input">
    </div>
  </div> -->
 <!--  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input type="password" name="password" id = "password" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div> -->
 
 <style type="text/css">
 	.as{
color: gray;
a: hover:{
	color:red
}
 	}
 	
 </style>
  

 <script type="text/javascript">
 	layui.use(['form', 'layedit'], function(){
  var form = layui.form
  ,layer = layui.layer
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  
  
});


 $("#idnumber").blur(function(){
        var data = $("#idnumber").val();
        if (data == null || data == "") {
            $("#showResult").text("用户名不能为空！");
            $("#showResult").css("color","red");
            return false;
        }
        $("#showResult").text("");
        
         $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/user/checkLoginUsername.do",
            data:{"idnumber":data},
            beforeSend:function(XMLHttpRequest)
            {
                $("#showResult").text("正在查询");
	 			$("#showResult").css("color","red");
            },
            success:function(data) /*msg*/
             {
            	//$("#showResult").text(data.message); 
            	var msg = data.message;
                if(msg ==="yes"){
                    $("#showResult").text("该用户名可以被使用");
                }else if(msg === 'no'){
                    $("#showResult").text("该用户名不存在");
                    $("#showResult").css("color","red");
                }else {
                    $("#showResult").text("系统异常！");
                    $("#showResult").css("color","red");
                }
            },
            error:function()
            {
                $("#showResult").text("系统异常！");//错误处理
            }
        }); 
    });

 
    $("#bt-login").click(function(){
   
        var data = $("#idnumber").val();
        if (data == null || data == "") {
         
            $("#showResult").text("用户名不能为空！");
            $("#showResult").css("color","red");
            return false;
        }
        var data = $("#password").val();
        if (data == null || data == "") {
            $("#showResult").text("密码不能为空！");
            $("#showResult").css("color","red");
            return false;
        }
        //异步提交请求，进行验证
        $.ajax({
    	   "url":"${pageContext.request.contextPath}/user/login.do",
    	   "data":$("#form1").serialize(),//"idnumber="+$("#idnumber").val()+"&password="+$("#password").val()+"level="+$("#level").val(),
    	   "type":"POST",
    	   "dataType":"json",
    	   "success":function(obj){
   
    		   if(obj.state==1){
    			   
    			   location.href="${pageContext.request.contextPath}/user/tomain.do";
    		   }else if(obj.state==2){
    			   
    			   location.href="${pageContext.request.contextPath}/user/toadminmain.do";
    		   }else{ 
    		    $("#showResult").text(obj.message);
    		
    		   }
    	   }
       }); 
    });
</script>
 
 </div> 
</div>  
<script type="text/javascript">
//异步提交请求，进行验证
        /* $.ajax({
    	   "url":"${pageContext.request.contextPath}/communication/getInfo.do",
    	   //"data":$("#form1").serialize(),//"idnumber="+$("#idnumber").val()+"&password="+$("#password").val()+"level="+$("#level").val(),
    	   "type":"POST",
    	   "dataType":"json",
    	   "success":function(obj){
   	 			//data = obj;
    	   }
       });  */
   
</script>
<div class="portlet" id="bb97a48bdabb496ea09d97fd7501791a" pagemoduleid="ed1b4176e52c41cfaef92066ac5dd4a0">
 <div align="left" class="portlet-header" style="display: none;"> 
  <span id="menu">
        </span> 
  <div id="submenubb97a48bdabb496ea09d97fd7501791a" class="shadow dn"> 
   <ul class="float_list_ul">
        </ul> 
  </div> 
 </div> 
 <div>
  
<style type="text/css">
.qtxtdl{ overflow:hidden; margin-top:9px;}
.qtxtdl h2{ height:40px; background:#94bfdc; text-align:center;}
.qtxtdl h2 a{ line-height:40px; font-weight:normal; color:#fefefe; font-size:18px;}
h2 a.xxgk_h_a {background: #009688 !important ;}
 </style>
 </div> 
</div>     </div> 
    <!--login——pos>>--> 
   </div> 
   <!--w_content>>--> 
   <!--hotlm_pos<<--> 
   <div class="hotlm_pos column" id="rdlm_pos" name="热点栏目" runat="server">
      <div class="portlet" id="e2f984d7352641858e6b5633f79918d4" pagemoduleid="f4bfc90a94844cfcbd669256de1be3e4">
 <div align="left" class="portlet-header" style="display: none;"> 
  <span id="menu">
        </span> 
  
 <div>
  
<div class="hotlm_pos"><div class="hotlm_bg" id="hotlm_bg"><div class="hotlm_left" id="hotlm_left"></div>
<div class="hotlm_right" id="hotlm_right"></div>
<%-- <div class="hotlm" id="hotlm"><ul>
<c:forEach items="${clist}" var="item" varStatus="status">
<li><a href="http://www.bjjs.gov.cn/bjjs/gcjs/zczjxx/index.shtml" target="_blank" title="工程造价"><img alt="工程造价" height="84" src="./北京市住房和城乡建设委员会门户网站_files/2016070523221967048.png" title="工程造价" width="84"><br>
工程造价</a></li>
</c:forEach>
<!--
<li><a href="/eportal/ui?pageId=313798" target="_blank" title="住保资格评估"><img alt="住保资格评估" height="84" src="/bjjs/uiFramework/commonResource/image/2016070523224085308.png" title="住保资格评估" width="84" /><br />
住保资格评估</a></li>--><li><a href="http://www.bjjs.gov.cn/bjjs/zfbz/shfp/sqzn/index.shtml" target="_blank" title="住保申请指南"><img alt="住保申请指南" height="84" src="./北京市住房和城乡建设委员会门户网站_files/2016070523230314888.png" title="住保申请指南" width="84"><br>
住保申请指南</a></li>
<li><a href="http://www.bjjs.gov.cn/bjjs/bszn/cxzx/index.shtml" target="_blank" title="查询中心"><img alt="查询中心" height="84" src="./北京市住房和城乡建设委员会门户网站_files/2016101417375494158.png" title="查询中心" width="84"><br>
查询中心</a></li>
<li><a href="http://www.bjjs.gov.cn/bjjs/zfbz/shfp/yhjggs/index.shtml" target="_blank" title="住保摇号结果"><img alt="住保摇号结果" height="84" src="./北京市住房和城乡建设委员会门户网站_files/2016070523232278864.png" title="住保摇号结果" width="84"><br>
住保摇号结果</a></li>
<li><a href="http://www.bjjs.gov.cn/bjjs/fwgl/fwzl/index.shtml" target="_blank" title="房屋租赁"><img alt="房屋租赁" height="84" src="./北京市住房和城乡建设委员会门户网站_files/2016070523233976083.png" title="房屋租赁" width="84"><br>
房屋租赁</a></li>
<li><a href="http://www.bjjs.gov.cn/bjjs/fwgl/wyglxx/wyglpgpt/xgsm/index.shtml" target="_blank" title="物业曝光台"><img alt="物业曝光台" height="84" src="./北京市住房和城乡建设委员会门户网站_files/2016070523240337664.png" title="物业曝光台" width="84"><br>
物业曝光台</a></li>
<li><a href="http://weibo.com/u/2417827827" target="_blank" title="安居北京"><img alt="安居北京" height="84" src="./北京市住房和城乡建设委员会门户网站_files/2016070523242427332.png" title="安居北京" width="84"><br>
安居北京</a></li>
<li><a href="http://www.bjjs.gov.cn/bjjs/fwgl/zzxspzf/dtfw/index.shtml" target="_blank" title="GIS地图"><img alt="GIS地图" height="84" src="./北京市住房和城乡建设委员会门户网站_files/2016070523244057381.png" title="GIS地图" width="84"><br>
GIS地图</a></li>
<li><a href="http://www.bjjs.gov.cn/bjjs/xxgk/kjzc/index.shtml" target="_blank" title="科技之窗"><img alt="科技之窗" height="84" src="./北京市住房和城乡建设委员会门户网站_files/2016070523250155641.png" title="科技之窗" width="84"><br>
科技之窗</a></li>
<li><a href="http://www.bjjs.gov.cn/bjjs/xxgk/ztzl/gpjzsc/index.shtml" target="_blank" title="公平竞争审查"><img alt="公平竞争审查" height="84" src="./北京市住房和城乡建设委员会门户网站_files/2017110211540341597.png" title="公平竞争审查" width="84"><br>
公平竞争审查</a></li>
</ul>
 --%>

</div>
</div>
</div>
<!-- <script>
function animateTrue(obj){
	var moveObj = $(obj.moveId);
	moveObj.stop().animate({
		left:- obj.s
	},obj.t,function(){
		for(var i = 0; i < obj.len; i ++){
			$(obj.contentUl).append($("#hotlm ul li:first"));
		}
		$(this).css("left",0);
	});
}
function animateFalse(obj){
	var moveObj = $(obj.moveId);
	for(var i = 0; i < obj.len; i ++){
		$(obj.contentUl).prepend($("#hotlm ul li:last"));
	}
	moveObj.css("left",- obj.s);
	moveObj.stop().animate({
		left:0
	},obj.t);
}
function tfMousePlay(obj){
	var btnL = document.getElementById(obj.btnL);
	var btnR = document.getElementById(obj.btnR);
	btnL.onclick = function(){
		if(obj.btnTF){
			obj.btnTF = false;
			obj.tf = false;
			animateFalse(obj);
			setTimeout(function(){
				obj.btnTF = true	
			},obj.t);		
		}	
	}
	btnR.onclick = function(){
		if(obj.btnTF){
			obj.btnTF = false;
			obj.tf = true;
			animateTrue(obj);
			setTimeout(function(){
				obj.btnTF = true	
			},obj.t);		
		}
	}
}
function hotLmAFocus(obj){
	var contentLi = $(obj.contentLi);
	var moveObj = $(obj.moveId);
	var hideLen = contentLi.length - obj.showLen;
	var showLenB = Math.ceil(contentLi.length/obj.showLen);
	$(contentLi).find("a").each(function(i) {
    	$(this).get(0).onfocus = function(){
			if(document.keyValue == 9){
				var newContentLiA = $(obj.contentLi).find("a");
				var newI = newContentLiA.index($(this));
				for(var j = 0; j < showLenB; j ++){
					if(j*obj.showLen <= newI && newI < (j + 1)*obj.showLen){
						if(j == showLenB - 1){
							moveObj.css("left",- hideLen*obj.s);
						}else{
							moveObj.css("left",- j*obj.showLen*obj.s);	
						}
					}
				}
			}
		}
	});
}
function hotLM(obj){
	tfMousePlay(obj);
	hotLmAFocus(obj);
}
hotLM({
	moveId:"#hotlm ul",
	parentId:"hotlm_bg",
	contentUl:"#hotlm ul", 
	contentLi:"#hotlm ul li",
	btnL:"hotlm_left",
	btnR:"hotlm_right",
	btnTF:true,
	len:1,
	showLen:9,
	tf:true, 
	s:124, 
	t:300
});
</script>
  -->
 </div> 
</div>    </div> 
   <!--hotlm_pos>>--> 
   <!--w_content<<--> 
   <div class="w_content"> 
    <!--xxgk_pos<<--> 
    <div class="xxgk_pos column" id="xxgk_pos" name="信息公开" runat="server">
       <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/北京市住房和城乡建设委员会门户网站_files/container.css"> 
<div class="tzgg_menu portlet" id="76773a976f8f47ddbbc607e9d9903472" style="$portletStyle" pagemoduleid="2b11c3ad1c4048ed8532f350580e137e"> 
 <div align="left" class="portlet-header" style="display: none;"> 
  <span id="menu"></span> 
  <div id="submenu76773a976f8f47ddbbc607e9d9903472" class="shadow dn"> 
   <ul class="float_list_ul">
        </ul> 
  </div> 
 </div> 
</div> 
<h2 class="tzgg_h"><a class="xxgk_h_a" href="http://www.bjjs.gov.cn/bjjs/xxgk/index.shtml" title="通知公告" target="_blank">通知公告</a></h2> 
<div class="xxgk_box tzgg_box" style="display: none;">
  
<ul id="tzgg_g" opentype="more"> 
<c:forEach items="${clist}" var="item" varStatus="status">
 <li><span>[<fmt:formatDate value='${item.createDate}' type='date' pattern='yyyy-MM-dd'/>]</span><a href="${pageContext.request.contextPath}/${item.path}" onclick="void(0)" target="_blank" title="${item.title}">${item.title }</a></li>
 </c:forEach>
 <!-- <li><span>[2018-12-19]</span><a href="http://www.bjjs.gov.cn/bjjs/xxgk/qtwj/gcjsltz/gcjs_zzglxx_zcwj/530996/index.shtml" onclick="void(0)" target="_blank" title="关于北京市城苑建标工程管理有限公司逾期未参加工程造价咨询企业专项执法检查行为的通报">关于执法检查行为的通...</a></li>
 
 <li><span>[2018-12-18]</span><a href="http://www.bjjs.gov.cn/bjjs/xxgk/ztzl/lsjz/psjl/psgl/530979/index.shtml" onclick="void(0)" target="_blank" title="关于2018年度第三批绿色建筑评价标识 （运行标识）项目的公示">关于2018年度第三批绿色建筑评价标识 （运行标识）项目的公示</a></li>
 <li><span>[2018-12-18]</span><a href="http://www.bjjs.gov.cn/bjjs/fwgl/fdckfgl/csjggs/530972/index.shtml" onclick="void(0)" target="_blank" title="关于对中冶置业集团有限公司延续房地产开发企业一级资质初审结果的公示">关于对**初审结果的公示</a></li>
 <li><span>[2018-12-14]</span><a href="http://www.bjjs.gov.cn/bjjs/xxgk/gsgg/530882/index.shtml" onclick="void(0)" target="_blank" title="关于北京市房地产交易系统、存量房 交易服务平台的停网公告">关于**服务平台的停网公告</a></li>
 <li><span>[2018-12-14]</span><a href="http://www.bjjs.gov.cn/bjjs/xxgk/gsgg/530869/index.shtml" onclick="void(0)" target="_blank" title="关于北京市住建委信息系统通州搬迁项目-监理项目承担单位的遴选公告">关于**监理项目承担单位的遴选公告</a></li>
 <li><span>[2018-12-14]</span><a href="http://www.bjjs.gov.cn/bjjs/xxgk/gsgg/fwgl_fdcjy_tzgg/530844/index.shtml" onclick="void(0)" target="_blank" title="2018年11月房地产经纪、住房租赁经营业务被投诉前10名企业名单">2018年11月**被投诉前10名企业名单</a></li>
 <li><span>[2018-12-14]</span><a href="http://www.bjjs.gov.cn/bjjs/fwgl/fdckfgl/csjggs/530988/index.shtml" onclick="void(0)" target="_blank" title="关于注销北京科林房地产开发有限公司等166家房地产开发企业资质的公告">关于注**开发企业资质的公告</a></li> 
 --></ul> 

</script> 
</div>  <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/北京市住房和城乡建设委员会门户网站_files/container(1).css"> 
<div class="zwdt_menu portlet" id="3aa6b06477c74f46be48df7cb6efd130" style="$portletStyle" pagemoduleid="3f59de49feb249e8895b57074d028e36"> 
 <div align="left" class="portlet-header" style="display: none;"> 
  <span id="menu"></span> 
  <div id="submenu3aa6b06477c74f46be48df7cb6efd130" class="shadow dn"> 
   <ul class="float_list_ul">
        </ul> 
  </div> 
 </div> 
</div> 
<h2 class="zwdt_h"><a class="xxgk_h_a" href="http://www.bjjs.gov.cn/bjjs/xxgk/zwdt/index.shtml" title="政务动态" target="_blank">政务动态</a></h2> 
<div class="xxgk_box zwdt_box" style="display: none;">
  
<ul id="zwdt_g" opentype="more"> 
 <li><span>[2018-05-22]</span><a href="http://www.bjjs.gov.cn/bjjs/zfbz/zwdt/515818/index.shtml" onclick="void(0)" target="_blank" title="北京共有产权房问答（第2期）" style="color: red;">北京共有产权房问答（第2期）</a></li>
 <li><span>[2018-05-30]</span><a href="http://www.bjjs.gov.cn/bjjs/zfbz/zwdt/516279/index.shtml" onclick="void(0)" target="_blank" title="北京共有产权房问答（第3期）">北京共有产权房问答（第3期）</a></li>
 <li><span>[2018-05-15]</span><a href="http://www.bjjs.gov.cn/bjjs/zfbz/zwdt/514938/index.shtml" onclick="void(0)" target="_blank" title="北京共有产权房问答(第1期)">北京共有产权房问答(第1期)</a></li>
 <li><span>[2018-12-17]</span><a href="http://www.bjjs.gov.cn/bjjs/gcjs/zlhaqgl/gzdt/aqzljddt/530898/index.shtml" onclick="void(0)" target="_blank" title="市监督总站组织召开《塔式起重机用电安全技术研究》课题前期研讨会">市监督总站组织召开《塔式起重机用电安全技术研究》课题前期研讨会</a></li>
 <li><span>[2018-12-17]</span><a href="http://www.bjjs.gov.cn/bjjs/gcjs/zlhaqgl/gzdt/aqzljddt/530894/index.shtml" onclick="void(0)" target="_blank" title="2018年11月份建设工程安全质量市级执法抽查工作情况简报">2018年11月份建设工程安全质量市级执法抽查工作情况简报</a></li>
 <li><span>[2018-12-14]</span><a href="http://www.bjjs.gov.cn/bjjs/gcjs/zlhaqgl/gzdt/aqzljddt/530856/index.shtml" onclick="void(0)" target="_blank" title="市监督总站2018年度监督抽测项目顺利通过验收">市监督总站2018年度监督抽测项目顺利通过验收</a></li>
 <li><span>[2018-12-14]</span><a href="http://www.bjjs.gov.cn/bjjs/gcjs/zlhaqgl/gzdt/aqzljddt/530848/index.shtml" onclick="void(0)" target="_blank" title="关注水泥质量波动，严格把关混凝土质量">关注水泥质量波动，严格把关混凝土质量</a></li>
 <li><span>[2018-12-14]</span><a href="http://www.bjjs.gov.cn/bjjs/gcjs/zlhaqgl/gzdt/aqzljddt/530840/index.shtml" onclick="void(0)" target="_blank" title="北京地铁8号线三期工程永定门外站通过单位工程预验收">北京地铁8号线三期工程永定门外站通过单位工程预验收</a></li> 
</ul> 

</div>  <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/北京市住房和城乡建设委员会门户网站_files/container(2).css"> 
<div class="xwfb_menu portlet" id="e33e633e998b496cba4e724e099992ce" style="$portletStyle" pagemoduleid="771de9c6bb6b4085a46cc69715846a68"> 
 <div align="left" class="portlet-header" style="display: none;"> 
  <span id="menu"></span> 
  <div id="submenue33e633e998b496cba4e724e099992ce" class="shadow dn"> 
   <ul class="float_list_ul">
        </ul> 
  </div> 
 </div> 
</div> 
<h2 class="xwfb_h"><a class="xxgk_h_a xxgk_h_bg" href="http://www.bjjs.gov.cn/bjjs/xxgk/xwfb/index.shtml" title="新闻发布" target="_blank">新闻发布</a></h2> 
<div class="xxgk_box xwfb_box" style="display: block;">
  


<ul opentype="more"> 
 <li><span>[2018-12-14]</span><a href="http://www.bjjs.gov.cn/bjjs/xxgk/xwfb/530878/index.shtml" onclick="void(0)" target="_blank" title="线上线下“两手抓” 17家房地产经纪机构被查处">线上线下“两手抓” 17家房地产经纪机构被查处</a></li>
 <li><span>[2018-12-13]</span><a href="http://www.bjjs.gov.cn/bjjs/xxgk/xwfb/530759/index.shtml" onclick="void(0)" target="_blank" title="制定秋冬季攻坚方案，夯实施工扬尘治理措施">制定秋冬季攻坚方案，夯实施工扬尘治理措施</a></li>
 <li><span>[2018-12-13]</span><a href="http://www.bjjs.gov.cn/bjjs/xxgk/xwfb/530741/index.shtml" onclick="void(0)" target="_blank" title="践行绿色发展新理念 绘就新时代绿色建筑发展蓝图">践行绿色发展新理念 绘就新时代绿色建筑发展蓝图</a></li>
 <li><span>[2018-12-03]</span><a href="http://www.bjjs.gov.cn/bjjs/xxgk/xwfb/530057/index.shtml" onclick="void(0)" target="_blank" title="我市进一步加强公租房转租转借管理政策正式发布">我市进一步加强公租房转租转借管理政策正式发布</a></li>
 <li><span>[2018-12-03]</span><a href="http://www.bjjs.gov.cn/bjjs/xxgk/xwfb/530011/index.shtml" onclick="void(0)" target="_blank" title="常态化治理网络房源发布 7家房地产经纪机构被查处">常态化治理网络房源发布 7家房地产经纪机构被查处</a></li>
 <li><span>[2018-11-30]</span><a href="http://www.bjjs.gov.cn/bjjs/xxgk/xwfb/529963/index.shtml" onclick="void(0)" target="_blank" title="降尘除霾治污染，住建部门有新措">降尘除霾治污染，住建部门有新措</a></li>
 <li><span>[2018-11-27]</span><a href="http://www.bjjs.gov.cn/bjjs/xxgk/xwfb/529850/index.shtml" onclick="void(0)" target="_blank" title="《北京市住房城乡建设系统施工扬尘及渣土运输规范管理工作考核方案》正式发布">《北京市住房城乡建设系统施工扬尘及渣土运输规范管理工作考核方案》正式发布</a></li>
 <li><span>[2018-11-26]</span><a href="http://www.bjjs.gov.cn/bjjs/xxgk/xwfb/529760/index.shtml" onclick="void(0)" target="_blank" title="市住建委落实空气重污染预警响应 重点检查“一会三函”工地">市住建委落实空气重污染预警响应 重点检查“一会三函”工地</a></li> 
</ul> 
</div>  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/北京市住房和城乡建设委员会门户网站_files/container(3).css"> 
<div class="gwyxx_menu portlet" id="3d24904f1b164f19be07ced7f6b1c174" style="$portletStyle" pagemoduleid="a8aa94abbee545aeaab7b741929e28df"> 
 <div align="left" class="portlet-header" style="display: none;"> 
  <span id="menu"></span> 
  <div id="submenu3d24904f1b164f19be07ced7f6b1c174" class="shadow dn"> 
   <ul class="float_list_ul">
        </ul> 
  </div> 
 </div> 
</div> 
  
     </div> 
    <!--xxgk_pos>>--> 
    <!--bmdh_pos<<--> 
    <div class="bmdh_pos column" id="bmdh_pos" name="便民电话" runat="server">
    
    <div class="zfxx portlet" id="bd8edb7f807b44f482c0db3bb98e4243" style="$portletStyle" pagemoduleid="7841c57225784b58b85fcd466751a7a9"> 
 <h2><a title="政府信息公开专栏" href="javascript:void(0)" target="">政府信息公开专栏</a></h2> <ul>	   
 		<li class="li_1"><a href="http://zfxxgk.beijing.gov.cn/110016/zfxxgkzn/2017-10/09/content_b41b4ea6fe71402e940ab89b49c3e569.shtml" title="公开指南" target="_blank">公开指南</a></li>
         <li class="li_2"><a href="http://zfxxgk.beijing.gov.cn/110016/jgzz12j/list.shtml" title="公开目录" target="_blank">公开目录</a></li>
         <li class="li_3"><a href="http://zfxxgk.beijing.gov.cn/110016/zfxxgknb/list.shtml" title="公开年报" target="_blank">公开年报</a></li>
         <li class="li_4"><a href="http://www.bjjs.gov.cn/bjjs/zmhd/index.shtml#6" title="依申请公开" target="_blank">依申请公开</a></li>
         <li class="li_5"><a href="http://www.bjjs.gov.cn/bjjs/xxgk/jgsz/index.shtml" title="机构设置" target="_blank">机构设置</a></li>
         <li class="li_6"><a href="http://www.bjjs.gov.cn/bjjs/xxgk/zcjd/index.shtml" title="政策解读" target="_blank">政策解读</a></li>
         <li class="li_7"><a href="http://www.bjjs.gov.cn/bjjs/xxgk/gfxwj/index.shtml" title="规范性文件" target="_blank">规范性文件</a></li>
         <li class="li_8"><a href="http://www.bjjs.gov.cn/bjjs/xxgk/qtwj/index.shtml" title="其他文件" target="_blank">其他文件</a></li>
         <li class="li_9 long"><a href="http://www.bjjs.gov.cn/bjjs/index/zfgzndbb/index.shtml" title="政府网站工作年度报表" target="_blank">政府网站工作年度报表</a></li>
      </ul>
</div>
      </div>  
    <!--bmdh_pos>>--> 
   </div> 
   <!--w_content>>--> 
   <!--w_content<<--> 
   <div class="w_content"> 
    <!--xxgk_pos<<--> 
    <div class="xxgk_pos column" id="cxzx_pos" name="查询中心" runat="server">
       <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/北京市住房和城乡建设委员会门户网站_files/container(5).css"> 

<!-- <h2 class="cxzx_h"><a class="cxzx_a_bg" href="http://www.bjjs.gov.cn/bjjs/bszn/cxzx/index.shtml" title="查询中心" target="_blank">查询中心</a></h2>  -->
<div class="cxzx_box">
 

</div> 
<script>
mouseHover("#cxzx_pos .cxzx_box ul li","list_c");
</script>     </div> 
   
    <!--bmdh_pos>>--> 
   </div> 
   <!--w_content>>--> 
   <!--w_content<<--> 
   <div class="w_content"> 
   
    <!--xxgk_pos  h2 a.xxgk_h_a<<--> 
    <style>
    .zmhd_pos h2 a.zmhd_h_a xxgk_h_bg{background: #009688 !important ;
    } 
    </style>
    <div class="zmhd_pos" id="zmhd_pos" runat="server"> 
    
    <!--  <h2 class="zmhd_h dyjh_h"><a class="zmhd_h_a" href="http://www.bjjs.gov.cn/bjjs/zmhd/index.shtml#1" title="答疑解惑" target="_blank">答疑解惑</a></h2> 
      --><div class="zmhd_box dyjh_box column" id="dyjh_box" name="答疑解惑" runat="" style="display: none;">
        <div class="portlet" id="d936cce4013641168d347d45886d6e0e" pagemoduleid="63a2ccedf26b484aa5cd28f6859f29cf">

 <div>
 
 </div> 
</div>      </div> 
    <!--  <h2 class="zmhd_h cjwt_h"><a class="zmhd_h_a" href="http://www.bjjs.gov.cn/bjjs/zmhd/index.shtml#5" title="常见问题" target="_blank">常见问题</a></h2> 
      --><div class="zmhd_box cjwt_box" id="cjwt_box" runat="" style="display: none;"> 
      <div class="zsk_mk column" id="zsk_mk" runat="server" name="知识库">
         <div class="portlet" id="aa6beecbc8d34d0c8c544027d0033e5b" pagemoduleid="95166da5970e4b0fba46a1a14d0a2d76">

 <div>
   

<div class="zsk_nr"> 

</div> 

 </div> 
</div>       </div>
					<div class="wygl_mk column" id="wygl_mk" runat="server" name="物业管理">
						<div class="portlet" id="9fb6d641d5694adba6c0f02882a3630c"
							pagemoduleid="e89cfc37373742ab9a29c27fa12d22e2">

							<div></div>
						</div>
					</div>
					<div class="jygl_mk column" id="jygl_mk" runat="server" name="交易管理">
         <div class="portlet" id="302fba08a4de4435906e6d2bcf44daf9" pagemoduleid="ea46de37c349458c939c3252e25fdcd6">

 <div>


 </div> 
</div>       </div> 
     </div> 
    <!--  <h2 class="zmhd_h zjzbj_h"><a class="zmhd_h_a" href="http://www.bjjs.gov.cn/bjjs/zmhd/index.shtml#3" title="走进直播间" target="_blank">走进直播间</a></h2> 
     --> <div class="zmhd_box zjzbj_box column" id="zjzbj_box" name="走进直播间" runat="" style="display: none;">
        <div class="portlet" id="44e0b222dd1747e1adcd9b8cfab48403" pagemoduleid="a19e8669effe405ab74201bf6e477827">
 
 <div>


<div class="zbj" opentype="more"> 
 
</div> 
<script>
var titleObj = $("#zjzbj_title a");
var imgObj = $("#zjzbj_title_img img");
imgObj.attr("alt",titleObj.attr("title"));
imgObj.attr("title",titleObj.attr("title"));
</script> 

 </div> 
</div>      </div> 
    <!--  <h2 class="zmhd_h fzwy_h"><a href="http://www.bjjs.gov.cn/bjjs/index/fzwy/index.shtml" title="法治文艺" target="_blank">法治文艺</a></h2>  -->
    </div> 
    <div class="bmdh_pos column" id="zfxxgk_pos" name="政府信息公开" runat="server">
       <div class="portlet" id="85daaa4cf3e540fbaf1d3066d164ef81" pagemoduleid="2845c5cc6ed440a8a5f077396b2fff76">
 <div align="left" class="portlet-header" style="display: none;"> 
  <span id="menu">
        </span> 
  <div id="submenu85daaa4cf3e540fbaf1d3066d164ef81" class="shadow dn"> 
   <ul class="float_list_ul">
        </ul> 
  </div> 
 </div> 
 <div>
 
 </div> 
</div>     </div> 
    <!--bmdh_pos>>--> 
   </div> 
   <!--w_content>>--> 
   <!--lszt_pos<<--> 
   <div class="lszt_pos column" id="ztzl_pos" name="专题专栏 " runat="server">
        </div> 
   <!--lszt_pos>>--> 
  </div> 
  <!--wrapper>>--> 
  <!--bszn_box<<--> 
  <div class="bszn_box" id="bszn_box"> 
   <!--bszn_rygl_pos<<--> 
   <div class="bszn_child_pos column" id="ryzggl_pos" name="人员资格管理" runat="">
        </div> 
   <!--bszn_rygl_pos>>--> 
   <!--bszn_qygl_pos<<--> 
   <div class="bszn_child_pos column" id="qygl_pos" name="企业管理" runat="">
        </div> 
   <!--bszn_qygl_pos>>--> 
   <!--bszn_gcjs_pos<<--> 
   <div class="bszn_child_pos column" id="gcjsgl_pos" name="工程建设管理" runat="">
        </div> 
   <!--bszn_gcjs_pos>>--> 
   <!--bszn_fwgl_pos<<--> 
   <div class="bszn_child_pos column" id="fwgl_pos" name="房屋管理" runat="">
        </div> 
   <!--bszn_fwgl_pos>>--> 
   <!--bszn_qtgl_pos<<--> 
   <div class="bszn_child_pos column" id="qtgl_pos" name="其他管理" runat="">
        </div> 
   <!--bszn_qtgl_pos>>--> 
  </div> 
  <!--bszn_box>>-->

<div class="footer_bg">
	<div class="footer">
    	<div class="bot_open">
           <!--  <table cellpadding="0" cellspacing="0" border="0">
                <tbody><tr>
                    
                    <td>
                       
                    </td>
                </tr>
            </tbody></table> -->
        </div>
        <div class="bot_links">
           <table cellpadding="0" cellspacing="0" border="0">
           		<tbody><tr>
                	<td>
                    	<a href="http://www.bjjs.gov.cn/bjjs/index/fwcn/index.shtml" title="服务承诺" target="_blank">服务承诺</a>|
                        <a href="http://www.bjjs.gov.cn/bjjs/index/lxwm/index.shtml" title="联系我们" target="_blank">联系我们</a>|
                        <!--<a href="/bjjs/index/wgxx/index.shtml" title="网管信箱" target="_blank">网管信箱</a>|-->
                        <a href="http://www.bjjs.gov.cn/bjjs/index/wzsm13/index.shtml" title="网站声明" target="_blank">网站声明</a>|
                        <a href="http://www.bjjs.gov.cn/bjjs/index/wzdh/index.shtml" title="网站导航" target="_blank">网站导航</a>|
                        <a href="http://www.bjjs.gov.cn/eportal/admin" onclick="return changeURL();" title="网站维护" target="_blank">网站维护</a>
                    </td>
                   <td><script id="_jiucuo_" sitecode="1100000159" src="./北京市住房和城乡建设委员会门户网站_files/jiucuo.js"></script>
                    	<!--<span id="_span_jiucuo"><img onclick="Link(&#39;1100000159&#39;)" style="margin:0;border:0;cursor: pointer;" src="./北京市住房和城乡建设委员会门户网站_files/jiucuo.png" alt="用于页面美化的图片" title="用于页面美化的图片"></span>--></td>
                    <td>
                    	<div class="jdts" id="jdts">
                        	<a href=""><img src="./北京市住房和城乡建设委员会门户网站_files/2018041015141999806.png" width="110" height="55" alt="纪检监察监督举报" title="纪检监察监督举报"> </a>
                        </div>
                    </td>
                </tr>
           </tbody></table>
        </div>
         <div class="bot_bs">
            <span>主办：**建设委员会</span>
            <span>承办：**建设信息中心</span>
            <a href="http://www.miibeian.gov.cn/" target="_blank" title="备案编号：京ICP备17053655号">备案编号：京ICP备17053655号</a>
            <span>政府网站标识码：1100000159</span>
            <span style="display:none;">京公网安备110401300020号</span>		
            
        </div>
        <div class="bot_tj">
        	<a class="jgwab" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11040102700048" title="京公网安备 11040102700048号" target="_blank"><img src="./北京市住房和城乡建设委员会门户网站_files/2018080611174166941.png" alt="京公网安备 11040102700048号" title="京公网安备 11040102700048号">京公网安备11040102700048号</a>
        	<span>推荐使用Internet Explorer 7.0 以上版本Web浏览器，1024*768或更高分辨率</span>
        </div>
        <div class="erwm">
            <ul>
                <li>
                    <a href="http://www.bjjs.gov.cn/bjjs/index/bjzjwgfwx/index.shtml" title="官方微信" target="_blank"><img src="./北京市住房和城乡建设委员会门户网站_files/gfwx_bg.jpg" width="100" height="122" alt="官方微信" title="官方微信"></a>
                </li>
                <li>
                    <a href="http://www.bjjs.gov.cn/bjjs/index/bjzjwappyy/index.shtml" title="APP Android" target="_blank"><img src="./北京市住房和城乡建设委员会门户网站_files/android_app.gif" width="99" height="122" alt="APP Android" title="APP Android"></a>
                </li>
               
            </ul>
        </div>
    </div>
</div>
<div class="baidu">
<script type="text/javascript">
    		var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    		document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F9ac0f18d7ef56c69aaf41ca783fcb10c' type='text/javascript'%3E%3C/script%3E"));
</script><script src="./北京市住房和城乡建设委员会门户网站_files/h.js" type="text/javascript"></script><a href="http://tongji.baidu.com/hm-web/welcome/ico?s=9ac0f18d7ef56c69aaf41ca783fcb10c" target="_blank" title="网站统计">网站统计</a>
</div>
<div class="jdts_bg" id="jdts_bg"></div>
<div class="jdts_wrap" id="jdts_wrap">
    <span class="jdts_close" id="jdts_close"><img src="./北京市住房和城乡建设委员会门户网站_files/2018041010234570217.png" alt="关闭按钮" title="关闭按钮"></span>
    <img src="北京市住房和城乡建设委员会门户网站_files/1.jpg" alt="纪检监察监督举报" usemap="#jdtsmap" title="纪检监察监督举报">
    <map id="jdtsmap" name="jdtsmap">
    <area coords="356,180,566,204" shape="rect" target="_blank" href="http://www.bjjs.gov.cn/bjjs/zmhd/bmfwdh/index.shtml" alt="其他事项便民服务电话" title="其他事项便民服务电话">
    <area coords="356,226,440,250" shape="rect" target="_blank" href="http://www.bjjs.gov.cn/bjjs/zmhd/index.shtml#2" alt="业务投诉" title="业务投诉">
    </map>
</div>   
<script>
/* function jdtsAnimate(obj){
	$(obj.onBtn).click(function(){
		$("#jdts_bg,#jdts_wrap").css("display","block");	
	});
	$(obj.offBtn).click(function(){
		$("#jdts_bg,#jdts_wrap").css("display","none");	
	});
	$(obj.offBtn).hover(function(){
		$(this).find("img").attr("src","/bjjs/resource/cms/2018/04/2018041010270857770.png");	
	},function(){
		$(this).find("img").attr("src","/bjjs/resource/cms/2018/04/2018041010234570217.png");
	});
}
jdtsAnimate({
	onBtn:"#jdts",
	offBtn:"#jdts_close"
}); */
</script>  <script>

//首页信息公开选项卡
tabSwitch("#xxgk_pos .xxgk_h_a","#xxgk_pos .xxgk_box","xxgk_h_bg");
function zmhdAddIframe(obj){
	if(obj.find("iframe").length != 1){
		obj.append($(dyjhIfrUrl));	
	}	
}
function tabSwitchZmhd(btn,box,btnclass){
	var btn = $(btn);
	var box = $(box);
	function mouseSwitch(i){
		btn.removeClass(btnclass).eq(i).addClass(btnclass);	
		box.hide().eq(i).show();
		if(i == 1){
			zmhdAddIframe(box.eq(i));	
		}
	}
	mouseSwitch(0);
	btn.each(function(i){
		btn[i].onmouseover = function(){
			mouseSwitch(i);
		}
    });
}//选项卡
tabSwitchZmhd("#zmhd_pos .zmhd_h_a","#zmhd_pos .zmhd_box","xxgk_h_bg");	
//办事指南box取消区域属性
/* function bsznRemoveRunat(){
	var boxs = $("#bszn_box .bszn_child_pos");
	boxs.each(function(i) {
        $(this).attr("runat","");
    });
} */
/* bsznRemoveRunat();
//办事指南弹出页消除最后links的边框
function borderNone(obj){
var bszn_box = document.getElementById(obj.box);
$(bszn_box).find(obj.boxB).each(function(i){
	$(this).find(obj.links + ":last").css("border","none");
});	
}
//办事指南添加黑背景
function addBlackBg(obj){
	var	div = document.createElement("div");
	div.className = obj.blackBg;
	div.setAttribute("id",obj.blackBg);
	document.getElementsByTagName("body")[0].appendChild(div);
}
function blackBgShow(obj){
	var bg_div = document.getElementById(obj.blackBg);
	bg_div.style.display = "block";
	$(bg_div).stop().animate({
		opacity:0.5	

	},obj.t);
} *//* 
function animateSlide(obj){
	var bszn_box = document.getElementById(obj.box);
	var bszn_boxBOne = $(bszn_box).find(obj.boxB).eq(obj.boxBI);
	var bszn_boxSOne = bszn_boxBOne.find(obj.boxS);
	bszn_boxBOne.css({"display":"block","height":0,"marginTop":0});
	bszn_boxSOne.css("marginTop",-obj.boxBOneH/2);
	bszn_boxBOne.stop().animate({
		height:obj.boxBOneH,
		marginTop:-obj.boxBOneH/2
	},obj.t);
	bszn_boxSOne.stop().animate({
		marginTop:0	
	},obj.t);	
}
function bsznHide(obj){
	var bg_div = document.getElementById(obj.blackBg);
	var bszn_box = document.getElementById(obj.box);
	var bszn_boxBOne = $(bszn_box).find(obj.boxB).eq(obj.boxBI);
	var off_btn =  bszn_boxBOne.find("." + obj.off);
	bg_div.onclick = function(){
		this.style.display = "none";
		bszn_boxBOne.css("display","none");	
	}
	off_btn.get(0).onclick = function(){
		bg_div.style.display = "none";
		bszn_boxBOne.css("display","none");		
	}
	//无障碍
	off_btn.get(0).onfocus = function(){
		if(document.keyValue == 9){
			bg_div.style.display = "none";
			bszn_boxBOne.css("display","none");
			$(obj.btn).eq(obj.boxBI).focus();
		}		
	}
	 bszn_boxBOne.find("a:first").get(0).onblur = function(){
		 if(document.keyValue == 9 && document.keyShift){
			bg_div.style.display = "none";
			bszn_boxBOne.css("display","none");
			$(obj.btn).eq(obj.boxBI).focus();
		}
	}
	//无障碍
}
function bsznBtnClick(obj){
	var bszn_box = document.getElementById(obj.box);
	var bszn_boxB = $(bszn_box).find(obj.boxB);
	$(obj.btn).each(function(i) {
        if(i < 5){
			$(this)[0].onclick = function(){
				obj.boxBI = i;
				obj.boxBOneH = bszn_boxB.eq(i).height();
				animateSlide(obj);
				blackBgShow(obj);
				bsznHide(obj);
				//无障碍
				if(document.keyValue == 13){
					bszn_boxB.eq(i).find("a:first").get(0).focus();
				}
				//无障碍
				return false;
			}	
		}
    });
}
function bsznShow(obj){
	borderNone(obj);
	addBlackBg(obj);
	bsznBtnClick(obj);
}
 */
//首页办事指南链接替换
$("#bszn_pos ul li a[href='javascript:void(0)']").attr("href","http://banshi.beijing.gov.cn/bmfw/?ppid=1003&pid=2004&id=30&did=18");
//政民互动区域取消与添加
function zmhdRunat(obj){
	$(obj.wrap).attr("runat","server").find(obj.removeR).attr("runat","");
}
zmhdRunat({
	wrap:"#zmhd_pos",
	removeR:".zmhd_box",
});
</script>
<!--转换时间格式-->
<script type="text/javascript">
 function dateToStr(date) {

 var time = new Date(date);
 
 var y = time.getFullYear();
  
 var M = time.getMonth() + 1;
 M = M < 10 ? ("0" + M) : M;
 var d = time.getDate();
 d = d < 10 ? ("0" + d) : d;
 var h = time.getHours();
 h = h < 10 ? ("0" + h) : h;
 var m = time.getMinutes();
 m = m < 10 ? ("0" + m) : m;
 var s = time.getSeconds();
 s = s < 10 ? ("0" + s) : s;
 var str = y + "-" + M + "-" + d ;//+ " " + h + ":" + m + ":" + s;
 console.log(str);
 return str;
 }


<div style="display:none" easysite="easysiteHiddenDiv">
<input type="hidden" id="currentLoginUserLoginName">
<input type="hidden" id="currentLoginUserLoginId">
</div> 
</body></html>