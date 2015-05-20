<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/cglib/validation.jsp" flush="true"/>
<jsp:include page="/cglib/invenstValidation.jsp" flush="true"/>
<jsp:include page="/cglib/header.jsp"><jsp:param name="css" value="global,backstage" /><jsp:param name="header_active" value="invest" /></jsp:include>
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


		
		<br>
		<div class="wealth_content">
			 <form action="http://182.50.116.24:8080/mcsmgr/upop/anzipayto.jsp"  method=post class="fukrm">  
				<input type="hidden"  name="subject" value="${subject}">
				<input type="hidden"  name="body" value="${body}">
				<input type="hidden"  name="ordertime" value="${order_time}">
				<input type="hidden"  name="partner" value="${partner}">
				<input type="hidden"  name="out_trade_no" value="${out_trade_no}">
				<input type="hidden"  name="total_fee" value="${money}">
				<input type="hidden"  name="sign" value="${sign}">
				<input type="hidden"  name="name" value="${cname}">
				<input type="hidden"  name="notify_url" value="${notify_url}">
				<input type="hidden"  name="return_url" value="${return_url}">
				<input type="hidden"  name="_input_charset" value="${_input_charset}">
				<input type="hidden"  name="sign_type" value="${sign_type}">
				
				
				<cite>
					<span>收货地址</span>
					<label>${province}${city}${county} <br>${address}</label>
				</cite>


				<cite>
					<span>联系电话：</span>
					<label>${phone}</label>
				</cite>

				<cite>
					<span>联系人：</span>
					<label><b>${name}</b> (收)</label>
				</cite>


				<br>
				<cite><label><input type="submit" value="立即支付"></label></cite>

			</form>
		</div>



	</div>
<!-- 页脚 -->




<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,jquery.flot,backstage" /></jsp:include>
<script>
	$('.head_nav').find('a[href="investIndex.shtml"]').parent().addClass('active');
</script>


