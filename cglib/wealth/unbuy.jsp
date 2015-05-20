<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<jsp:include page="/cglib/header.jsp"><jsp:param name="css" value="global,backstage" /><jsp:param name="header_active" value="invest" /></jsp:include>
<jsp:include page="/cglib/validation.jsp"  />
<style>
	.wealth_content{position: relative;overflow: hidden;}
	.wealth_content a{position: absolute;}
</style>

	<div class="main cs">
		
		<div class="aside">
			<dl>
				<dt><i class="icon icon-youqianrenxing"></i>创富系统</dt>
				<dd class="active"><i class="icon icon-shengrilibao"></i><a href="/investIndex.shtml">创富礼包</a></dd>
				<dd><i class="icon icon-bbgzhaoshang"></i><a href="/invenstTglist.shtml">招商创富</a></dd>
			
			<c:if test="${temp_flag eq 1}">
				<dd><i class="icon icon-tuiguangjihua"></i><a href="/invenstSpread.shtml">创富推广</a></dd>
			</c:if>	
			
			</dl>
		</div>


		<h2 class="tle">
			<i class="icon icon-tuiguangshuoming"></i>招商创富
			<small>邀请好友加入，享消费返利</small>
		</h2>
		
		<br>
		<div class="wealth_content">
			<img src="/images/register_banner_3.jpg" alt="" style="width: 100%;height: 100px;">
		
			<a href="#" style="left: 630px;top: 30px;"><img src="/images/icon_upload_vipcard.png" alt=""></a>
		</div>

		<img src="test1.png" alt="" style="width: 100%;">
		
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
						<tr><td colspan="8"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr>
						
						
						
					</tbody>			
				</table>
			</div>

			<p>资产动态记录企业资金（提现，商品销售，pos扣率等）最新信息如需查看理详细信息，请访问
				<a href="/orderList.shtml">收入明细</a>、
				<a href="/bill_members.shtml">提现明细</a>、
				<a href="/orderChartList.shtml">订单详情</a>...
			</p>
			
		</div>



	</div>
<!-- 页脚 -->

<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,jquery.flot,backstage" /></jsp:include>

<script>
	$('.head_nav').find('a[href="investIndex.shtml"]').parent().addClass('active');
</script>
	