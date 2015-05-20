<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="account" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />
	<div class="main">


		<!-- 侧边 -->
		<div class="aside">
			<dl>
				<dt><i class="icon icon-lladdresshome"></i>商户中心：</dt>
				<dd><i class="icon icon-yonghuxinxi"></i><a href="getUser.shtml">基本信息</a></dd>
				<dd><i class="icon icon-shenfenrenzheng"></i><a href="account_store.shtml">商户认证</a></dd>
				<dd class="active"><i class="icon icon-yinxinglicai"></i><a href="poscode.shtml">POS机信息</a></dd>
				<dd ><i class="icon icon-bbgyinxingqia"></i><a href="account_bankList.shtml">银行卡绑定</a></dd>
				<dd ><i class="icon icon-xiugaimima"></i><a href="go_password.shtml">修改登录密码</a></dd>
				<dd><i class="icon icon-xiugai"></i><a href="takePassword.shtml">修改提现密码</a></dd>
			</dl>
		</div>



	
	<h2 class="tle"><i class="icon icon-yinxinglicai"></i>POS机信息<small>您使用安子POS机，就拥有积分商城的使用权利，我们竭诚为您服务。</small></h2>
		<div class="table">
	
			<table border="0" cellspacing="0" cellpadding="0" >
				<thead>
					<tr>
						<th>pos机编号</th>
						<th>pos扣率</th>
						<th>商家加盟最低折扣价</th>
						<th>绑定日期</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty list}"><tr><td colspan="4"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>

				<c:forEach  items="${list}"  var="list">
					<tr>
						<td>${list.posnumber}</td>
						<td>${list.posdiscount}</td>
						<td>${list.originaldiscount}</td>
						<td><fmt:formatDate value="${list.sysdate}"  pattern="yyyy-MM-dd  HH:mm:ss"/></td>
					</tr>
				</c:forEach>
				</tbody>
				
			</table>
	

		</div>

		<div class="user_note ts">
			<p class="bold">温馨提示：</p>
			<p>1、修改、添加POS机需重新签订合约。</p>
			<p>1、商户不允许自行添加pos机。</p>
			<p>2、如需添加、修改POS机信息，请致电4008-119-789客服。</p>
		</div>
				
			
	</div>



	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global" /></jsp:include>