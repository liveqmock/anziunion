<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
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
				<dd><i class="icon icon-shengrilibao"></i><a href="/investIndex.shtml">创富礼包</a></dd>
				<dd><i class="icon icon-bbgzhaoshang"></i><a href="/invenstTglist.shtml">招商创富</a></dd>
			
			<c:if test="${temp_flag eq 1}">
				<dd><i class="icon icon-tuiguangjihua"></i><a href="/invenstSpread.shtml">创富推广</a></dd>
			</c:if>	
			
			</dl>
		</div>


		<br>
		<div class="wealth_content">
			
			<form action="/saveMerchantsOrder.shtml" class="fukrm fukrm-check" method="post">
				
				<input type="hidden" name="tmid" value="${tmid }">
				
			
				
					<cite>
						<span>安子支付创业礼包</span>
						<label><b style="font-size: 32px;vertical-align: 0;margin-top: -9px;display: inline-block;margin-right: 3px;color: #6BEA56;">5608</b>元</label>
					</cite>

					<cite>
						<span><em>*</em>收货人姓名：</span>
						<label><input type="text" name="name" placeholder="请输入收货人姓名" check="required"></label>
					</cite>
					<cite>
						<span><em>*</em>收货人电话：</span>
						<label><input type="text" name="phone" placeholder="请输入收货人联系电话" check="required,phone"></label>
					</cite>
			
					<cite>
						<span><em>*</em>收货人地址：</span>
						<label class="js-form-city">
							<select class="prov" name="province"  style="width: 120px;" ></select>
							<select class="city" name="city" style="width:120px;"></select>
							<select class="town" name="county" style="width:180px;"></select>
						</label>
					</cite>
						
					<cite>
						<span><em>*</em>详细地址：</span>
						<label><input type="text" name="address" placeholder="请输入收货人详细地址，精确到门牌号" check="required" style="width: 500px;"></label>
					</cite>


					<br>
					<cite><label><input type="submit" value="提交"></label></cite>


			
			</form>
		</div>

	</div>



<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm" /></jsp:include>

<script>$('.head_nav').find('a[href="investIndex.shtml"]').parent().addClass('active');</script>