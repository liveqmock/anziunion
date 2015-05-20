<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="bill" />
</jsp:include>

<jsp:include page="/cglib/validation.jsp"  />

	<div class="main cs">


		<div class="aside">
			<dl>
				<dt><i class="icon icon-mingxizhang"></i>账户结算</dt>
				<dd ><i class="icon icon-lirunbiao"></i><a href="orderList.shtml">账单总表</a></dd>
				<c:if test="${userid==160}"><dd><i class="icon icon-tongji"></i><a href="getorderBuyList.shtml">在线购买</a></dd></c:if>
				<c:if test="${userid!=160}"><dd><i class="icon icon-shijian"></i><a href="billtOrdrdatarecord.shtml">线下兑换</a></dd></c:if>
				<dd class="active"><i class="icon icon-tubiaozitihua01"></i><a href="bill_pos.shtml">刷卡明细</a></dd>
				<dd><i class="icon icon-riqixuanzetubiao"></i><a href="bill_members.shtml">提现记录</a></dd>
				<dd><i class="icon icon-shuju"></i><a href="orderChartList.shtml">订单统计</a></dd>
			</dl>
		</div>
	
		<h2 class="tle"><i class="icon icon-tubiaozitihua01"></i>收入明细<small>查看您的销售收入信息</small></h2>
	
		<div class="flots_time" >
			<form action="/bill_postime.shtml" class="fukrm table_tle" method="post">
				<span><i class="icon icon-riqixuanzetubiao"></i>起止日期：</span>
				<input type="text" name="date" onclick="laydate()" value="" readonly="readonly" style="width:90px;" >
				-
				<input type="text" name="enddate"  onclick="laydate()" value="" readonly="readonly" style="width:90px;" >
				<input type="submit" value="查询">
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
						<th>订单号</th>
						<th>时间</th>
						<th>pos终端编号</th>
						<th>原金额</th>
						<th>扣率后金额</th>
						<th>获得积分</th>
						<th>支付状态</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty pageSupport.result}"><tr><td colspan="9"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>
				<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
					<tr>
						<td>${list.ordernumber}</td>
						<td><fmt:formatDate value="${list.begpaydate}"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${list.posnumner}</td>
						<td><span style="color: #f37800;">${list.originalmoney}</span></td>
						<td><span style="color: #53a000;">${list.discountmoney}</span></td>
						<td><span style="color: #53a000;">${list.mobtainintegral}</span></td>
						<c:if test="${list.state eq '10010'}"><td><a class="btn btn_blue">待支付</a></td></c:if>
						<c:if test="${list.state eq '10020'}"><td><a class="btn btn_green">已支付</a><td></c:if>
						<c:if test="${list.state eq '10030'}"><td><a class="btn btn_red">支付失败</a><td></c:if>
					</tr>
				</c:forEach>
	
				</tbody>			
			</table>
			<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}"></div>  

		</div>
	</div>



	
	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,jquery.flot,jquery.slider,fukrm,backstage,laydate/laydate" /></jsp:include>
	<script>
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
	
	
	
