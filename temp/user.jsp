<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title>Document Admin</title>
	<link rel="stylesheet" href="/temp/css/global.css">
	<link rel="stylesheet" href="/temp/css/user.css">
</head>
<body>
<!-- 完全异步模版 -->

	<div class="head">
		<div class="head_top">
		<div class="head_top_time"><i class="icon">&#xe663;</i>2015-01-22  15:41:03</div>
			
			<ul class="head_top_tool">
				<li><a target="_blank" href="http://www.anzimall.com/">积分商城</a></li>
				<li><a target="_blank" href="http://card.anzipay.com/">安子预付卡</a></li>
				<li><a target="_blank" href="http://anzipay.com/">安子支付</a></li>
				<li><a target="_blank" href="http://www.anziapp.com/">安子助手</a></li>
				<li><a target="_blank" href="http://119.254.69.98:8090/agentmgr/">分销平台</a></li>
				<li><a target="_blank" href="/article.shtml">帮助中心</a></li>
			</ul>
		</div>

		<div class="head_nav">
			<a class="head_nav_home" href="/info.shtml"><img src="/temp/images/head_logo.png" alt="首页"></a>

			<div class="head_nav_menu dropdown">
				<a href="#" ><i class="icon">&#xe663;</i></a>
				<cite>
					<p>系统菜单，您可以点击这里的链接快速进入到相应页面</p>
					<a href="/getUser.shtml" style="background: #65a6ff;"><i class="icon">&#xe663;</i><span>商户中心</span></a>
					<a href="/article.shtml" style="background: #9cd159;"><i class="icon">&#xe663;</i><span>在线帮助</span></a>
					<a href="/orderChartList.shtml" style="background: #fa7753;"><i class="icon">&#xe663;</i><span>我的订单</span></a><br>
					<a href="/bill_withdraw.shtml" style="background: #984dff;"><i class="icon">&#xe663;</i><span>申请提现</span></a>
					<a href="/orderList.shtml" style="background: #ffcc00;"><i class="icon">&#xe663;</i><span>我的账单</span></a>
					<a href="/getUserVipList.shtml" style="background: #41e5c0;"><i class="icon">&#xe663;</i><span>推广返利</span></a>
				</cite>
			</div>

			<div class="head_nav_user dropdown">
				<a href="#"><img src="${list[0].logo}" alt="">${list[0].username}</a>
				<cite>
					<a href="/getUser.shtml" title=""><i class="icon">&#xe663;</i>账户信息</a>
					<a href="/index.shtml" title=""><i class="icon">&#xe663;</i><b>退出登录</b></a>
				</cite>
			</div>


			<div class="head_nav_note">
			
				<!-- 当日线下预约 -->
				<div class="head_nav_note_item dropdown">
					<a href="#" title="线下预约"><span style="background: #56c0e7;">
						<c:if test="${empty list6}">0</c:if>
						<c:if test="${!empty list6}">${fn:substringBefore(list8[0].numbers,".")}</c:if>
					</span><i class="icon">&#xe663;</i></a>
					<c:if test="${!empty list6}">
					<cite class="dropdown_toleft" >
						<ul>
						<c:forEach var="list6" items="${list6}">
							<li>
			
								<h3><i class="icon">&#xe663;</i><a href="#" ><fmt:formatDate value="${list6.bookingdate}"  pattern="yyyy-MM-dd HH:mm:ss"/></a></h3>
								<p>账号：${list6.phone},商品名称：${list6.cname},数量：${list6.number}</p>
							</li>	
						</c:forEach>	
						</ul>
						<h6><a href="/billtOrdrdatarecord.shtml">查看全部</a><i class="close icon" title="关闭">&#xe663;</i></h6>
					</cite>
					</c:if>
				</div>

				<!-- 当日线上购买 -->
				<div class="head_nav_note_item dropdown">
					<a href="#" title="线上购买"><span style="background: #ff5757;">
					<c:if test="${empty list5}">0</c:if>
						<c:if test="${!empty list5}">${fn:substringBefore(list7[0].numbers,".")}</c:if>
					</span><i class="icon">&#xe663;</i></a>
					<c:if test="${!empty list5}">
					<cite class="dropdown_toleft" >
						<ul>
							<c:forEach var="list5" items="${list5}">
							<li>
								<h3><i class="icon">&#xe663;</i><a href="#" ><fmt:formatDate value="${list5.bookingdate}"  pattern="yyyy-MM-dd HH:mm:ss"/></a></h3>
								<p>账号：${list5.phone},商品名称：${list5.cname},数量：${list5.number}</p>
							</li>
						</c:forEach>	
						</ul>
						<h6><a href="/getorderBuyList.shtml">查看全部</a><i class="close icon" title="关闭">&#xe663;</i></h6>
					</cite>
					</c:if>
				</div>
			</div>

		</div>
	</div>
			

	<div class="side">
		<dl>
			<dt><a href=""><i class="icon">&#xe663;</i>账户结算</a><i class="icon">&#xe663;</i></dt>
			<dd><a href="/orderList.shtml"><i class="icon">&#xe663;</i>账单总表</a></dd>
			<dd><a href="/billtOrdrdatarecord.shtml"><i class="icon">&#xe663;</i>线下预约</a></dd>
			<dd><a href="/getorderBuyList.shtml"><i class="icon">&#xe663;</i>线上购买</a></dd>
			<dd><a href="bill_pos.shtml"><i class="icon">&#xe663;</i>pos机刷卡明细</a></dd>
			<dd><a href="bill_withdraw.shtml"><i class="icon">&#xe663;</i>立即提现</a></dd>
			<dd><a href="bill_members.shtml"><i class="icon">&#xe663;</i>提现记录</a></dd>
			<dd><a href="orderChartList.shtml"><i class="icon">&#xe663;</i>订单统计</a></dd>
		</dl>

		<dl>
			<dt><a href=""><i class="icon">&#xe663;</i>商品管理</a><i class="icon">&#xe663;</i></dt>
			<dd><a href="product_lis_request.shtml"><i class="icon">&#xe663;</i>商品列表</a></dd>
			<dd><a href="product_Pendingauditlist_request.shtml"><i class="icon">&#xe663;</i>待审核商品</a></dd>
			<dd><a href="product_Notthroughlist_request.shtml"><i class="icon">&#xe663;</i>未通过商品</a></dd>
			<dd><a href="product_downlist_request.shtml"><i class="icon">&#xe663;</i>已下架商品</a></dd>
			<dd><a href="commodity_add.shtml"><i class="icon">&#xe663;</i>添加商品</a></dd>
		</dl>
		<dl>
			<dt><a href=""><i class="icon">&#xe663;</i>优惠管理</a><i class="icon">&#xe663;</i></dt>
			<dd><a href="vipCardList.shtml"><i class="icon">&#xe663;</i>会员卡列表</a></dd>
			<dd><a href="vipCard.shtml"><i class="icon">&#xe663;</i>发布会员卡</a></dd>
			<dd><a href="vipCardOrder.shtml"><i class="icon">&#xe663;</i>会员卡订单数据</a></dd>
			<dd><a href="promote.shtml"><i class="icon">&#xe663;</i>推广返利</a></dd>
		
		</dl>
		<dl>
			<dt><a href=""><i class="icon">&#xe663;</i>商户中心</a><i class="icon">&#xe663;</i></dt>
			<dd><a href="getUser.shtml"><i class="icon">&#xe663;</i>基本信息</a></dd>
			<dd><a href="account_store.shtml"><i class="icon">&#xe663;</i>商户认证</a></dd>
			<dd><a href="poscode.shtml"><i class="icon">&#xe663;</i>POS机信息</a></dd>
			<dd><a href="account_bankList.shtml"><i class="icon">&#xe663;</i>银行卡绑定</a></dd>
			<dd><a href="go_password.shtml"><i class="icon">&#xe663;</i>修改登录密码</a></dd>
			<dd><a href="takePassword.shtml"><i class="icon">&#xe663;</i>修改提现密码</a></dd>
		</dl>
	</div>


	<div class="main">
	
	

</div>
	<script src="/temp/js/global.js"></script>
	<script src="/temp/js/echarts-all.js"></script>

	

</body>
</html>