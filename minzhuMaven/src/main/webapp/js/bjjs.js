function tabSwitchFocus(btn,box,btnclass){
	var btn = $(btn);
	var box = $(box);
	function mouseSwitch(i){
		btn.removeClass(btnclass).eq(i).addClass(btnclass);	
		box.hide().eq(i).show();
	}
	mouseSwitch(0);
	btn.each(function(i){
		btn[i].onmouseover = function(){
			mouseSwitch(i);
		}
		box[i].childs = box[i].getElementsByTagName("*");;
		box[i].focusChilds = [];
		for(var j = 0; j < box[i].childs.length; j ++){
			if(box[i].childs[j].nodeName == "A" || box[i].childs[j].nodeName == "INPUT" || box[i].childs[j].nodeName == "SELECT"){
				box[i].focusChilds[box[i].focusChilds.length] = box[i].childs[j];
			}
		}
		btn[i].oldBlur = btn[i].onblur;
		btn[i].oldFocus = btn[i].onfocus;
		if(box[i].childs.length > 2){
			btn[i].onblur = function(){
				if(document.keyValue == 9 && !document.keyShift && !document.keyAlt && !document.keyCtrl){
					if(typeof this.oldBlur == "function"){
						this.oldBlur();	
					}
					if(box[i].focusChilds.length > 0){
						box[i].focusChilds[0].focus();		
					}
					if(i != box.length - 1){
						box[i].focusChilds[box[i].focusChilds.length - 1].onblur = function(){
							btn[i+1].focus();	
						};	
					}
				}else{
					if(typeof this.oldBlur == "function"){
						this.oldBlur();	
					}
				}
			}
		}else{
			var ifr = box[i].getElementsByTagName("iframe");
			if(ifr.length > 0){
				var mbA = document.createElement("a");
				mbA.setAttribute("href","javascript:void(0)");
				mbA.setAttribute("title",btn[i].getAttribute("title"));
				var mbACopy = mbA.cloneNode(true);
				box[i].appendChild(mbA);
				box[i].insertBefore(mbACopy,ifr[0]);
			}
			btn[i].onfocus = function(){
				if(document.keyValue == 9 && !document.keyShift && !document.keyAlt && !document.keyCtrl){
					if(typeof this.oldFocus == "function"){
						this.oldFocus();	
					}
					var ifrSiblingsA = box[i].getElementsByTagName("a");
					ifrSiblingsA[0].onfocus = function(){
						btn[i].style.backgroundColor = "blue";
						btn[i].style.color = "yellow";
						
					}
					ifrSiblingsA[0].onblur = function(){
						btn[i].style.backgroundColor = "";
						btn[i].style.color = "";	
					}
					ifrSiblingsA[1].onfocus = function(){
						if(i != btn.length -1){
							btn[i+1].focus();	
						}
						
					}
					ifrSiblingsA[0].focus();
				}else{
					if(typeof this.oldFocus == "function"){
						this.oldFocus();	
					}
				}
			}
		}
    });
}//焦点切换


function tabSwitch(btn,box,btnclass,j){
	var btn = $(btn);
	var box = $(box);
	function mouseSwitch(i){
		btn.removeClass(btnclass).eq(i).addClass(btnclass);	
		box.hide().eq(i).show();
	}
	if(typeof(j) == "number"){
		mouseSwitch(j);
	}else{
		mouseSwitch(0);
	}
	btn.each(function(i){
		btn[i].onmouseover = function(){
			mouseSwitch(i);
		}
    });
}//选项卡

function mouseHover(objBtn,btnClass){
	$(objBtn).hover(function(){
		$(this).addClass(btnClass);	
	},function(){
		$(this).removeClass(btnClass);	
	});	
}//鼠标滑入滑出

//input获得焦点value值
function showIpt(iptI){
	for(var i = 0; i < iptI.length; i ++){
		iptI[i].iptT = iptI[i].getAttribute("value");
		iptI[i].onfocus = function(){
			if(this.value == this.iptT){
				this.value = "";
			}	
		}
		iptI[i].onblur = function(){
			if(this.value == ""){
				this.value = this.iptT;
			}	
		}	
	}
} 
//网站元素获取焦点
$(function(){
function eachDocument(){
var eles = document.getElementsByTagName("*");
function eleA(obj){
	if(!obj.getAttribute("href")){
		obj.setAttribute("href","javascript:void(0)");
		obj.setAttribute("target","");	
	}
	if(!obj.getAttribute("title")){
		if(obj.innerHTML && obj.innerHTML != " "){
			var eleImg = obj.getElementsByTagName("img");
			if(eleImg.length){
				var imgAlt = eleImg[0].getAttribute("alt");
				if(imgAlt){
					obj.setAttribute("title",imgAlt);	
				}else{
					obj.setAttribute("title","图片链接");	
				}
			}else{
				obj.setAttribute("title",$(obj).text());
			}	
		}else{
			if(obj.getAttribute("name")){
				obj.setAttribute("title","用作网页定位的锚点");	
			}else{
				obj.setAttribute("title","链接");	
			}
		}
	}
}
function aFocus(elesA){
	function eleFocus(obj){
		if(document.keyValue == 9 || document.keyValue == 66 || document.keyValue == 67 || document.keyValue == 75 || document.keyValue == 90){
			if(typeof obj.onmouseover == "function"){	
				obj.onmouseover();
			}
			obj.style.backgroundColor = "blue";
			obj.style.color = "yellow";	
		}
	}
	function eleBlur(obj){
		obj.style.backgroundColor = "";
		obj.style.color = "";
	}
	elesA.oldAMouseDown = elesA.onmousedown;
	elesA.oldAFocus = elesA.onfocus;
	elesA.oldABlur =  elesA.onblur;
	elesA.onmousedown = function(){
		if(typeof this.oldAMouseDown == "function"){
			this.oldAMouseDown();	
		}
		document.keyValue = null;	
	}
	elesA.onfocus = function(){
		if(typeof this.oldAFocus == "function"){
			this.oldAFocus();	
		}
		eleFocus(this);	
	}
	elesA.onblur = function(){
		if(typeof this.oldABlur == "function"){
			this.oldABlur();	
		}
		eleBlur(this);	
	}
}
function inputFocus(elesInput){
	if(elesInput.getAttribute("type") == "text"){
		elesInput.oldInputBlur = elesInput.onblur;
		elesInput.oldInputFocus = elesInput.onfocus;
		elesInput.onfocus = function(){
			if(typeof this.oldInputFocus == "function"){
				this.oldInputFocus();		
			}
			document.inputFocus = true;
		}
		elesInput.onblur = function(){
			if(typeof this.oldInputBlur == "function"){
				this.oldInputBlur();		
			}
			document.inputFocus = false;
		}
	}
}
function eleImg(obj){
	if(!obj.getAttribute("alt")){
		var eleParentTitle = obj.parentNode.getAttribute("title");
		if(eleParentTitle && eleParentTitle != "图片链接"){
			obj.setAttribute("alt",eleParentTitle);
			obj.setAttribute("title",eleParentTitle);
		}else{
			obj.setAttribute("alt","用于页面美化的图片");	
			obj.setAttribute("title","用于页面美化的图片");	
		}
	}else if(!obj.getAttribute("title")){
		obj.setAttribute("title",obj.getAttribute("alt"));	
	}	
}
function eleSelect(obj){
	if(!obj.getAttribute("title")){
		if(obj.options.length > 0){
			obj.setAttribute("title",obj.options[0].value);	
		}
	}	
}
function eleInput(obj){
	if(obj.getAttribute("type") == "image"){
		if(!obj.getAttribute("alt")){
			obj.setAttribute("alt","图片按钮");
			obj.setAttribute("title","图片按钮");	
		}
	}else if(obj.getAttribute("type") == "submit" || obj.getAttribute("type") == "button"){
		if(!obj.getAttribute("title") && !obj.value){
			obj.setAttribute("title","按钮");
			obj.value = "按钮";	
		}else if(!obj.value){
			obj.value = obj.getAttribute("title");	
		}else if(!obj.getAttribute("title")){
			obj.setAttribute("title",obj.value);
		}
	}else if(obj.getAttribute("type") == "text"){
		if(!obj.getAttribute("title") && !obj.value){
			obj.setAttribute("title","请输入关键词");	
		}else if(!obj.getAttribute("title")){
			obj.setAttribute("title",obj.value);	
		}
	}	
}
for(var i = 0; i < eles.length; i ++){
	if(eles[i].nodeName == "A"){
		eleA(eles[i]);
		aFocus(eles[i]);
	}else if(eles[i].nodeName == "IMG"){
		eleImg(eles[i]);
	}else if(eles[i].nodeName == "SELECT"){
		eleSelect(eles[i]);
	}else if(eles[i].nodeName == "INPUT"){
		eleInput(eles[i]);
		inputFocus(eles[i]);
	}
}	
}
eachDocument();	
})
var regionValue = null;
function shortcutKey(code){
	var divs = document.getElementsByTagName("div");
	var divRegion = [];
	var divFirstChilds = [];
	for(var i = 0; i < divs.length; i ++){
		if((divs[i].className == "header_bg" ||divs[i].className == "nav_bg" || divs[i].getAttribute("runat") == "server" || divs[i].className == "footer_bg") && $(divs[i]).is(":visible")){
			var divChilds = divs[i].getElementsByTagName("*");
			if(divChilds.length > 0){
				for(var j = 0; j < divChilds.length; j ++){
					if(divChilds[j].nodeName == "A" || divChilds[j].nodeName == "INPUT" || divChilds[j].nodeName == "SELECT"){
						divRegion[divRegion.length] = divs[i];
						divFirstChilds[divFirstChilds.length] = divChilds[j];
						break;	
					}
				}
			}
		}
	}
	function scrollHeight(i){
		if(divRegion.length == divFirstChilds.length){
			$('html,body').stop().animate({scrollTop:$(divRegion[i]).offset().top},200);	
		}else{
			$('html,body').stop().animate({scrollTop:$(divFirstChilds[i]).offset().top},200);
		}
		divFirstChilds[i].focus();
	}
	if(document.keyAlt && !document.keyShift && !document.keyCtrl){
		if(code == 75){//K
			regionValue = 1;
			scrollHeight(regionValue);	
		}else if(code == 67){//C
			regionValue = 2;
			scrollHeight(regionValue);	
		}
	}else if(document.keyAlt && !document.keyShift && document.keyCtrl){
		if(code == 67){//C
			regionValue = 2;
			scrollHeight(regionValue);	
		}
	}else if(document.keyAlt && document.keyShift && document.keyCtrl){
		if(code == 66){//B
			regionValue = divFirstChilds.length -1;
			scrollHeight(regionValue);	
		}
	}else if(!document.keyAlt && !document.keyShift && document.keyCtrl && code == 90){
		if(!document.inputFocus){
			if(regionValue != null){
				if(regionValue == divFirstChilds.length -1){
					regionValue = 0;	
				}else{
					regionValue ++;
				}
			}else{
				regionValue = 0;	
			}
			scrollHeight(regionValue);
		}
	}else if(!document.keyAlt && document.keyCtrl && document.keyShift && code == 90){
		if(regionValue != null){
			if(regionValue == 0){
				regionValue = divFirstChilds.length -1;	
			}else{
				regionValue --;
			}
		}else{
			regionValue = divFirstChilds.length -1;	
		}
		scrollHeight(regionValue);	
	}	
	
}
$(document).keydown(function(e){
	var ev = window.event || e;
	var code = ev.keyCode || ev.which;
	document.keyValue = code;
	document.keyShift = ev.shiftKey;
	document.keyAlt = ev.altKey;
	document.keyCtrl = ev.ctrlKey;
	shortcutKey(code);
});
	
//分页去边框
$(function(){
$(".list_feny .ym a").each(function() {
	if($(this).text().indexOf("...") != -1){
		$(this).css("border",0);	
	}
});	
});

//办事指南办理时间、地点和电话查询地址中文转换
function UrlZH(obj){
	var url = obj.href;
	var urlH = url.substring(0,url.indexOf("SXMC=") + 5);
	var urlF = url.substring(url.indexOf("SXMC=") + 5);
	url = urlH + encodeURIComponent(urlF);
	obj.href = url;	
}

$(function(){
//ie 
if (!!window.ActiveXObject || "ActiveXObject" in window){
	$("#bsfw_bssx a").each(function(i) {
        if($(this).text() == "点击查看"){
			UrlZH($(this).get(0));
		}
    });
}	
})