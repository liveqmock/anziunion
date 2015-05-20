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
			<dd><i class="icon icon-shijian"></i><a href="billtOrdrdatarecord.shtml">订单详情</a></dd>
			<dd class="active"><i class="icon icon-riqixuanzetubiao"></i><a href="bill_members.shtml">提现记录</a></dd>
		</dl>
	</div>


	<h2 class="tle"><i class="icon icon-riqixuanzetubiao"></i>现金提现记录<small>查看您的提现信息</small></h2>
	
	<div class="flots_time" >
		<form action="/gettakemoneyTime.shtml" class="fukrm table_tle" method="post">
			<span><i class="icon icon-riqixuanzetubiao"></i>起止日期：</span>
			<input type="text" name="date" value="${date }" onclick="laydate()" readonly="readonly" style="width:90px;" >
			-
			<input type="text" name="enddate" value="${enddate }"  onclick="laydate()" readonly="readonly" style="width:90px;" >
			<input type="hidden" name="type" value="1">
			<input type="submit" value="查询">


			<%--<a class="btn_tab" href="/check_integral.shtml" style="background:#fe6c6d;">积分提现明细</a> --%>
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
					<th>时间</th>
					<th>原始金额</th>
					<th>提现金额</th>
					<th>余额</th>
					<th>手续费</th>
					<th>姓名</th>
					<th>银行卡号</th>
					<th>状态</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty pageSupport.result}"><tr><td colspan="9"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>
				<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
				<tr>
					<td><fmt:formatDate value="${list.sysdate}"  pattern="yyyy-MM-dd hh:mm"/></td>
					<td>${list.money }</td>
					<td>
						<span style="color: #f37800;"  class="monery">${list.fetchmoney}<img src="/images/moneys.png" title="点击查看详情" style="padding:7px 4px 0;"></span>
						<div class="monerys">
							<table cellpadding="1" cellspacing="1" class="tb-amout-more">
								<colgroup><col><col ></colgroup>
								<tbody>
									<tr><th>类型</th><th>说明</th></tr>
									<tr><th colspan="2">提现时间 <fmt:formatDate value="${list.sysdate}"  pattern="yyyy-MM-dd HH:mm:ss"/></th></tr>
									<tr><td>提现金额</td><td>${list.fetchmoney}</td></tr>
									<tr><td>银行卡号</td><td>${list.card}</td></tr>
									<tr><td>开户支行</td><td>${list.baddress}</td></tr>
								</tbody>
							</table>
						</div>



					</td>
					<td><span style="color: #53a000;">${list.balance}</span></td>
					
					<td><span style="color: #53a000;">
						<c:if test="${list.status eq '0'}">${list.discountmoney}积分</c:if>
						<c:if test="${list.status eq '1'}">${list.discountmoney}现金</c:if>
					</span></td>
					<td>${list.name}</td>
					<td>${fn:substring(list.card,0 ,8)}******${fn:substring(list.card,13 ,16)}</td>
					
					<td>
						<c:if test="${list.state eq '0'}"><a style="background-color:#E24B62;">审核中</a></c:if>
						<c:if test="${list.state eq '1'}"><a>已通过</a></c:if>
						<c:if test="${list.state eq '2'}"><a style="background-color:#D7D5EF;">未通过</a></c:if>
					</td>	
				</tr>
				</c:forEach>
			</tbody>			
		</table>

		<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false"></div>  

	</div>
</div>



	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,jquery.flot,jquery.slider,fukrm,backstage,laydate/laydate" /></jsp:include>
	
	<script>
	
		
		$(document).on('click','span.monery',function(){
			var monerys = $(this).siblings('.monerys').show();
			$(document).one('click',function(){
				monerys.hide();
			})
			
			
		})
	
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
	