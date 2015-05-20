<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="activites" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />


	<div class="main cs">
		
	
		<div class="aside">
			<dl>
				<dt><i class="icon icon-icon12"></i>优惠管理</dt>
				<dd class="active"><i class="icon icon-chanpinleimu"></i><a href="vipCardList.shtml">会员卡列表</a></dd>
				<dd><i class="icon icon-fabu"></i><a href="vipCard.shtml">发布会员卡</a></dd>
				<dd><i class="icon icon-dongtai"></i><a href="vipCardOrder.shtml">会员卡订单数据</a></dd>
				<dd><i class="icon icon-huiyuan"></i><a href="getUserVipList.shtml">推广返利</a></dd>
				<dd><i class="icon icon-huiyuan"></i><a href="gethiveaction.shtml">蜂巢系统</a></dd>
			</dl>
		</div>


	

		<h2 class="tle"><i class="icon icon-chanpinleimu"></i>会员卡列表<small>拥有您的会员卡，用户会更喜欢您！</small></h2>
		<form action="getvipCardNameList.shtml" class="fukrm table_tle" method="post">
			会员卡名称：<input type="text" name="name" value="" style="width:100px;" maxlength="20">
			<input type="submit" value="查询">
		</form>

		<c:if test="${empty pageSupport.result}"><div style="text-align: center;margin-top: 40px;"><img src='/images/no_bg4.png'></div></c:if>
		
		<ul class="list_card">
			<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
			<li>
				<h6><a><img src="http://union.anzimall.com/data/templatevip/160/5c5b2ed2000000c0.png"></a></h6>
				<span><a>NO.00001</a></span>
				<h3><a>${list.name}</a></h3>
				<p><a>最高可享全单${list.upgrade5}折优惠</a></p>
				<cite>
					<h4>${list.name}</h4>
					<p><b>${list.rulename1}</b>：0≤累计消费＜${list.discount2}元，享<span style="color: red;">${list.upgrade1}折</span><br>
						<c:if test="${!empty list.rulename2}">
						<b>${list.rulename2}</b>：${list.discount2}≤累计消费＜${list.discount3}元，享<span style="color: red;">${list.upgrade2}折</span><br>
						</c:if>
						<c:if test="${!empty list.rulename3}">
						<b>${list.rulename3}</b>：${list.discount3}≤累计消费＜${list.discount4}元，享<span style="color: red;">${list.upgrade3}折</span><br>
						</c:if>
						<c:if test="${!empty list.rulename4}">
						<b>${list.rulename4}</b>：${list.discount4}≤累计消费＜${list.discount5}元，享<span style="color: red;">${list.upgrade4}折</span><br>
						</c:if>	
						<c:if test="${!empty list.rulename5}">
						<b>${list.rulename5}</b>：${list.discount5}≤累计消费，享<span style="color: red;">${list.upgrade5}折</span>
						</c:if>	
					</p>
				</cite>
				<div class="vipcard_status">
					<br>
					<c:if test="${list.state eq '0'}"><b>卡状态:</b><span class="vipcard_val" style="background-color:#2ba9e9;">已通过</span></c:if>
					<c:if test="${list.state eq '1'}"><b>卡状态:</b><span class="vipcard_val" style="background-color:#E24B62;">审核中</span></c:if>
					<c:if test="${list.state eq '2'}"><b>卡状态:</b><span class="vipcard_val" style="background-color:#D7D5EF;">未通过</span></c:if><br>
					<b>卡编号:</b><span>${list.id}</span><br>
					<b>加入时间:</b><span><fmt:formatDate value="${list.sysdate}"  pattern="yyyy-MM-dd"/></span><br>
					<b>更多内容:</b><a class="js-dialog-ajax" href="findByIdVipCard.shtml?id=${list.id}" style="color:#08bff4;">[查看详情]</a>
				</div>
			</li>
			</c:forEach>
		</ul>


		<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false" ></div> 

		<div class="user_note">
			<p class="bold"><strong>温馨提示：</strong></p>
			<p>1、您发布的会员卡通过审核后不可更改或删除</p>
			<p>2、用户绑定您的会员卡后，在您的店铺刷卡，消费将享受会员卡规定的优惠折扣</p>
		</div> 

		

	

	</div>



	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,backstage" /></jsp:include>
