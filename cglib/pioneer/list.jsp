<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="pioneer" />
</jsp:include>


<div class="main cs">

	<div class="aside">
		<dl>
			<dt><i class="icon icon-shanghu01"></i>电商创业系统</dt>
			<c:if test="${pionner_flag eq 1}"><dd class="active"><i class="icon icon-shuju"></i><a href="/pioneerDetail.shtml">创业中心</a></dd></c:if>
			<c:if test="${pionner_flag eq 0}"><dd><i class="icon icon-fabu"></i><a href="/pioneerExplain.shtml">创业说明</a></dd></c:if>
			<c:if test="${pionner_flag eq 1}"><dd><i class="icon icon-shuju"></i><a href="/pioneer_withdraw_deposit_detail.shtml">提现操作</a></dd></c:if>
			<dd><i class="icon icon-tubiaozitihua01"></i><a href="/getNotice.shtml">公告</a></dd>
			
		</dl>
	</div>


	<h2 class="tle">
		<i class="icon icon-76wodeyibanyewu"></i>我的创业中心
		<small>您推广的创业用户所获得的返利列表，推广越多，获利越丰厚！</small>
	</h2>



	<div class="pioneer_data">

		<h5>查看${total }入明细 <small>总计获得的${total } 
		<c:if test="${tradeType eq 1 }"><span class="btn btn_blue">${user_detail.total1}元</span></c:if>
		<c:if test="${tradeType eq 2 }"><span class="btn btn_blue">${user_detail.total2}元</span></c:if>
		<c:if test="${tradeType eq 3 }"><span class="btn btn_blue">${user_detail.total3}元</span></c:if>
		</small>
		</h5>
		<div class="table">
			<table border="0" cellspacing="0" cellpadding="0" style="margin:0;">
				<thead>
					<tr>
						<th>时间</th>
						<th>推广账号</th>
						<th>注册资金</th>
						<th>返利比例</th>
						<th>返利金额</th>
						<c:if test="${total eq '管理补贴'}"><th>返利等级</th></c:if>
						<c:if test="${total eq '创业奖金'}"><th>返利等级</th></c:if>
					</tr>
				</thead>
				<tbody> 
					<c:if test="${empty list2}"><tr><td colspan="6"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>
					<c:forEach items="${list2}" var="list">
					<tr>
						<td><fmt:formatDate value="${list.trade_date }" pattern="yyyy-MM-dd HH:mm"/></td>
						<td>${fn:substring(list.mobile,0 ,3)}****${fn:substring(list.mobile,7 ,11)}</td>
						<td><font color="red">${list.price }</font>元</td>
						<td>${list.scale*100 }%</td>
						<td><font color="red">${list.trade_total }</font>元</td>
						<c:if test="${total eq '管理补贴'}"><td><span class="btn btn_blue">
						<c:if test="${list.level eq '2'}">一级管理</c:if>
						<c:if test="${list.level eq '3'}">二级管理</c:if>
						<c:if test="${list.level eq '4'}">三级管理</c:if></span></td></c:if>
						<c:if test="${total eq '创业奖金'}"><td><span class="btn btn_blue"><c:if test="${list.level eq '1'}">第一销售渠道</c:if>
						<c:if test="${list.level eq '2'}">第二销售渠道</c:if>
						<c:if test="${list.level eq '3'}">第三销售渠道</c:if></span></td></c:if>
					</tr>
					</c:forEach>
				</tbody>			
			</table>
		</div>

		<!-- <div class="ajaxpage" total="300" each="20" page="1" ajax="false" ></div>   -->
	</div>





</div>


<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,echarts-all,backstage" /></jsp:include>

