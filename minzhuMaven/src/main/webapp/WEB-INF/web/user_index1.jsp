<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>闲言轻博客</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/mian.css">
	<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript"></script>
	
</head>
<body class="lay-blog">
		<div class="header">
			<div class="header-wrap">
				<h1 class="logo pull-left">
					<a href="index.html">
						<img src="../res/static/images/logo.png" alt="" class="logo-img">
						<img src="../res/static/images/logo-text.png" alt="" class="logo-text">
					</a>
				</h1>
				<form class="layui-form blog-seach pull-left" action="">
					<div class="layui-form-item blog-sewrap">
					    <div class="layui-input-block blog-sebox">
					      <i class="layui-icon layui-icon-search"></i>
					      <input type="text" name="title" lay-verify="title" autocomplete="off"  class="layui-input">
					    </div>
					</div>
				</form>
				<div class="blog-nav pull-right">
					<ul class="layui-nav pull-left">
					  <li class="layui-nav-item layui-this"><a href="index.html">首页</a></li>
					  <li class="layui-nav-item"><a href="message.html">留言</a></li>
					  <li class="layui-nav-item"><a href="about.html">关于</a></li>
					</ul>
					<a href="#" class="personal pull-left">
						<i class="layui-icon layui-icon-username"></i>
					</a>
				</div>
				<div class="mobile-nav pull-right" id="mobile-nav">
					<a href="javascript:;">
						<i class="layui-icon layui-icon-more"></i>
					</a>
				</div>
			</div>
			<ul class="pop-nav" id="pop-nav">
				<li><a href="index.html">首页</a></li>
				<li><a href="message.html">留言</a></li>
				<li><a href="about.html">关于</a></li>
			</ul>
		</div>
		<div class="container-wrap" id="cont">
			<div class="container">
		<iframe class="right" src="${pageContext.request.contextPath}/mytask.do" style = "width: 100%; min-height:600px" scrolling="no" frameborder="no" id = "right" name = "right" > 
  
  </iframe>
					<!-- <div class="contar-wrap">
						<h4 class="item-title">
							<p><i class="layui-icon layui-icon-speaker"></i>公告：<span>欢迎来到我的轻博客</span></p>
						</h4>
						<div class="item">
							<div class="item-box  layer-photos-demo1 layer-photos-demo">
								<h3><a href="details.html">拥有诗意的心态,才能拥有诗意的生活</a></h3>
								<h5>发布于：<span>刚刚</span></h5>
								<p>父爱如山，不善表达。回想十多年前，总记得父亲有个宽厚的肩膀，小小的自己跨坐在上面，越过人山人海去看更广阔的天空，那个时候期望自己有一双翅膀，能够像鸟儿一样飞得高，看得远。虽然父亲有时会和自己开玩笑，但在做错事的时候会受到严厉的训斥。父亲有双粗糙的大手掌，手把手教我走路、骑车，却会在该放手的时刻果断地放开让自己去大胆尝试，那个时候期望快快长大，能够做自己想做的事，不用受父亲的“控制”。父亲是智慧树，他无所不知、无所不晓，虽然你有十万个为什么，但是也难不倒他。</p>
								<img src="../res/static/images/item.png" alt="">
							</div>
							<div class="comment count">
								<a href="details.html#comment">评论</a>
								<a href="javascript:;" class="like">点赞</a>
							</div>
						</div>
						<div class="item">
							<div class="item-box  layer-photos-demo2 layer-photos-demo">
								<h3><a href="details.html">拥有诗意的心态,才能拥有诗意的生活</a></h3>
								<h5>发布于：<span>刚刚</span></h5>
								<p>父爱如山，不善表达。回想十多年前，总记得父亲有个宽厚的肩膀，小小的自己跨坐在上面，越过人山人海去看更广阔的天空，那个时候期望自己有一双翅膀，能够像鸟儿一样飞得高，看得远。虽然父亲有时会和自己开玩笑，但在做错事的时候会受到严厉的训斥。父亲有双粗糙的大手掌，手把手教我走路、骑车，却会在该放手的时刻果断地放开让自己去大胆尝试，那个时候期望快快长大，能够做自己想做的事，不用受父亲的“控制”。父亲是智慧树，他无所不知、无所不晓，虽然你有十万个为什么，但是也难不倒他。</p>
								<img src="../res/static/images/item.png" alt="">
							</div>
							<div class="comment count">
								<a href="details.html#comment">评论</a>
								<a href="javascript:;" class="like">点赞</a>
							</div>
						</div>
						<div class="item">
							<div class="item-box  layer-photos-demo3 layer-photos-demo">
								<h3><a href="details.html">拥有诗意的心态,才能拥有诗意的生活</a></h3>
								<h5>发布于：<span>刚刚</span></h5>
								<p>父爱如山，不善表达。回想十多年前，总记得父亲有个宽厚的肩膀，小小的自己跨坐在上面，越过人山人海去看更广阔的天空，那个时候期望自己有一双翅膀，能够像鸟儿一样飞得高，看得远。虽然父亲有时会和自己开玩笑，但在做错事的时候会受到严厉的训斥。父亲有双粗糙的大手掌，手把手教我走路、骑车，却会在该放手的时刻果断地放开让自己去大胆尝试，那个时候期望快快长大，能够做自己想做的事，不用受父亲的“控制”。父亲是智慧树，他无所不知、无所不晓，虽然你有十万个为什么，但是也难不倒他。</p>
								<img src="../res/static/images/item.png" alt="">
							</div>
							<div class="comment count">
								<a href="details.html#comment">评论</a>
								<a href="javascript:;" class="like">点赞</a>
							</div>
						</div>
					</div> -->
					<div class="item-btn">
						<button class="layui-btn layui-btn-normal">下一页</button>
					</div>
			</div>
		</div>
		<div class="footer">
			<p>
				<span>&copy; 2018</span>
				<span><a href="http://www.layui.com" target="_blank">layui.com</a></span> 
				<span>MIT license</span>
			</p>
			<p><span>人生就是一场修行</span></p>
		</div>
	
	<script>
		layui.config({
		  base: '${pageContext.request.contextPath}/res/static/js/blog.js' 
		}).use('blog');	
	</script>
	
</body>
</html>