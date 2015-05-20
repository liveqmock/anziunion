<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="bill" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />
<style>
	.table tr td a{width: 68px;height: 21px;line-height: 21px;background-color:#2ba9e9;text-align: center;display: block;color: #ffffff;border-radius:6px;}
</style>
	<div class="main cs">


		<div class="aside">
			<dl>
				<dt><i class="icon icon-mingxizhang"></i>账户结算</dt>
				<dd><i class="icon icon-tubiaozitihua01"></i><a href="/indexList.shtml">账单首页</a></dd>
				<dd><i class="icon icon-lirunbiao"></i><a href="orderList.shtml">账单总表</a></dd>
				<dd class="active"><i class="icon icon-shijian"></i><a href="billtOrdrdatarecord.shtml">订单详情</a></dd>
				<dd><i class="icon icon-riqixuanzetubiao"></i><a href="bill_members.shtml">提现记录</a></dd>
			</dl>
		</div>
		


		<div class="flots_box">
			<div class="flots" id="flotstest" style="width:750;height:300px;"></div>
		</div>


		<div class="table table_box">
			<h2 class="tle"><i class="icon icon-shouzhimingxi" style="color:#f46302;"></i>线下预约<small>查看您的订单信息</small></h2>
			<div class="flots_time" style="border-left: 1px solid #ddd ;border-right: 1px solid #ddd ;padding-bottom: 20px;">
				<form action="billtOrdrdtime.shtml" class="fukrm table_tle" method="post">
					<span><i class="icon icon-riqixuanzetubiao"></i>起止日期：</span>
					<input type="text" name="date1" value="${date1}" onclick="laydate()" readonly="readonly" style="width:90px;" >
					-
					<input type="text" name="enddate1" value="${enddate1 }" onclick="laydate()" readonly="readonly" style="width:90px;" >
					<input type="hidden" name="type" value="0">
					<input type="submit" value="查询">



				<!-- <p class="flots_time_link">
						<a href="#">今天</a>
						<a href="#">最近1个月</a>
						<a href="#">3个月</a>
						<a href="#">1年</a>
						<a href="#">1年前</a>
					</p> -->

		

				</form>
				<div class="flots_slider_label">
					<i class="icon icon-shijian"></i>选择本月：
				</div>
				<div class="flots_slider"><input id="slider" type="slider" name="area" value="1;31" /></div>
			</div>

	
			<div class="table">
				<table border="0" cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th>预定时间</th>
							<th>用户</th>
							<th>商品</th>
							<th>收益</th>
							<th>数量</th>
							<th>兑换方式</th>
							<th>消费状态</th>
						</tr>
					</thead>
					<tbody>
						
					<c:if test="${empty pageSupport.result}"><tr><td colspan="9"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>
					<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
						<tr>
							<td><fmt:formatDate value="${list.getdate}"  pattern="yyyy-MM-dd"/></td>
							<td>${fn:substring(list.phone,0 ,3)}****${fn:substring(list.phone,7 ,11)}</td>
							<td><span class="text-oh" style="width: 200px;display: block;text-align: left;">${list.name}</span></td>
							<td>
								<c:if test="${list.sigen eq '0'}"><span style="color: #f37800;">${list.payintegral}积分</span></c:if>
								<c:if test="${list.sigen eq '1'}"><span style="color: #f37800;">${list.paymoney}现金</span></c:if>
							</td>
							<td>${list.number}</td>
							<td>
								<c:if test="${list.type eq '0'}"><font color="#2ba9e9">快递邮寄</font></c:if>
								<c:if test="${list.type eq '1'}"><font color="#E24B62">实体店兑换</font></c:if>
							</td>
							<td>
								<c:if test="${list.type eq '0'}">
									<c:if test="${list.status eq '0'}"><a href="/getUserAddress.shtml?gid=${list.aid}" class="more" sendto="/merchantsDeliver.shtml?uid=${list.uid}">发货地址</a></c:if>
									<c:if test="${list.status eq '1'}"><span style="color: #E24B62;">已发货</span></c:if>
									<c:if test="${list.status eq '2'}"><span style="color: #aaa;">已完成</span></c:if>
								</c:if>
								<c:if test="${list.type eq '1'}">
									<c:if test="${list.status eq '0'}"><span style="color: #E24B62;">待验劵</span></c:if>
									<c:if test="${list.status eq '2'}"><span style="color: #aaa;">已验劵</span></c:if>
								</c:if>

							</td>	
						</tr>
					</c:forEach>
					</tbody>			
				</table>
			</div>
			<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false"></div>  
		</div>		

	
	</div>
	
<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,jquery.flot,jquery.slider,fukrm,backstage,laydate/laydate" /></jsp:include>
	

<script>


	$(document).on('click','a.more',function(){

		var send = this.getAttribute('sendto');
	
		$.getJSON(this.getAttribute('href'),function(json){
			json = json ? json[0] :false;
			if(!json) return;

			dialog.html('<div class="table" style="width:300px; margin:10px;"><table cellpadding="1" cellspacing="1" class="tb-amout-more"><tbody><tr><th>类型</th><th>说明</th></tr><tr><td>收货人姓名</td><td>'+json.name+'</td></tr><tr><td>联系电话</td><td>'+json.phone+'</td></tr><tr><td>收货地址</td><td>'+json.province+json.city+json.county+json.address+'</td></tr></tbody></table><br><p style="text-align:center;"><a href="'+send+'" class="btn_submit">确定发货</a></p></div>').dialog('open');

		});

		return false;
	})


	var qxtorder1 = [],qxtorder2=[];
	<c:if test="${!empty qxtorder}">qxtorder1 = ${qxtorder};</c:if>
	<c:if test="${!empty qxtorder2}">qxtorder2 = ${qxtorder2};</c:if>

	var statistics = [{data: qxtorder1,label: "积分兑换数量"},{data: qxtorder2,label: "现金兑换数量"}];

	var plot = $.plot($("#flotstest"),statistics, {
		series: {
			lines: {
				show: true,
				lineWidth: 2,
				fill: true,
				fillColor: {
					colors: [{
						opacity: 0.05
					}, {
						opacity: 0.01
					}]
				}
			},
			points: {
				show: true
			},
			shadowSize: 2
		},
		grid: {
			hoverable: true,
			clickable: true,
			tickColor: "#eee",
			borderWidth: 0
		},
		colors: ["#A5D16C", "#FCB322", "#32C2CD"],
		xaxis: {
			ticks: 11,
			tickDecimals: 0
		},
		yaxis: {
			ticks: 11,
			tickDecimals: 0
		}
	});


	// 本月时长
	var now = new Date();
	var month = now.getMonth()+1;
	var year = now.getFullYear();
	var length = (function(n){
		n.setDate(1);
		n.setMonth(month);
		n.setHours(-3);
		return n.getDate();
	})(now);

	var begin = $('input[name=date]');
	var toend = $('input[name=enddate]');
	month = month<10? '0'+month:month;

	$("#slider").slider({from:1,to: length,scale:(function(v){for(var i=0,r=[];i<v;){i++;r.push(i%2 == 0 ? '|' : i);}return r;})(length),limits:false,skin:"round_plastic",callback:function( value ){
		var v = value.split(';');
		v[0] = v[0]<10? '0'+v[0]:v[0];
		v[1] = v[1]<10? '0'+v[1]:v[1];
		begin.val(year+'-'+month+'-'+ v[0]);
		toend.val(year+'-'+month+'-'+ v[1]);
	}});

</script>