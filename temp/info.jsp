<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<style>
	.info_head{width: 100%;overflow: hidden;}
	.info_head_user{position: absolute;top: 45px;left: 140px; width: 80px;height: 80px;overflow: hidden;border: 2px solid #e1e1e1;-webkit-border-radius: 50%;-webkit-background-clip: padding-box;-moz-border-radius: 50%;-moz-background-clip: padding;border-radius: 50%;background-clip: padding-box;}
	.info_head_user img{width: 80px;height: 80px;}
	.info_head h2{position: absolute;top: 70px;left: 240px;font-size: 14px;font-weight: normal;color: #fff;font-family: '宋体';}
	.info_head h2 strong{font-size: 18px;font-weight: 500;font-family: '微软雅黑';}
	.info_head p{position: absolute;top: 110px;left: 240px;font-size: 12px;font-weight: normal;color: #fff;}

	.info_bill{margin-top: 10px;padding: 20px 5px; background: #fff;overflow: hidden;}
	.info_bill dl{position: relative; float: left;width: 50%;background: #fff;}
	.info_bill dl:before{ content: '';margin: 0 5px; border:1px solid #ebebeb;position: absolute;left: 0;top: 0;right: 0;bottom: 0;border-radius: 2px;}
	.info_bill dd {position: relative; margin: 0 5px;height: 100px;  padding: 30px 0 20px 20px;}
	.info_bill h3{display: inline-block;font-size: 20px;color: #797979; white-space: nowrap;}
	.info_bill h3 strong{font-size: 60px;font-weight: 600;}
	.info_bill p{display: inline-block;}
	.info_bill dd a{margin-right: 5px;}
	.info_bill .more{ color: #70d5fb;}
	.info_bill .more i{vertical-align: 0;}


	.info_table{margin-top: 10px;background: #fff;padding: 20px 5px; }
	.info_table h2{border:1px solid #ebebeb;}
	.info_table .table{margin: 0 5px;}
	.info_table .table table{margin-top: -1px;}
	.info_table p{margin: -1px 5px 0;border: 1px solid #ebebeb; height: 40px;line-height: 40px;font-size: 12px;color: #666;text-indent: 10px;}
	.info_table p a{color: #70d5fb;}

	.info_links {margin-top: 10px;padding: 20px 5px;background: #fff;}
	.info_links a{display: inline-block;width: 90px;height: 45px;padding: 10px 0;margin:0  5px; text-align: center;color: #fff;}
	.info_links i {font-size: 24px;line-height: 30px;}
	.info_links span{display: block;}
	.info_links a:hover{opacity: 0.8;}
	.monerys{display:none; position: absolute;margin-top:-3px; background-color: #fff;border: 1px solid #b9c8d3;padding:5px;}
	.monerys:before{content: '';position:absolute;width: 0;height: 0;top: -7px;left: 10px;border-style: solid;border-width: 0 7px 7px;
		border-color: transparent transparent #b9c8d3;
	}
	.monerys:after{content: '';position:absolute;width: 0;height: 0;top: -6px;left: 10px;border-style: solid;border-width: 0 7px 7px;
	border-color: transparent transparent #fff;
	}

	.monerys table{margin-top:0;}
</style>


<div class="info">

	<div class="info_head">
		<img src="/temp/images/info_head_bkg.jpg" alt="">
		<a class="info_head_user" href="#"><img src="${list[0].logo}" alt=""></a>
		<h2><strong>晚上好！${list[0].username}</strong></h2>
		<p>帐户名：${fn:substring(list[0].mobile,0 ,4)}***${fn:substring(list[0].mobile,7 ,11)} <a href="#"><i class="icon">&#xe663;</i></a> <a href="#"><i class="icon">&#xe663;</i></a></p>
	</div>

	<div class="info_bill">
		<dl>
			<dt class="tle"><i class="icon">&#xe663;</i>帐户余额</dt>
			<dd>
				<c:if test="${empty list2}"><h3>￥<strong>000</strong>.00 元</h3></c:if>
				<c:if test="${!empty list2}">
				<h3>￥<strong>${list2[0].money}</strong>.00 元</h3>
				</c:if>
				<p>
					<a href="bill_withdraw.shtml" class="btn" style="background:#fd9403;">提 现</a>
					<a href="bill_withdraw.shtml" class="btn">查看</a>
					<a href="bill_members.shtml" class="more"><i class="icon">&#xe663;</i>查看提现明细</a>
				</p>
			</dd>
		</dl>
		<dl>
			<dt class="tle"><i class="icon" style="color:#f88702">&#xe663;</i>本月收益</dt>
			<dd>
			<c:if test="${empty list3[0].moneys}"><h3>￥<strong>00</strong>.00 元</h3></c:if>
			<c:if test="${!empty list3[0].monerys}">
				<h3>￥<strong>${list3[0].moneys}</strong>.00 元</h3>
			</c:if>	
				<p>
					<a href="orderChartList.shtml" class="btn">订 单</a>
					<a href="orderChartList.shtml" class="btn" style="background:#fd9403;">查看</a>
					<a href="bill_pos.shtml" class="more"><i class="icon">&#xe663;</i>查看入帐明细</a>
				</p>
			</dd>
		</dl>
	</div>


	<div class="info_table">
		<h2 class="tle"><i class="icon" style="color:#f46302;">&#xe663;</i>提现动态</h2>
		<div class="table">
			<table border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						
						<th>时间</th>
						<th>提取金额</th>
						<th>剩余金额</th>
						<th>姓名</th>
						<th>银行卡号</th>
						<th>到账方式</th>
						<th>状态</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list4}"><tr><td colspan="6"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>
					<c:forEach var="list4" items="${list4}" begin="0" end="6">
					<tr>
						<td><fmt:formatDate value="${list4.sysdate}"  pattern="yyyy-MM-dd"/></td>
						<td>
							<span style="color: #f37800;"  class="monery">-${list4.fetchmoney}<img src="/images/moneys.png" title="点击查看详情" style="padding-top: 13px;padding-left: 10px;"></span>
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
						<td>${list4.name}</td>
						<td>${fn:substring(list4.card,0 ,8)}******${fn:substring(list4.card,13 ,16)}</td>
						<td>
							<c:if test="${list4.type eq '0'}">T+0</c:if>
							<c:if test="${list4.type eq '1'}">T+1</c:if>
							<c:if test="${list4.type eq '2'}">T+2</c:if>
							<c:if test="${list4.type eq '3'}">T+3</c:if>
							<c:if test="${list4.type eq '4'}">T+4</c:if>
							<c:if test="${list4.type eq '5'}">T+5</c:if>
							
						</td>
						<td>
							<c:if test="${list4.state eq '0'}"><span style="color: #f37800;">审核中</span></c:if>
							<c:if test="${list4.state eq '1'}"><span style="color:#53a000; ">已通过</span></c:if>
							<c:if test="${list4.state eq '2'}"><span style="color: red;">未通过</span></c:if>

						</td>	
					</tr>
					</c:forEach>
					
				</tbody>			
			</table>
		</div>

		<p>资产动态记录企业资金（提现，商品销售，pos扣率等）最新信息如需查看理详细信息，请访问
			<a href="#">收入明细</a>、
			<a href="#">提现明细</a>、
			<a href="#">订单详情</a>...
		</p>
		
	</div>

	
	<div class="info_links">	
		<a href="/getUser.shtml" style="background: #65a6ff;"><i class="icon">&#xe663;</i><span>商户中心</span></a>
		<a href="/article.shtml" style="background: #9cd159;"><i class="icon">&#xe663;</i><span>在线帮助</span></a>
		<a href="/orderChartList.shtml" style="background: #fa7753;"><i class="icon">&#xe663;</i><span>我的订单</span></a>
		<a href="/bill_withdraw.shtml" style="background: #984dff;"><i class="icon">&#xe663;</i><span>申请提现</span></a>
		<a href="/orderList.shtml" style="background: #ffcc00;"><i class="icon">&#xe663;</i><span>我的账单</span></a>
		<a href="/getUserVipList.shtml" style="background: #41e5c0;"><i class="icon">&#xe663;</i><span>推广返利</span></a>
	</div>

</div>	
<script>
			$(document).on('click','span.monery',function(){
				var monerys = $(this).siblings('.monerys').show();
				$(document).one('click',function(){
					monerys.hide();
				})
			});



	</script>