<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/cglib/validation.jsp" flush="true"/>



	<!-- 顶部导航 -->
	<div class="head_top">
		<ul class="head_top_wel">
			<li>您好，</li>
			<li><a href="/getUser.shtml">${username}</a>！</li>
			<li><a href="/index.shtml?<%= Math.random()%>">退出</a></li>
		</ul>
		<ul class="head_top_tool">
			<li><a href="http://www.anzimall.com/" target="_blank">积分商城</a></li>
			<li><a href="http://card.anzipay.com/" target="_blank">安子预付卡</a></li>
			<li><a href="http://anzipay.com/" target="_blank">安子支付</a></li>
			<li><a href="http://www.anziapp.com/" target="_blank">安子助手</a></li>
			<li><a href="http://119.254.69.98:8090/agentmgr/" target="_blank">分销平台</a></li>
			<li><a href="article.shtml" target="_blank">帮助中心</a></li>
			
		</ul>
	</div>



	<!-- 头部 -->
	<div class="head_nav">
		<div class="center">
			<a  class="head_nav_logo" href="/indexList.shtml"  title="首页"><img src="/images/head_nav_logo.png" alt="安淘惠" ></a>
			<ul>
				<!-- <li><a href="/indexList.shtml">首页</a></li> -->
				
				<li <c:if test="${active == 'bill'}">class="active" </c:if>><a href="/orderList.shtml">账户结算</a></li>
				<li <c:if test="${active == 'product'}">class="active" </c:if>><a href="/product_count_request.shtml" >商品管理</a></li>
				<c:if test="${channel!=2 }">
				<li <c:if test="${active == 'hive'}">class="active" </c:if>><a href="gethiveaction.shtml" >云蜂巢</a></li>
				</c:if>
				<li <c:if test="${active == 'union'}">class="active" </c:if>><a href="/union.shtml" >跨界联盟</a></li>
				
				<li <c:if test="${active == 'account'}">class="active" </c:if>><a href="/getUser.shtml" >商户中心</a></li>
				<c:if test="${channel!=2 }">
				<li <c:if test="${active == 'invest'}">class="active" </c:if>><a href="/investIndex.shtml" >创富系统</a></li>
				</c:if>
				<li <c:if test="${active == 'pioneer'}">class="active" </c:if>>
					<a href="/pioneerIndex.shtml" >电商创业系统</a>
				</li>
		
		<%--			
			<c:if test="${empty pos}" >
				<c:choose>
				<c:when test="${userid==160}">
					
				</c:when>
				<c:otherwise>
					<li <c:if test="${active == 'product'}">class="active" </c:if>><a onclick="alert('你还未绑定pos机,请联系客服');return false;" >商品管理</a></li>
				</c:otherwise>
				</c:choose>	
			</c:if>
		
		
		<!-- 不为空 -->
		 <c:if test="${!empty pos}" > 
			<li <c:if test="${active == 'product'}">class="active" </c:if>><a href="product_lis_request.shtml" >商品管理</a></li>
		</c:if>


		


				
		<c:if test="${empty pos}" >
			<c:choose>
			<c:when test="${userid==160}">
				<li <c:if test="${active == 'activites'}">class="active" </c:if>><a href="getTemplatevip.shtml" >会员卡模板</a></li>
			</c:when>
			<c:otherwise>
			<li <c:if test="${active == 'activites'}">class="active" </c:if>><a onclick="alert('你还未绑定pos机,请联系客服');return false;" >优惠活动</a></li>
			</c:otherwise>
			</c:choose>	
		</c:if>
	
		
		<c:if test="${!empty pos}" >
			<li <c:if test="${active == 'activites'}">class="active" </c:if>><a href="/cglib/activites/hive.jsp" >优惠活动</a></li>
		</c:if>
	--%>		
			
			
			</ul>
		</div>
	</div>



