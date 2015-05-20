<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<jsp:include page="/cglib/header.jsp"><jsp:param
		name="css" value="global,register" /></jsp:include>

<style>
	a.pioneer_code_default:hover{color:#08c;}
</style>

<div class="center reginster">
	<h2 class="register_title">
		<strong>帐户注册</strong>

		<span>已注册，马上<a href="index.shtml">登录</a>
		</span>
	</h2>

<!-- <div class="steps"><img src="/images/steps_register1.png" alt=""></div> -->


	<form action="registeredEntrepreneurship.shtml"
		class="fukrm fukrm-ajax">
		<input type="hidden" name="type" value="2">

	
	
		

		<label>
			<span><em>*</em>手机号码：</span>
			<input type="text" name="mobile" placeholder="请输入联系人手机号码"
				check="required,phone,ajax_register_phone" class="fukrm_save">
			<p>
				手机号码为异业联盟登陆账户名，请保证输入正确有效
			</p>
		</label>


		<label>
			<span><em>*</em>短信验证码：</span>
			<input type="text" name="code" placeholder="请输入手机验证码"
				check="required,ajax_register_phone" style="width: 136px"
				class="checkcode">
			<b class="getcode" for="mobile" url="getverificationcode.shtml">获取验证码
				></b>
			<p>
				请点击“获取验证码”获取验证码，验证码5分钟内有效
			</p>
		</label>


		<label>
			<span><em>*</em>账户密码：</span>
			<input type="password" name="password" placeholder="请输入异业联盟账户密码"
				check="required,password" class="checkstrong fukrm_save">
			<p style="width: 400px; padding-top: 5px;">
				密码强度:
				<span class="checkstrong_res"> <b>弱</b><b>中</b><b>强</b>
				</span>
				<br>
				<img src="/images/icon_warm.png" style="vertical-align: -2px;">
				为保证您帐号的安全，建议密码由6-16位字符（字母、数字、符号）
				<br>
				组合而成，不能只使用一种字符，不区分大小写！
			</p>
		</label>


		<label>
			<span><em>*</em>确认账户密码：</span>
			<input type="password" name="" placeholder="请重新输入账户密码"
				check="required,repassword" class="fukrm_save">
		</label>
		
			<cite>
			<span><em>*</em>邀请码：</span><!-- required,textlength -->
			<input type="text" name="sigen" check="required,pioneer_code" class="pioneer_form_code" placeholder="请输入推荐人资源码" >
			<p class="pioneer_name">请联系您的推荐人，以获取邀请码，<a class="pioneer_code_default">如果没有邀请码，请点此输入默认资源码</a></p>
		</cite>
		<cite>
			<span>联盟商户：</span>
			<input type="text" name="psigen">
		</cite>
		<label style="display: inline-block;">
			<input type="checkbox" name="agreement" class="checkagree"
				checked="true" check="checked">
			已阅读并同意
			<a href="http://www.anzimall.com/to_register_agreement.shtml" target="_blank" style="color: #f00;">《安淘惠客户协议书》</a>
		</label>


		<cite><input type="submit" value="提交">
		</cite>
		<br><br><br><br><br>
		</form>
		
		<div class="reginster_note">
			<h2>常见FAQ</h2>
			<dl>
				<dt class="active"><a >1、加入异业联盟能给您带来什么？</a></dt>
				<dd>周边行业免费为您所用，广告宣传直接入店为您节省大量营销成本！所有消费都将会成为您的免费推销员，朋友之间口口相传的口碑，胜过您千言万语！</dd>
				<dt><a href="/article.shtml" target="_blank">2、注册有哪些步骤？</a></dt>
				<dt><a href="/article.shtml" target="_blank">3、申请加盟？</a></dt>
			</dl>
		</div>
</div>


<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp"><jsp:param name="js" value="global,fukrm" /></jsp:include>

<script>$('.head_nav_list').find('li').removeClass('active').last().addClass('active');</script>
<script>
	

	$('.pioneer_form_code').on('keyup',function(){
		if(this.value.length !== 8) return;
		$(this).formCheck();
	});

	$('.pioneer_code_default').on('click',function(){
		$('.pioneer_form_code').val('安淘惠商城');
		return false;
	});

	
</script>
