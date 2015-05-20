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
				<dd><i class="icon icon-shengrilibao"></i><a href="/investIndex.shtml">创富礼包</a></dd>
				<dd><i class="icon icon-bbgzhaoshang"></i><a href="/invenstTglist.shtml">招商创富</a></dd>
			<c:if test="${temp_flag eq 1}">
				<dd class="active"><i class="icon icon-tuiguangjihua"></i><a href="/invenstSpread.shtml">创富推广</a></dd>
			</c:if>		
			</dl>
		</div>


		<h2 class="tle">
			<span style="font-size:16px;font-weight:normal;">您的创富职级：</span><strong>商务助理 </strong>
			<small>距离晋级商务主管还需点亮 <font color="#ee2323;">6</font> 盏彩灯</small>
		</h2>
		
		<br>

		<div style="float:none;width:auto;background: #f8f8f8;padding:20px;">
			
			<p style="margin-bottom:10px;"><strong>1.链接推广：</strong></p>
			<p><a href="http://union.anzimall.com/register_basic_invenst.shtml?sigen=${sigen_flag }" target="_blank" style="color:#41af05;">http://union.anzimall.com/register_basic_invenst.shtml?sigen=${sigen_flag }</a><br><b class="btn js-copy" style="padding:10px;width:auto;margin-top:10px;">点击复制链接</b></p>
			<br><br>

			<p style="margin-bottom:10px;"><strong>2.资源码推广：</strong></p>
			<p>您的资源码：<span style="color:#f86c06;">${sigen_flag }</span></p>
			<p>注册链接：<a href="http://union.anzimall.com/register_basic_invenst.shtml?sigen=${sigen_flag }" target="_blank" style="color:#41af05;">http://union.anzimall.com/register_basic_invenst.shtml</a> 注册时在资源码栏填入资源码</p>
			<br><br>
			
			<p style="margin-bottom:10px;"><strong>1.二维码：</strong></p>
			<p class="qrcodeTable" qrcode="http://union.anzimall.com/register_basic_invenst.shtml?sigen=${sigen_flag }"></p>

			<div style="background:#4293fd;color:#fff;padding:10px ;margin-top:20px;">说明：按上述步骤完成注册流程后，登录异业联盟，选择创富系统板块，申购创业礼包，成功后即完成创富推广工作。</div>
		</div>



		<div style="margin:20px;line-height:30px;">
			<h4>职级晋升规则：</h4>
			<ul style="color:#797b7b;">
				<li>• 商务助理招满10个商务助理→次日晋级为商务主管</li>
				<li>• 商务主管帮助10商务助理晋级为商务主管→次日晋级为商务经理</li>
				<li>• 商务经理帮助10商务主管晋级为商务经理→次日晋级为商务总监</li>
				<li>• 商务总监帮助10商务经理晋级为商务总监→次日晋级为荣誉董事</li>
			</ul>
			<h5>晋升方法：邀请其他商户成功注册异业联盟并申购创业礼包</h5>
		</div>
		


	</div>
<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,jquery.flot,backstage" /></jsp:include>





<script type="text/javascript" src="/js/jquery.qrcode.js"></script> 
<script type="text/javascript" src="/js/qrcode.js"></script>
<script type="text/javascript" src="/js/jquery.zclip.min.js"></script>

<script type="text/javascript">

$('.head_nav').find('a[href="investIndex.shtml"]').parent().addClass('active');


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


