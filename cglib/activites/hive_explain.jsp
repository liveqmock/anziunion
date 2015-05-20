<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="hive" />
</jsp:include>

	<!--[if IE]><script type="text/javascript" src="/js/excanvas.compiled.js"></script><![endif]-->
	
	<div class="main cs">
		

		<div class="aside">
			<dl>
				<dt><i class="icon icon-iconfontliubianxing"></i>云蜂巢系统</dt>
				<dd><i class="icon icon-lianmeng"></i><a href="gethiveaction.shtml">云蜂巢</a></dd>
				<dd class="active"><i class="icon icon-tuiguangshuoming"></i><a href="hive_explain.shtml">推广说明</a></dd>
				<dd><i class="icon icon-yaoqing"></i><a href="hive_pop.shtml">推广账号</a></dd>
			</dl>
		</div>


		<h2 class="tle">
			<i class="icon icon-tuiguangshuoming"></i>推广说明
			<small>邀请好友加入，享消费返利</small>
		</h2>
		
		<div class="hive_explain_dis">
			积分商城推出积分返利推广计划，您可以通过分享或者其他方式推荐您的朋友或者商户来注册加入商城，通过您注册加入的用户在商城的消费或收益将有一部分积分回馈给您，推荐越多返利越多!
		</div>

		<div class="hive_explain">
			<dl>
				<dt>用户推广</dt>
				<dd><h4>您可以通过以下方式推广来赚取返利积分：</h4>
					<strong>1.二维码：</strong>
					<p class="qrcodeTable" qrcode="http://www.anzimall.com/to_register_info.shtml?tg_sigen=${sigen}"></p>
					<strong>2.注册链接：</strong>
					<p>将您的专属注册链接分享给您的朋友，注册后此用户账号将与您的账号绑定，此用户在商城旗下商户消费后将返利积分返回到您的账户。</p>
					您的注册链接：<br>
					<a href="http://www.anzimall.com/to_register_info.shtml?tg_sigen=${sigen}" target="_blank">http://www.anzimall.com/to_register_info.shtml?tg_sigen=${sigen}</a><br><br>
					<b class="btn js-copy" style="padding:10px;width:auto;">点击复制链接</b>
				</dd>
			</dl>
			<dl>
				<dt>商户推广</dt>
				<dd><h4>您可以通过以下方式推广来赚取返利积分：</h4>
					<strong>1.二维码:</strong>
					<p class="qrcodeTable" qrcode="http://union.anzimall.com/register_basic.shtml?sigen=${sigen}"></p>
					<strong>2.注册链接：</strong>
					<p>将您的专属注册链接分享给您的朋友，注册后此用户账号将与您的账号绑定，此用户在商城旗下商户消费后将返利积分返回到您的账户。</p>
					您的注册链接：<br>
					<a href="http://union.anzimall.com/register_basic.shtml?sigen=${sigen}" target="_blank">http://union.anzimall.com/register_basic.shtml?sigen=${sigen}</a><br><br>
					<b class="btn js-copy" style="padding:10px;width:auto;">点击复制链接</b>
				</dd>
			</dl>
		</div>

	</div>
<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,echarts-all,backstage" /></jsp:include>
<script type="text/javascript" src="/js/jquery.qrcode.js"></script> 
<script type="text/javascript" src="/js/qrcode.js"></script>
<script type="text/javascript" src="/js/jquery.zclip.min.js"></script>
<script>
	
	var qrcodeTable = $(".qrcodeTable").each(function(){
		$(this).qrcode({render:"img",text:this.getAttribute('qrcode'),width:180,height:180});
	});


	$('b.js-copy').each(function(){
		var $this = $(this)
		$this.zclip({
			path:'/js/ZeroClipboard.swf',
			copy:$this.siblings('a').text()
		});
	});



</script>
		