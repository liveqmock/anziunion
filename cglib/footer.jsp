<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<% 
	
	String js = request.getParameter("js");
	request.setAttribute("js",js);
%>

	<div style="clear:both"></div>
	<div class="footer">
		
			
		<div class="foot_copyright" >网站备案/许可证号：粤ICP备09096283号 Copyright2011-2014   All Rights Reserved</div>

		<div class="foot_3">
			<ul>
				<!--<li class="pay1"><a target="_blank" title="支付业务许可证">支付许可证</a></li>
				<li class="pay2"><a title="中国支付清算协会会员证" target="_blank">支付清算协会会员证 </a></li>
				<li class="pay3"><a title="中金国盛服务认证证书" target="_blank">中金国盛服务认证证书 </a></li>
				<li class="pay4"><a title="支付系统技术安全认证" target="_blank">系统技术安全认证 </a></li>
				<li class="pay5"><a target="_blank" title="Visa验证">Visa验证</a></li>
				<li class="pay6"><a title="诚信电商" target="_blank">诚信电商 </a></li>
				<li class="pay7"><a title="PCI DSS认证" target="_blank">PCI DSS</a></li>
				<li class="pay8"><a title="红盾信息电子标识" target="_blank">红盾信息电子标识</a></li>
			-->
			</ul>

		</div>


	</div>


	<div class="dialog"></div>
	
	<c:if test="${!empty userid}">
	<div id="haiiskefu">
	<div class="kfleft" title="点击查看联系方式"></div>
	<ul>
		<li><a rel="nofollow" href="http://wpa.qq.com/msgrd?v=3&uin=1357113262&site=qq&menu=yes" title="在线客服" target="_blank"></a></li>
		<li><a rel="nofollow" href="/getUser.shtml" title="商户中心" ></a></li>
		<li><a rel="nofollow" href="/article.shtml" title="帮助中心" ></a></li>
		<li><a rel="nofollow" href="/orderChartList.shtml" title="我的订单" ></a></li>
		<li><a rel="nofollow" href="/bill_withdraw.shtml" title="申请提现" ></a></li>
		<li><a rel="nofollow" href="/orderList.shtml" title="账单总表" ></a></li>
		<li><a title="客服电话"></a></li>
	</ul>
</div>
</c:if>
	<%-- 加载js --%>
<c:forEach var="item" items="${js}"><script src="/js/${item}.js" ></script></c:forEach>

<script type="text/javascript">
$(function() {
    $(".kfleft").click(function(){
		var i=$("#haiiskefu").css("right");
		if (i=='0px'){
			$('#haiiskefu').animate({right:-80}, 200);
		} else {
			$('#haiiskefu').animate({right:0}, 200);
		}
	});
});
</script>

