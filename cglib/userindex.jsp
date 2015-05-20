<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<jsp:include page="/cglib/header.jsp"><jsp:param name="css" value="global,backstage" /></jsp:include>
<jsp:include page="/cglib/validation.jsp"  />

<style>
	.table tr td label{width: 68px;height: 21px;line-height: 21px;background-color:#2ba9e9;text-align: center;display: block;color: #ffffff;border-radius:6px;}
</style>
<div class="main cs">
	
	<div class="aside">
		<dl>
			<dt><i class="icon icon-mingxizhang"></i>账户结算</dt>
			<dd class="active"><i class="icon icon-tubiaozitihua01"></i><a href="/indexList.shtml">账单首页</a></dd>
			<dd><i class="icon icon-lirunbiao"></i><a href="orderList.shtml">账单总表</a></dd>
			<dd><i class="icon icon-shijian"></i><a href="billtOrdrdatarecord.shtml">订单详情</a></dd>
			<dd><i class="icon icon-riqixuanzetubiao"></i><a href="bill_members.shtml">提现记录</a></dd>
		</dl>
	</div>


	<div class="info">
		<div class="info_head">
			<img src="/temp/images/info_head_bkg.jpg" alt="" height="110px" width="790px">
			<a class="info_head_user" href="/getUser.shtml"><img src="${list[0].logo}" alt=""></a>
			<h2><strong>您好！${list[0].username}</strong></h2>
			<p>帐号：${fn:substring(list[0].mobile,0 ,4)}***${fn:substring(list[0].mobile,7 ,11)} </p>
		</div>

		<div class="info_bill">
			<dl>
				<dt class="tle"><i class="icon icon-yue"></i>帐户余额
					<a href="bill_members.shtml" >查看提现明细</a>
				</dt>
				<dd>
					<c:if test="${empty list2}"><h3>￥<strong>0</strong></h3></c:if>
					<c:if test="${!empty list2}"><h3>￥<strong>${list2[0].money}</strong></h3></c:if>
					<p>
						<a href="bill_withdraw.shtml" class="btn" style="background:#fd9403;">提 现</a>
						<a href="bill_members.shtml" class="btn">查看</a>
					</p>
				</dd>
			</dl>
			<dl>
				<dt class="tle"><i class="icon icon-kemuyuebiao" style="color:#f88702"></i>积分余额
					<%--<a href="/check_integral.shtml" >查看提现明细</a> --%>
				</dt>
				<dd>
				

				<c:if test="${empty list5[0].integral}"><h3><strong>0</strong>积分</h3></c:if>
				<c:if test="${!empty list5[0].integral}"><h3><strong>${list5[0].integral}</strong>积分</h3></c:if>	

					<p>
						<%--<a href="integral_withdraw.shtml" class="btn" style="background:#fd9403;">提现</a>--%>
						<%--<a href="check_integral.shtml" class="btn">查看</a>--%>
					</p>
				</dd>
			</dl>
		</div>

		<div class="info_table">
			<h2 class="tle"><i class="icon icon-chakan" style="color:#f46302;"></i>提现动态</h2>
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
						<c:if test="${empty list4}"><tr><td colspan="8"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>
						<c:forEach var="list4" items="${list4}" begin="0" end="6">
						<tr>
							<td><fmt:formatDate value="${list4.sysdate}"  pattern="yyyy-MM-dd"/></td>
							<td>${list4.money}</td>
							<td>
								<span style="color: #f37800;"  class="monery">${list4.fetchmoney}<img src="/images/moneys.png" title="点击查看详情" style="padding-top: 13px;padding-left: 10px;"></span>
								<div class="monerys">
									<table cellpadding="1" cellspacing="1" class="tb-amout-more">
										<colgroup><col><col ></colgroup>
										<tbody>
											<tr><th>类型</th><th>说明</th></tr>
											<tr><th colspan="2">提现时间 <fmt:formatDate value="${list4.sysdate}"  pattern="yyyy-MM-dd HH:mm:ss"/></th></tr>
											<tr><td>提现金额</td><td>${list4.fetchmoney}</td></tr>
											<tr><td>银行卡号</td><td>${list4.card}</td></tr>
											<tr><td>开户支行</td><td>${list4.baddress}</td></tr>
										</tbody>
									</table>
								</div>
							</td>
							<td><span style="color: #53a000;">${list4.balance}</span></td>
							<td><span style="color: #53a000;">
								<c:if test="${list4.status eq '0'}">${list4.discountmoney}积分</c:if>
								<c:if test="${list4.status eq '1'}">${list4.discountmoney}现金</c:if>
								</span></td>
							
							<td>${list4.name}</td>
							<td>${fn:substring(list4.card,0 ,8)}******${fn:substring(list4.card,13 ,16)}</td>
							
							<td>
								<c:if test="${list4.state eq '0'}"><label style="background-color:#E24B62;">审核中</label></c:if>
								<c:if test="${list4.state eq '1'}"><label style="">已通过</label></c:if>
								<c:if test="${list4.state eq '2'}"><label style="background-color:#D7D5EF;">未通过</label></c:if>

							</td>	
						</tr>
						</c:forEach>
						
					</tbody>			
				</table>
			</div>

			<p>资产动态记录企业资金（提现，商品销售，pos扣率等）最新信息如需查看理详细信息，请访问
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
			<%-- <a href="/getUserVipList.shtml" style="background: #41e5c0;"><i class="icon icon-huiyuan"></i><span>推广返利</span></a> --%>
		</div>
	</div>

</div>	


<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,jquery.flot,backstage" /></jsp:include>
<script>

	$('.head_nav').find('li').eq(0).addClass('active');

	$(document).on('click','span.monery',function(){
		var monerys = $(this).siblings('.monerys').show();
		$(document).one('click',function(){
			monerys.hide();
		})
	});
</script>