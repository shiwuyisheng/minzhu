<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
   
</title>  

    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
    <script src="../js/jquery-1.4.2.min.js" type="text/javascript"></script>
   
    <script src="../layui/layui.js" charset="utf-8"></script>
<script src="../js/echarts.min.js"></script>

</head>
<body style="margin:auto">
<style>
a{color:#009688;
font-size:20px;

}
a:hover{color:blue}
</style>
<a onclick="javascript:history.go(-1);" ><i class="layui-icon layui-icon-return" style="font-size: 30px; color: #009688;"></i></a>
    <form class="layui-form" id ="form1" name="form1" > 
       
     <div class = "layui-form-item" id="options">
     <label class="layui-form-label">搜索条件</label>    
     
     <!-- <div class="layui-input-inline">
      
        <select name="post" lay-verify="required" lay-search="">
          <option value="">职位</option>
          <option value="村长">村主任</option>
          <option value="副村长">副主任</option>
          <option value="计生主任">计生主任</option>
          <option value="治保主任">治保主任</option>
          <option value="文书">文书</option>
        </select></div> -->
        <div class="layui-input-inline">
      <select name="year" id="year" lay-verify="required" lay-search="">
         <option value="">年份</option>
          <!--  <option value="1">村主任</option>
          <option value="2">副主任</option>
          <option value="3">计生主任</option>
          <option value="4">治保主任</option>
          <option value="5">文书</option> -->
        </select>
        
    </div>
    <div class="layui-input-inline">
      <select name="type" id="type" lay-search="">
      	
      	 <option value="bar">柱形图</option>
         <option value="pie">扇形图</option>
          
        </select>
        
    </div>
    <button class="layui-btn" id="search" name="search" type="button" >查询</button>
   
    </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <!--  <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
    </div>
  </div>
</form>

<!-- <div style="width: 600px;height:400px;"> -->


</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  
</fieldset>   
 
<div style="padding: 20px; background-color: #F2F2F2;">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header"></div>
        <div class="layui-card-body" style="min-height:300px;min-width:200px;max-width:500px;"  id="echart1" name="echart1" >
         
        </div>
      </div>
    </div>
    
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header"></div>
        <div class="layui-card-body" style="min-height:300px;min-width:200px;max-width:500px;"  id="echart2" name="echart2" >
         
        </div>
      </div>
    </div>
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header"></div>
        <div class="layui-card-body" style="min-height:300px;min-width:200px;max-width:500px;"  id="echart3" name="echart3">
          
        </div>
      </div>
    </div>
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header"></div>
        <div class="layui-card-body" style="min-height:300px;min-width:200px;max-width:500px;"  id="echart4" name="echart4">
          
        </div>
      </div>
    </div>
    <div class="layui-col-md12">
      <div class="layui-card">
        <div class="layui-card-header"></div>
        <div class="layui-card-body" style="min-height:300px;min-width:200px;max-width:500px;"  id="echart5" name="echart5">
          
        </div>
      </div>
    </div>
  </div>
</div> 

   <script>
layui.use('laydate', function(){
  var laydate = layui.laydate;
  
  //执行一个laydate实例
  laydate.render({
    elem: '#startDate' //指定元素
  });
   laydate.render({
    elem: '#endDate' //指定元素
  });
});
</script>

<script type="text/javascript">
posts=["村长","副村长","计生主任","治保主任","文书"];
var all = "${pageContext.request.contextPath}/elect/getElectAnalyse.do?year=2019";

var url_cunzhang = "${pageContext.request.contextPath}/elect/getElectAnalyse.do?year=2019&post=村长";
var url_fucunzhang = "${pageContext.request.contextPath}/elect/getElectAnalyse.do?year=2019&post=副村长";
dataAll = {};
function getOptions(text,data,type,post){
var option = {};
if(type == "pie") {
option = {
    title : {
        text: text,
        
        x:'center'
    },
    color: ['#009688','#3398DB','#9933FF','#00CC99','#FFCC00','#0000CC','#FF9900','#009966'],
    
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {
                        show: true,
                        type: ['pie', 'funnel']
                    },
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
    legend: {
        type: 'scroll',
        orient: 'vertical',
        right: 10,
        top: 50,
        bottom: 50,
        data: data.legendData,
        selected: data.selected
    },
    series : [
        {
           name: data,
            type: 'pie' ,
            radius : '55%',
            center: ['40%', '50%'],
            
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            } 
        }
    ]
};
}
if(type == "bar") {
option = {
    title: {
        text: text// '村长选举票数统计'
    },
    color: ['#009688','#3398DB','#9933FF','#00CC99','#FFCC00','#0000CC','#FF9900','#009966'],
    
    tooltip: {},
    legend: {
        data:data
    },
    toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {
                        show: true,
                        type: ['pie', 'funnel']
                    },
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
    xAxis: {
        data: []
    },
    yAxis: {},
    series: [{
        name: data,
        type: 'bar',
        data: []
    }]
};
}
return option;
   }
   
 myChart1 = echarts.init(document.getElementById('echart1'));
 myChart2 = echarts.init(document.getElementById('echart2'));
 myChart3 = echarts.init(document.getElementById('echart3'));
 myChart4 = echarts.init(document.getElementById('echart4'));
 myChart5 = echarts.init(document.getElementById('echart5'));
 charts=[myChart1,myChart2,myChart3,myChart4,myChart5];
 
// 显示标题，图例和空的坐标轴
for (var i = 0; i<5 ;i++){
charts[i].setOption( getOptions(posts[i]+"选举票数统计","票数","bar",posts[i]));

}

// 异步加载数据
$.ajax({
            //几个参数需要注意一下
                type: "POST",//		
						dataType : "json",//预期服务器返回的数据类型
						url : all,//url
						success : function(data ) {
						dataAll = data;
						//console.log(Object.keys(data["dataMap"]).length)
						for(var i = 0 ; i<Object.keys(data["dataMap"]).length;i++)
						charts[i].setOption({
		
		  xAxis : {
		data : data["dataMap"][posts[i]]["category"]
		},  
	series : [ {
		// 根据名字对应到相应的系列
		name : '票数',
				data : data["dataMap"][posts[i]]["datalist"]
				} ]
			});
			/* myChart2.setOption({
 
				 xAxis : {
					data : data["dataMap"]["副村长"]["category"]
				},  
				series : [ {
					// 根据名字对应到相应的系列
					name : '票数',
					data : data["dataMap"]["副村长"]["datalist"]
				} ]
			});
 */
		}
	});
	

</script>
<script type="text/javascript">
  
  $("#search").click(function(){ 
  layer = layui.layer;
  if($("#type").val() == ""  && $("year") == ""){
  	return;
  }
  
  var type = $("#type").val(); 
  var post = "村长";//$("#post").val(); 
  var year = $("#year").val(); 
  if (year == "" || year == null){
  year = 2019;}
  if (type == "" || type == null){
  type = "bar";}
  var all = "${pageContext.request.contextPath}/elect/getElectAnalyse.do?year=2019";
  
  if (type != ""  ){
  
  if (type == "pie"){
    all = "${pageContext.request.contextPath}/elect/getElectAnalysePie.do?year="+year; 
  /* myChart1.clear();

 myChart2.clear();
   myChart1.setOption( getOptions("村长选举票数统计","票数","pie","村长"));
  myChart2.setOption( getOptions("村长选举票数统计","票数","pie","副村长")); */
  
  }
  else{
   all = "${pageContext.request.contextPath}/elect/getElectAnalyse.do?year="+year; 
 /*  myChart1.setOption( getOptions("村长选举票数统计","票数","bar","村长"));
  myChart2.setOption( getOptions("村长选举票数统计","票数","bar","副村长")); */
  }
  for(var i = 0;i<5;i++){
  charts[i].clear();
  }
  $.ajax({
            //几个参数需要注意一下
                type: "POST",//		
						dataType : "json",//预期服务器返回的数据类型
						url : all,//url
						success : function(data ) {
						dataAll = data;
			for(var i = 0; i<Object.keys(data.postList).length;i++)
			{	var post = data.postList[i];
			charts[i].setOption(getOptions(post+"选举票数统计","票数",type,post));
					var option = {
					series : [ {
		// 根据名字对应到相应的系列
		name : '票数',
				data : data["dataMap"][post]["datalist"]
				} ]
			};
			
			if(type == "bar"){
			option["xAxis"]={
		data : data["dataMap"][post]["category"]}
			}	
					
						//myChart1.setOption(option);
				charts[i].setOption(option);
			//myChart2.setOption(option);

		}
		}
	});
	
  //myChart1.setOption(getOptions(myChart1,"村长投票情况","票数",type,"村长"));
  //myChart2.setOption(getOptions(myChart2,"副村长投票情况","票数",type,"副村长"));
  
  return;
  }
  $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/elect/getElectAnalyse.do?" ,//url
                data: $("#form1").serialize(),
                success: function (data) {
                dataAll = data;
               		myChart1.setOption({
		
		xAxis : {
		data : data["dataMap"]["村长"]["category"]
		},
	series : [ {
		// 根据名字对应到相应的系列
		name : '得票数',
	data : data["dataMap"]["村长"]["datalist"]
				} ]
			});
			myChart2.setOption({

				xAxis : {
					data : data["dataMap"]["副村长"]["category"]
				},
				series : [ {
					// 根据名字对应到相应的系列
					name : '得票数',
					data : data["dataMap"]["副村长"]["datalist"]
				} ]
			});
                },
                error : function() {
                   // alert("异常！");
                }
            });
  
  });
       
    </script>
 
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  $.ajax({
//提交数据的类型 POST GET
type: "POST",
//提交的网址
url: "${pageContext.request.contextPath}/elect/getYear.do?",
//提交的数据
//返回数据的格式
datatype: "json",//“xml”, “html”, “script”, “json”, “jsonp”, “text”.
//成功返回之后调用的函数
success: function (data) {
$.each(data.data, function (index, item) {
$("#year").append(new Option(item, item));// 下拉菜单里添加元素
});
layui.form.render("select");
}
});

  
  
  
});
</script>

</body>
</html>
