<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>


<jsp:include page="/cglib/validation.jsp" flush="true"/>
<style>
.table{font: normal;text-decoration: none;font-size: 14px;line-height: 35px;display: block;}
.table a:hover{text-decoration: underline;}
</style>
<div class="dialog_box" style="height: 400px;">
	
	<div class="table">
		<p style="font-size: 24px;font-weight: bold;">您可以通过以下方式推广来赚取返利积分:</p>
		<p><span style="color: red;">1.注册码：</span>推荐您的朋友注册时，只需要填写此注册码，注册的用户账号将与您的账号<br>
			绑定，此用户在商城旗下商户消费后将返利积分返回到您的账户。</p>
		<p><span style="color: #11A66E;">您的注册码是：${code}</span></p>
		<p><span style="color: red;">2.注册链接：</span>将您的专属注册链接分享给您的朋友，注册后此用户账号将与您的账号<br>
			绑定，此用户在商城旗下商户消费后将返利积分返回到您的账户</p>
		<p><span style="color: #11A66E;">您的注册链接：<a href="${url}">${url}</a></span></p>
		<p><span style="color: red;">3.商品分享：</span>您可以通过商城分享商城内任意商品给您的朋友，如您朋友通过此链接<br>
			注册，注册的用户账号将与您的账号绑定，此用户在商城旗下商户消费后将返利积分<br>
			返回到您的账户。</p>
	</div>
</div>

<script>
	dialog.dialog("option","title", "	怎样推广赚取积分？");
</script>
