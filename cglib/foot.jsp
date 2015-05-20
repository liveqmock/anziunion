<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<% 
	
	String js = request.getParameter("js");
	request.setAttribute("js",js);
%>

	<div style="clear:both"></div>
	<div class="footer">
		<div class="foot_nav">
		
		
			<a style="color:  #08c;" >关于我们</a> ｜
			<a style="color:  #08c;" >联系我们</a> ｜
			<a style="color:  #08c;" >网站资质</a> ｜
			<a style="color:  #08c;" href="/apply.shtml">合作加盟</a> 
			
		</div>
		
			
		<div class="foot_copyright" >网站备案/许可证号：粤ICP备09096283号 Copyright2011-2014   All Rights Reserved</div>
	
<!-- 
		<div class="foot_power">
			<a href="#"><img src="/images/foot_01.jpg" alt=""></a>
			<a href="#"><img src="/images/foot_02.jpg" alt=""></a>
			<a href="#"><img src="/images/foot_03.jpg" alt=""></a>
			<a href="#"><img src="/images/foot_04.jpg" alt=""></a>
			<a href="#"><img src="/images/foot_05.jpg" alt=""></a>
			<a href="#"><img src="/images/foot_06.jpg" alt=""></a>
			<a href="#"><img src="/images/foot_07.jpg" alt=""></a>
			<a href="#"><img src="/images/foot_08.jpg" alt=""></a>
			<a href="#"><img src="/images/foot_09.jpg" alt=""></a>
			<a href="#"><img src="/images/foot_10.jpg" alt=""></a>

		</div>
 -->

	</div>


	<div class="dialog"></div>
	
	<c:if test="${!empty userid}">
	<div id="haiiskefu">
	<div class="kfleft" title="点击查看联系方式"></div>
	<ul>
		<li><a rel="nofollow" href="http://wpa.qq.com/msgrd?v=3&uin=1357113262&site=qq&menu=yes" title="在线客服" target="_blank"></a></li>
		<li><a rel="nofollow" href="getUser.shtml" title="商户中心" ></a></li>
		<li><a rel="nofollow" href="article.shtml" title="帮助中心" ></a></li>
		<li><a rel="nofollow" href="orderChartList.shtml" title="我的订单" ></a></li>
		<li><a rel="nofollow" href="bill_withdraw.shtml" title="申请提现" ></a></li>
		<li><a rel="nofollow" href="orderList.shtml" title="账单总表" ></a></li>
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