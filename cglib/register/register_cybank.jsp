<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/cglib/header.jsp" ><jsp:param name="css" value="global,register" /></jsp:include>

	
	

	<div class="center reginster">



		<h2 class="register_title">
			<strong>帐户注册</strong>
			<span>已注册，马上<a href="index.shtml">登录</a></span>
		</h2>

		
		<br><br>
		<form action="to_query_merchantscybank.shtml" class="fukrm fukrm-ajax" method="post">
			<input type="hidden" name="type" value="1">
			<input type="hidden" name="cy_type" >


			
			<cite>
				<span><em>*</em>姓名：</span>
				<input type="text" name="realname">
			</cite>
			
			<cite>
				<span><em>*</em>身份证号：</span>
				<input type="text" name="identity">
			</cite>
			
			
			<cite>
				<span><em>*</em>提现密码</span>
				<input type="password" name="password" placeholder="请输入异业联盟提现密码" check="required,password"  class="checkstrong fukrm_save">
				<p style="width:400px;padding-top:5px;">
					密码强度: <span class="checkstrong_res">
					<b>弱</b><b>中</b><b>强</b></span><br>
					<img src="/images/icon_warm.png" style="vertical-align: -2px;">为保证您帐号的安全，建议密码由6-16位字符（字母、数字、符号）<br>组合而成，不能只使用一种字符，不区分大小写！
				</p>
			</cite>

			
			<cite>
				<span><em>*</em>确认提现密码：</span>
				<input type="password" name=""  placeholder="请重新输入账户密码" check="required,repassword"  class="fukrm_save">
				<p>再次输入您的账户密码以确认您记住了您的密码</p>
			</cite>
			
			
			

			<cite><input type="submit" value="提交"></cite>
			<br><br>

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
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,register" /></jsp:include>
	<script>$('.head_nav_list').find('li').removeClass('active').last().addClass('active');</script>
	<script>
	var bank = $('.bank')
	$('form').on('change','select.bankno',function(){
		bank.val(this.options[this.selectedIndex].text);
	});
	</script>
