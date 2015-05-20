<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<jsp:include page="/cglib/header.jsp">
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="pioneer" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />

<style>
	.table tr td label{width: 68px;height: 21px;line-height: 21px;background-color:#2ba9e9;text-align: center;display: block;color: #ffffff;border-radius:6px;}
</style>
 

<div class="main cs">
	
	<div class="aside">
		<dl>
			<dt><i class="icon icon-shanghu01"></i>电商创业系统</dt>
			<dd><i class="icon icon-shuju"></i><a href="/pioneerDetail.shtml">创业中心</a></dd>
			<c:if test="${pionner_flag eq 0}"><dd><i class="icon icon-fabu"></i><a href="/pioneerExplain.shtml">创业说明</a></dd></c:if>
			<dd class="active"><i class="icon icon-icon"></i><a href="/pioneer_withdraw_deposit_detail.shtml">提现操作</a></dd>
			<dd><i class="icon icon-tubiaozitihua01"></i><a href="/getNotice.shtml">公告</a></dd>
		</dl>
	</div>


	<h2 class="tle">
		<i class="icon icon-icon"></i>创业中心现金提现
		<small>提取您在创业系统中所创造的业绩分成，希望您再接再历，成就更辉煌的未来！</small>
	</h2>





	<table border="0" cellspacing="0" cellpadding="0" class="pioneer_withdraw">
		<tbody>
			<tr>
				<td rowspan="2">
					<h3>可提现创业奖金(元)</h3>
					<h2><em style="color:#ff7c3c;font-size:16px;">${list[0].balance_recommend}<span></span></em> 
						&nbsp; <a  class="btn btn-disabled" style="float: right;">提 现</a>
					</h2>
					<%-- <h2><em style="color:#ff7c3c;font-size:16px;">${list[0].balance_recommend}<span></span></em> 
						&nbsp; <a href="to_pioneer_withdraw_deposit.shtml?withdraw_type=1" class="btn btn-green" style="float: right;">提 现</a>
					</h2>--%>
					<h3>可提现市场区域奖励(元)</h3>
					<h2><em style="color:#ff7c3c;font-size:16px;">${list[0].balance_position}<span></span></em> 
						<c:if test="${IS_Last eq 3}">
						&nbsp; <a href="to_pioneer_withdraw_deposit.shtml?withdraw_type=2" class="btn btn-green" style="float: right;">提 现</a>
						</c:if>
						<c:if test="${IS_Last eq 1}"><a class="btn btn-disabled" style="float: right;">提 现</a></c:if>
					</h2>
					
					<h3>可提现管理补贴(元)</h3>
					<h2><em style="color:#ff7c3c;font-size:16px;">${list[0].balance_manager}<span></span></em> 
						<c:if test="${IS_Last eq 3}">
						&nbsp; <a href="to_pioneer_withdraw_deposit.shtml?withdraw_type=3" class="btn btn-green" style="float: right;">提 现</a>
						</c:if>
						<c:if test="${IS_Last eq 1}"><a class="btn btn-disabled" style="float: right;">提 现</a></c:if>
					</h2>
					<h3>可提现创业分红(元)</h3>
					<h2><em style="color:#ff7c3c;font-size:16px;">${list[0].sum_bonus}<span></span></em> 
						<c:if test="${IS_WITHDRAWD eq 3}">
						&nbsp; <a href="to_pioneer_withdraw_deposit.shtml?withdraw_type=4" class="btn btn-green" style="float: right;">提 现</a>
						</c:if>
						<c:if test="${IS_WITHDRAWD eq 1}"><a class="btn btn-disabled" style="float: right;">提 现</a></c:if>
						
						
					</h2>
					
				</td>
					
				<td>
					<h3>累积返利(元)</h3>
					<h2><em>${list[0].balance}<span></span></em></h2>
				</td>
				<td>
					<h3>推广资源码</h3>
					<h2><em>${list[0].sigen}<span></span></em></h2>
				</td>
			</tr>
			<tr>
				<td>
					<h3>业绩总额(元)</h3>
					<h2><em>${list[0].sum_total}</em></h2>
				</td>
				<td>
					<h3>冻结资金(元)</h3>
					<h2 class="dib"><em>${list[0].frozen}<span></span></em></h2>
					<p class="dib">冻结资金仅允许在 积分商城 使用</p>
				</td> 
			</tr>
			
		</tbody>			
	</table>
	<p class='pioneer_code' style="margin: 10px 0px;">
		<span class="label-info"> 注意！ </span> 提现时间：创业奖金可随时申请提现，市场区域奖励及管理补贴每月底可申请提现，创业分红每周五可申请提现，提现后次日到账。
	</p>


	<br>
	<div class="pioneer_data" style="padding:0;"><h5>创业系统提现明细</h5></div>
	<div class="table">
		<table border="0" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th>时间</th>
					<th>提现金额</th>
					<th>提现后余额</th>
					<th>姓名</th>
					<th>银行卡号</th>
					<th>提现类型</th>
					<th>状态</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list2}"><tr><td colspan="8"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>
				<c:forEach var="list2" items="${list2}" begin="0" end="6">
				<tr>
					<td><fmt:formatDate value="${list2.withdraw_date}"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${list2.deduction_money+list2.withdraw_money}</td>
					<td><span style="color: #53a000;">${list2.after_money}</span></td>
					<td>${list2.realname}</td>
					<td>${fn:substring(list2.withdraw_bankcard,0 ,8)}******${fn:substring(list2.withdraw_bankcard,13 ,16)}</td>
					<td>
						<c:if test="${list2.withdraw_type eq '1'}">创业奖金提现</c:if>
						<c:if test="${list2.withdraw_type eq '2'}">市场区域提现</c:if>
						<c:if test="${list2.withdraw_type eq '3'}">管理补贴提现</c:if>
						<c:if test="${list2.withdraw_type eq '4'}">创业分红提现</c:if>
					</td>
					<td>
						<c:if test="${list2.status eq '0'}"><label style="background-color:#E24B62;">审核中</label></c:if>
						<c:if test="${list2.status eq '1'}"><label style="">已通过</label></c:if>
						<c:if test="${list2.status eq '2'}"><label style="background-color:#D7D5EF;">未通过</label></c:if>
					</td>	
				</tr>
				</c:forEach>
				
			</tbody>			
		</table>
	</div>


		
		
	</div>

</div>	


<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,jquery.flot,backstage" /></jsp:include>
