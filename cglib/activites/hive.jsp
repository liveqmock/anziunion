<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="hive" />
</jsp:include>
	<style>

	</style>
	<!--[if IE]><script type="text/javascript" src="/js/excanvas.compiled.js"></script><![endif]-->
	

	<div class="main cs">
		
		<div class="aside">
			<dl>
				<dt><i class="icon icon-iconfontliubianxing"></i>云蜂巢系统</dt>
				<%-- <dd><i class="icon icon-chanpinleimu"></i><a href="vipCardList.shtml">会员卡列表</a></dd>
				<dd><i class="icon icon-fabu"></i><a href="vipCard.shtml">发布会员卡</a></dd>
				<dd><i class="icon icon-dongtai"></i><a href="vipCardOrder.shtml">会员卡订单数据</a></dd>
				<dd><i class="icon icon-huiyuan"></i><a href="getUserVipList.shtml">推广返利</a></dd> --%>
				<dd class="active"><i class="icon icon-lianmeng"></i><a href="gethiveaction.shtml">云蜂巢</a></dd>
				<dd><i class="icon icon-tuiguangshuoming"></i><a href="hive_explain.shtml">推广说明</a></dd>
				<dd><i class="icon icon-yaoqing"></i><a href="hive_pop.shtml">推广账号</a></dd>
			</dl>
		</div>


		<h2 class="tle">
			<i class="icon icon-lianmeng"></i>蜂巢系统
			<small>用户、代理商户分润系统，你可以享受你的代理商业绩分成</small>

			<c:if test="${hive_flag eq '1'}"><a href="/getuserhiveaction.shtml" class="btn btn_red">用户云蜂巢系统</a></c:if>
			<c:if test="${hive_flag eq '0'}"><a href="/gethiveaction.shtml" class="btn btn_blue">商户云蜂巢系统</a></c:if>
		</h2>
		<br>

	
	
		

		<!-- 
		<div class="cavas_change">
			<a href="/gethiveaction.shtml" class="active">商户蜂巢</a>
			<a href="/gethiveaction.shtml">用户蜂巢</a>
		</div>
 -->


 		<div id="hive" style="width: 770px;height: 500px;"></div>
		<div id="main" style="width: 770px;height: 300px;"></div>
		
	</div>


<!--
		数据结构：${list }<br>
		<br>
		<br>
	    用户蜂巢数据结构：getuserhiveaction.shtml
		
	
		自身数据补充完整：${merchantsResult }<br>

		
		最后三个月推广获利情况：${final_list }<br>



		时时查询推广获得明细：[{"data":[{"proportion":"0.5","id":"170","record":"1.5","logo":"http://union.anzimall.com/data/merchants_logo/33/27d755fe00001cc0.jpg","storename":"牛当家旗舰店","rating":"一级"},{"proportion":"0.3","id":"143","record":"12","logo":"http://union.anzimall.com/data/merchants_updatelogo/143/51c7778c0000190a.png","storename":"米兰新娘","rating":"二级"},{"proportion":"0.2","id":"156","record":"5","logo":"http://union.anzimall.com/data/merchants_updatelogo/156/51c7778c00000f0a.png","storename":"万达集团","rating":"三级"},{"proportion":"0.3","id":"148","record":"50","logo":"http://union.anzimall.com/data/merchants_updatelogo/148/51c7778c00001c0a.png","storename":"兰州拉面","rating":"二级"},{"proportion":"0.5","id":"148","record":"100","logo":"http://union.anzimall.com/data/merchants_updatelogo/148/51c7778c00001c0a.png","storename":"兰州拉面","rating":"一级"},{"proportion":"0.3","id":"170","record":"51","logo":"http://union.anzimall.com/data/merchants_logo/33/27d755fe00001cc0.jpg","storename":"牛当家旗舰店","rating":"二级"},{}]},319.5]
-->



<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,echarts-all,backstage" /></jsp:include>

<script >


	// 数据
	var data = [];
	var self = {};
	var lastmonth,prevmonth,thirmonth;
	var update_link = '/getMerchantsHiveDataRealTime.shtml';
	var host = '${url}';
	<c:if test="${!empty list}">data = ${list};</c:if>
	<c:if test="${!empty merchantsResult}">self = ${merchantsResult};</c:if>
	<c:if test="${!empty final_list}">
		var month = ${final_list};
		lastmonth = month[0];
		prevmonth = month[1];
		thirmonth = month[2];
	</c:if>


	var lang_name = ['一月份','二月份','三月份','四月份','五月份','六月份','七月份','八月份','九月份','十月份','十一月份','十二月份'];
	lastmonth.name = lang_name[parseInt(lastmonth.name)-1];
	prevmonth.name = lang_name[parseInt(prevmonth.name)-1];
	thirmonth.name = lang_name[parseInt(thirmonth.name)-1];



	echarts.init(document.getElementById('main')).setOption({
		title : {text: '云蜂巢分润记录(最近三月)'},
		grid:{x:10,y:30,x2:10,y2:30},
		tooltip : {trigger: 'axis'},
		legend: {data:[lastmonth.name,prevmonth.name,thirmonth.name]},
		toolbox: {show : true,
		    feature : {
		        dataView : {show: true, readOnly: false},
		        magicType : {show: true, type: ['line','bar','stack','tiled']},
		        restore : {show: true},
		        saveAsImage : {show: true}
		    }
		},
		calculable : true,
		xAxis : [{type : 'category',boundaryGap : false,data : (function(){ for( var i=1,res=[];res.push(i++)<31;);return res;})()}],
		yAxis : [{type : 'value',show:false}],
		series : [
		    {
		        name:lastmonth.name,
		        type:'line',
		        smooth:true,
		        itemStyle: {normal: {areaStyle: {type: 'default'}}},
		        data:lastmonth.data.replace(/[\[\]\s]/gi,'').split(',')
		    },
		    {
		        name:prevmonth.name,
		        type:'line',
		        smooth:true,
		        itemStyle: {normal: {areaStyle: {type: 'default'}}},
		        data:prevmonth.data.replace(/[\[\]\s]/gi,'').split(',')
		    },
		    {
		       	name:thirmonth.name,
		        type:'line',
		        smooth:true,
		        itemStyle: {normal: {areaStyle: {type: 'default'}}},
		        data:thirmonth.data.replace(/[\[\]\s]/gi,'').split(',')
		    }
		]
	});
	


	
	data.push(self);
	var nodes = [];
	var links = [];
	for(var i=0,l=data.length,logo,k;i<l;i++){

		// if(!data[i].storename) continue;

		if(data[i].type == self.type &&  data[i].id == self.id ){
			data[i].category = 0;
			data[i].size = 50;
		}else if(data[i].ptype == self.type && data[i].mid == self.id){
			data[i].category = 1;
			data[i].size = 30
		}else{
			data[i].category = 2;
			data[i].size = 30;
		}

		data[i].storename = data[i].storename || data[i].phone;

		logo = data[i].logo || data[i].portrait

		nodes.push({
			category : data[i].category,
			name : data[i].storename,
			value : data[i].storename,
			symbolSize :  data[i].size
			// symbol : 'image://'+logo
		});

		for(k=0;k<l;k++){
			if(data[i].ptype == data[k].type && data[i].mid == data[k].id){
				links.push({source:data[k].storename, target : data[i].storename, weight : 5, name: ''});
				break;
			}
		}
	}



	var offset = {x:-60,y:80};

	echarts.init(document.getElementById('hive')).setOption(option = {
    title : {
        text: '蜂巢系统',
        subtext: '数据来自异业联盟统计',
        x:'right',
        y:'bottom'
    },
    tooltip : {
        trigger: 'item',
        formatter: '{a} : {b}'
    },
    toolbox: {
        show : true,
        feature : {
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    legend: {
        x: 'left',
        data:['自己','一级','二级']
    },
    series : [
        {
            type:'force',
            name : "推广账号",
            ribbonType: false,
            categories : [{name: '自己'},{name: '一级'},{name:'二级'}],
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        textStyle: {
                            color: '#333'
                        }
                    },
                    nodeStyle : {
                        brushType : 'both',
                        borderColor : 'rgba(255,215,0,0.4)',
                        borderWidth : 1
                    },
                    linkStyle: {
                        type: 'curve'
                    }
                },
                emphasis: {
                    label: {
                        show: false
                        // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                    },
                    nodeStyle : {
                        //r: 30
                    },
                    linkStyle : {}
                }
            },
            useWorker: false,
            minRadius : 15,
            maxRadius : 25,
            gravity: 1.1,
            scaling: 1.1,
            linkSymbol: 'arrow',
            nodes:nodes,
            links : links
        }
    ]
});


</script>

