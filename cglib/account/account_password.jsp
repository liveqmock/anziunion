<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="account" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />

	<div class="main">


		<!-- 侧边 -->
		<div class="aside">
			<dl>
				<dt><i class="icon icon-lladdresshome"></i>商户中心：</dt>
				<dd><i class="icon icon-yonghuxinxi"></i><a href="getUser.shtml">基本信息</a></dd>
				<dd><i class="icon icon-shenfenrenzheng"></i><a href="account_store.shtml">商户认证</a></dd>
				<dd><i class="icon icon-yinxinglicai"></i><a href="poscode.shtml">POS机信息</a></dd>
				<dd ><i class="icon icon-bbgyinxingqia"></i><a href="account_bankList.shtml">银行卡绑定</a></dd>
				<dd class="active"><i class="icon icon-xiugaimima"></i><a href="go_password.shtml">修改登录密码</a></dd>
				<dd><i class="icon icon-xiugai"></i><a href="takePassword.shtml">修改提现密码</a></dd>
			</dl>
		</div>



			
	<h2 class="tle"><i class="icon icon-xiugaimima"></i>修改登录密码<small>为保证安全，密码请勿设置的过于简单。</small></h2>
			<form action="account_password.shtml" class="fukrm fukrm-ajax"  method="post">
		
				
				<label>
					<span><em>*</em>账户原密码：</span>
					<input type="password" name="oldpassword"  placeholder="请重入原密码" check="required"  class="fukrm_save">
					<p>输入您的账户修改前的密码以确认您的身份</p>
				</label>


				<label>
					<span><em>*</em>账户密码：</span>
					<input type="password" name="newpassword" placeholder="请输入提现密码" check="required"  class="checkstrong fukrm_save">
					<p style="width:400px;padding-top:5px;">
						密码强度: <span class="checkstrong_res">
						<b style="background:#ee2323;">弱</b><b>中</b><b>强</b></span><br>
						<img src="/images/icon_warm.png" style="vertical-align: -2px;">为保证您帐号的安全，建议密码由6-16位字符（字母、数字、符号）<br>组合而成，不能只使用一种字符，不区分大小写！
					</p>
				</label>

				<label>
					<span><em>*</em>确认账户密码：</span>
					<input type="password" name="renewpassword"  placeholder="请输入确认密码" check="required,repassword"  class="fukrm_save">
					<p>再次输入您的账户密码以确认您记住了您的密码</p>
				</label>


				<label><input type="submit" value="确认修改"></label>
			</form>

	</div>





	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm" /></jsp:include>