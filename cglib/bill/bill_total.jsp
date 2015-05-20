<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="bill" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />
<style>
	.table tr td a{width: 68px;height: 21px;line-height: 21px;background-color:#bdea74;text-align: center;display: block;color: #ffffff;border-radius:6px;}
	.laydate-icon{width: 100px;}
	.span1{margin-left:50px; }
	.span2{margin-left: 50px;color: red; font-weight: bold;}
	.bt{font-size: 20px;}
</style>

<div class="main cs" >

	<div class="aside">
		<dl>
			<dt><i class="icon icon-mingxizhang"></i>账户结算</dt>
			<dd><i class="icon icon-tubiaozitihua01"></i><a href="/indexList.shtml">账单首页</a></dd>
			<dd class="active"><i class="icon icon-lirunbiao"></i><a href="orderList.shtml">账单总表</a></dd>
			<dd><i class="icon icon-shijian"></i><a href="billtOrdrdatarecord.shtml">订单详情</a></dd>
			<dd><i class="icon icon-riqixuanzetubiao"></i><a href="bill_members.shtml">提现记录</a></dd>
			
			<%-- <c:if test="${userid==160}"><dd><i class="icon icon-tongji"></i><a href="getorderBuyList.shtml">在线购买</a></dd></c:if> 
				 <c:if test="${userid!=160}"><dd><i class="icon icon-shijian"></i><a href="billtOrdrdatarecord.shtml">线下兑换</a></dd></c:if> 
				 <dd><i class="icon icon-shuju"></i><a href="orderChartList.shtml">订单统计</a></dd> -->
				 <dd><i class="icon icon-tubiaozitihua01"></i><a href="bill_pos.shtml">刷卡明细</a></dd> --%>
		</dl>
	</div>
		
<c:set var="all" scope="page" value="${list3[0].payintegral + list4[0].paymoney + list9[0].tgintegral}"/>
	<div class="total">
		<h2 class="tle"><i class="icon icon-lirunbiao"></i>账单总表<small>查看您的账单信息</small></h2>
		
		<div class="total_data"></div>
			<div class="total_count">
		
			<strong>本月收益金额总计：<b>
			<c:if test="${empty all}">￥0</c:if>
			<c:if test="${!empty all}">￥${all}</c:if>
			</b></strong>
	
			<span class="span2">
			<c:if test="${empty list8[0].numbers}">昨日订单： 0件 &nbsp;&nbsp;&nbsp;</c:if>
			<c:if test="${!empty list8[0].numbers}">昨日订单：${list8[0].numbers }件 &nbsp;&nbsp;&nbsp;</c:if>
			
			<c:if test="${empty list7[0].numbers}">今日订单：0件 &nbsp;&nbsp;&nbsp;</c:if>
			<c:if test="${!empty list7[0].numbers}">今日订单：${list7[0].numbers }件</c:if>
				
			</span>
			<span class="span1">上月收益总计：
				<c:if test="${empty list6[0].payintegral}">￥0</c:if>
				<c:if test="${!empty list6[0].payintegral}">￥${list6[0].payintegral}</c:if>
				+ 
				<c:if test="${empty list5[0].moneys}">0积分</c:if>
				<c:if test="${!empty list5[0].moneys}">${list5[0].payintegral}积分</c:if>
				+ 
				<c:if test="${empty list10[0].tgintegral}">0积分</c:if>
				<c:if test="${!empty list10[0].tgintegral}">${list5[0].payintegral}积分</c:if>
			</span>
			
		</div>


		<div id="site_statistics" class="chart" style="width: 770px;height: 300px;margin-top: 20px;"></div>

	</div>


		
	<div class="piechart">
		
		<div class="pie">

			<div id="graph_1" class="chart" style="width: 198px;height: 160px;"></div>
			<ul>
				<li>本月积分收入<span><b style="color:#ee2323;font-size:16px;">${list3[0].payintegral}</b> 积分</span></li>
				<li>本月金钱收入<span><b style="color:#ee2323;font-size:16px;">${list4[0].paymoney}</b> 元</span></li>
				<li>本月推广返利<span><b style="color:#ee2323;font-size:16px;">${list9[0].tgintegral}</b> 积分</span></li>
			</ul>
		</div>
		
		<div class="circle-stat ">
		    <div class="visual">
		        <div class="circle-state-icon"><i class="icon icon-lirunbiao" style="color:#67c2ef"></i></div>
		        <input class="knob" data-width="100" data-height="100"  value="${list3[0].payintegral/all*100}" data-fgColor="#67c2ef" data-bgColor="#ddd">
		    </div>
		    <div class="details">
		        <div class="number"><fmt:formatNumber value="${list3[0].payintegral/all*100}" pattern="#0.00" />%</div>
		        <div class="title">本月积分收入比例</div>
		    </div>
		</div>

		<div class="circle-stat ">
		    <div class="visual">
		        <div class="circle-state-icon"><i class="icon icon-lirunbiao" style="color:#eae874"></i></div>
		        <input class="knob" data-width="100" data-height="100" value="${list4[0].paymoney/all*100}" data-fgColor="#eae874" data-bgColor="#ddd">
		    </div>
		    <div class="details">
		        <div class="number"><fmt:formatNumber value="${list4[0].paymoney/all*100}" pattern="#0.00" />%</div>
		        <div class="title">本月现金收入比例</div>
		    </div>
		</div>


		<div class="circle-stat ">
		    <div class="visual">
		        <div class="circle-state-icon"><i class="icon icon-lirunbiao" style="color:#ff5454"></i></div>
		        <input class="knob" data-width="100" data-height="100" value="${list9[0].tgintegral/all*100}" data-fgColor="#ff5454" data-bgColor="#ddd">
		    </div>
		    <div class="details">
		        <div class="number"><fmt:formatNumber value="${list9[0].tgintegral/all*100}" pattern="#0.00" />%</div>
		        <div class="title">本月推广返利比例</div>
		    </div>
		</div>
	</div>
<!-- 	<div class="info_table">
		<h2 class="tle"><i class="icon icon-maidanjilu" style="color:#f46302;"></i>收支明细</h2>
		<div class="table">
			<table border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						
						<th>时间</th>
						<th>类型</th>
						<th>账号</th>
						<th>金额</th>
						<th>消费状态</th>
						
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty list9}"><tr><td colspan="5"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>
				<c:forEach var="list9" items="${list9}" begin="0" end="6">
					<tr>
						<td><fmt:formatDate value="${list9.bookingdate}"  pattern="yyyy-MM-dd hh:mm"/></td>
						<td>
							<c:if test="${list9.type eq '0'}"><a style="">线下预约</a></c:if>
							<c:if test="${list9.type eq '1'}"><a style="background-color: #70d5fb;">线下购买</a></c:if>
						</td>
						<td>${fn:substring(list9.phone,0 ,4)}***${fn:substring(list9.phone,7 ,11)}</td>
						<td><span style="color: #53a000;">${list9.totalfee}</span></td>
						<td>
							<c:if test="${list9.state eq '0'}"><a style="background-color: #2ba9e9">已完成</a></c:if>
							<c:if test="${list9.state eq '1'}"><a style="background-color:#E24B62;">未完成</a></c:if>
						</td>
					</tr>
				</c:forEach>
				
				</tbody>			
			</table>
		</div>

		<p>资产动态记录企业资金（提现，商品销售等）最新信息如需查看理详细信息，请访问
			<a href="/orderList.shtml">收入明细</a>、
			<a href="/bill_members.shtml">提现明细</a>、
			<a href="/orderChartList.shtml">订单详情</a>...
		</p>
	</div> 


	<div class="info_links">	
		<a href="/getUser.shtml" style="background: #65a6ff;"><i class="icon icon-renzheng"></i><span>商户中心</span></a>
		<a href="/article.shtml" style="background: #9cd159;"><i class="icon icon-fa"></i><span>在线帮助</span></a>
		<a href="/orderChartList.shtml" style="background: #fa7753;"><i class="icon icon-tubiaozitihua01"></i><span>我的订单</span></a>
		<a href="/bill_withdraw.shtml" style="background: #984dff;"><i class="icon icon-icon"></i><span>申请提现</span></a>
		<a href="/orderList.shtml" style="background: #ffcc00;"><i class="icon icon-mingxizhang"></i><span>我的账单</span></a>
		<a href="/getUserVipList.shtml" style="background: #41e5c0;"><i class="icon icon-huiyuan"></i><span>推广返利</span></a>
	</div>
	-->
</div>


	<script>
		// 拆线图数据
		var order=${qxt}
		var pos=${qxt2}



		var statistics = [{data: order,label: "现金收入"}, {data: pos,label: "积分收益"}];




		// 饼状图数据
		var a,c,as;
		<c:if test="${!empty list3[0].payintegral}">a = ${list3[0].payintegral}</c:if>
		<c:if test="${!empty list4[0].paymoney}">c = ${list4[0].paymoney}</c:if>
		<c:if test="${!empty list9[0].tgintegral}">as = ${list9[0].tgintegral}</c:if>

		
		var picchart = [{label:'积分收入',data:a,color:'#67c2ef'},
						{label:'现金收入',data:c,color:'#eae874'},
						{label:'推广返利',data:as,color:'#bdea74'}];
	</script>

	
	<jsp:include page="/cglib/footer.jsp" >
	<jsp:param name="js" value="global,jquery.flot,jquery.knob,laydate/laydate,backstage" /></jsp:include>

	<script>


		function labelFormatter(label, series) {
			return "<div style='font-size:12px;color:white;'>" + label + "<br/>" + Math.round(series.percent) + "%</div>";
		}


	

		// 饼状图
		$.plot("#graph_1",picchart,{series:{pie:{show:true,radius:0.9,label:{show: true,radius: 0.5,formatter: labelFormatter,threshold: 0.1}}},legend: {show: false}});




		// 拆线图
		$.plot("#site_statistics",statistics, {
			series: {lines: {show: true,lineWidth: 2,fill: true,fillColor: {colors: [{opacity: 0.05}, {opacity: 0.01}]}},points: {show: true},shadowSize: 2},
			grid: {hoverable: true,clickable: true,tickColor: "#eee",borderWidth: 0},
			colors: ["#A5D16C", "#FCB322", "#32C2CD"],xaxis: {ticks: 11,tickDecimals: 0},yaxis: {ticks: 11,tickDecimals: 0}
		});


		var previousPoint = null;
		var tooltip = $('<div />').css({position: 'absolute',display: 'none',top: 5,left: 15,border: '1px solid #333',padding: '4px',color: '#fff','border-radius': '3px','background-color': '#333',opacity: 0.80}).appendTo("body");

		// 鼠标移动上去提示
		$("#site_statistics").bind("plothover", function(event, pos, item) {
			if (item) {
				if (previousPoint == item.dataIndex) { return }
					previousPoint = item.dataIndex;
					tooltip.html(item.datapoint[0] + '日,'+item.series.label+ item.datapoint[1].toFixed(2) +'元')
					.css({top: item.pageY + 5,left: item.pageX + 15}).show();
			} else {
				tooltip.hide();
				previousPoint = null;
			}
		});


		// 兼容性问题 ie8以下隐藏
		if(!-[1,]){
			$('.piechart').hide();
		}else{
			$(".knob").knob();
		}
	</script>
	
