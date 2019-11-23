<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>农村民主建设信息管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/mian.css">
	<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript"></script>
	
</head>
<style>
.lay-bolg .header{
height:200px !important;
}
.lay-bolg .layui-container {



width:100% !important;
}
</style>
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
        #content{
            width: 100%;
            height: 500px;
            border-width: 0;
            frameborder:"no";
            border: 0;
            marginwidth:0 ;
            marginheight:0;
        }
        <style type="text/css">
        div:nth-child(1) {
            width: 450px;
            height: 650px;
            background-color: lightskyblue;
            margin: 30px auto;
            color: #333;
            box-shadow: 2px 2px 2px #808080
        }

        h2 {
            text-align: center;
            margin-bottom: -10px;
        }
        div:nth-child(2) {
            width: 400px;
            height: 500px;
            border: 4px double green;
            background-color: #efefef;
            margin: 20px auto 10px;
        }

        ul {
            list-style: none;
            line-height: 2em;
            /*border: 1px solid red;*/
            overflow: hidden;
            padding: 15px;
        }
        table {
            width: 90%;
            height:80px;
            margin: auto;
        }

        textarea{
            /*width: 300px;*/
            border: none;
            resize: none;
            background-color: lightyellow;

        }
        button {
            width: 60px;
            height: 40px;
            background-color: seagreen;
            color: white;
            border: none;
            /*text-align: left;*/

        }
        button:hover {
            cursor: pointer;
            background-color: green;
        }
    </style>
</style>
<body >
<div id="content">
	 <h2>机器人客服</h2>
    <div contenteditable="true">
        <ul>
            <li></li>
        </ul>
    </div>
    <center>
  
            <td align="right"><textarea cols="40" rows="2" name="text" onkeydown="addComment(this)" autofocus></textarea></td>
            <!--<td align="right"><input type="text" name="text" onkeydown="addComment(this)" autofocus></td>-->
          <button type=button>发送</button>
    </center>
</div>
<script type="text/javascript">
    //获取到页面中的按钮,文本域,对话内容区
    var btn = document.getElementsByTagName('button')[0];
    var text = document.getElementsByName('text')[0];
    var list = document.getElementsByTagName('ul')[0];
    var sum = 0;
    //添加按钮点击事件,获取用户数据并推送到对话窗口中
    btn.onclick=function talk(){
        // console.log(text.value);
        //获取用户提交的内容
        if(text.value.length===0){
            alert('好歹说点啥嘛！！！');
            return false;
        }
        var userComment=text.value;
        //立即清空用户信息区
        text.value='';
        //创建一个新节点li
        var li=document.createElement('li');
        var userPic='<img src="images/user.jpg" width="30" style="border-radius: 50%">';
        li.innerHTML=userPic+'用户：'+'<br>'+'<span style="color:red">'+userComment+'</span>'+'     ';
        //将新节点插入到对话列表中
        list.appendChild(li);
        sum+=1;
        //设置用户输入的信息右侧显示
        li.style.textAlign="right";
        // 定时器，2秒后执行
        setTimeout(function(){
            var info=['来啦，老弟！','来唠嗑吧！！！','没事来看看我！','好开心！','人家不高兴了啦！'];
            var temp=info[Math.floor(Math.random()*5)];//获取随机的内容
            var reply = document.createElement('li');  /*创建新元素用来保存回复内容*/
            var kefupic='<img src="images/kf.jpg" width="30" style="border-radius:50%;">';
            reply.innerHTML=kefupic+'客服：'+'<br>'+'     '+'<span style="color:#000;">'+temp+'</span>';
            list.appendChild(reply);//将回复内容添加到窗口中
            sum+=1;
            //设置回复信息左侧显示
            reply.style.textAlign="left";
        },2000);
        //如果回复内容大于6条则清空聊天窗口
        if(sum>26){
            list.innerHTML='';//清空对话窗口内容
            sum=0;//清空计数器
        }
    }
    //回车键发送信息
    function addComment(comment){
        if(event.keyCode ===13){
            // console.log('aaa');
            btn.onclick();
        }
    }


</script>
</body>
</html>