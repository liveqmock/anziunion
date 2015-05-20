<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="account" />
</jsp:include>


<div class="main">


	<div class="aside">
		<dl>

			<dt><i class="icon icon-shanghu01"></i>电商创业系统</dt>
			<c:if test="${pionner_flag eq 1}"><dd class="active"><i class="icon icon-shuju"></i><a href="/pioneerDetail.shtml">创业中心</a></dd></c:if>
			<c:if test="${pionner_flag eq 0}"><dd class="active"><i class="icon icon-fabu"></i><a href="/pioneerIndex.shtml">创业说明</a></dd></c:if>
			<c:if test="${pionner_flag eq 1}"><dd><i class="icon icon-icon"></i><a href="/pioneer_withdraw_deposit_detail.shtml">提现操作</a></dd></c:if>
			<dd><i class="icon icon-tubiaozitihua01"></i><a href="/getNotice.shtml">公告</a></dd>
		</dl>
	</div>



	<h2 class="tle"><i class="icon icon-xiugai"></i>修改提现密码<small>为保证安全，密码请勿设置的过于简单。</small></h2>
			<form action="updateTakePasswod.shtml" class="fukrm fukrm-ajax"  method="post">
		
				<label>
					<span><em>*</em>提现原密码：</span>
					<input type="password" name="oldpassword"  placeholder="请输入提现密码" check="required"  class="fukrm_save">
					<p>输入您的账户修改前的密码以确认您的身份</p>
				</label>


				<label>
					<span><em>*</em>提现新密码：</span>
					<input type="password" name="newpassword" placeholder="请输入提现新密码" check="required"  class="checkstrong fukrm_save">
					<p style="width:400px;padding-top:5px;">
						密码强度: <span class="checkstrong_res">
						<b style="background:#ee2323;">弱</b><b>中</b><b>强</b></span><br>
						<img src="/images/icon_warm.png" style="vertical-align: -2px;">为保证您帐号的安全，建议密码由6-16位字符（字母、数字、符号）<br>组合而成，不能只使用一种字符，不区分大小写！
					</p>
				</label>

				<label>
					<span><em>*</em>确认新提现密码：</span>
					<input type="password" name="renewpassword"  placeholder="请确认提现密码" check="required,repassword"  class="fukrm_save">
					<p>再次输入您的账户密码以确认您记住了您的密码</p>
				</label>


				<label><input type="submit" value="确认修改"></label>
			</form>

	</div>





	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm" /></jsp:include>