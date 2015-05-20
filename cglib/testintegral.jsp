<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/cglib/header.jsp">
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="activites" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp" />

<div class="main cs">
	<form action="count.shtml" class="fukrm fukrm-ajax">
		<cite> <span><em>*</em>消费总金额：</span>&nbsp&nbsp&nbsp <input type="text"
				name="name" check="required" placeholder="会员卡名称" /> </cite></br>
		<cite> <span><em>*</em>商家折扣率：</span>&nbsp&nbsp&nbsp <input type="text"
				name="name" check="required" placeholder="会员卡名称" /> </cite></br>
		<cite> <span><em>*</em>用户抵扣积分：</span> <input type="text"
				name="name" check="required" placeholder="会员卡名称" /> </cite></br>
		<cite> <span><em>*</em>返用户积分：</span>&nbsp&nbsp&nbsp <input type="text"
				name="name" check="required" placeholder="会员卡名称" /> </cite></br>
		<cite> <span><em>*</em>返商户积分：</span>&nbsp&nbsp&nbsp <input type="text"
				name="name" check="required" placeholder="会员卡名称" /> </cite></br>
		<cite> <span><em>*</em>返平台积分：</span>&nbsp&nbsp&nbsp <input type="text"
				name="name" check="required" placeholder="会员卡名称" /> </cite>

	</form>
</div>