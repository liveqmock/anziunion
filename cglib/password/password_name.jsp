<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/cglib/header.jsp" ><jsp:param name="css" value="global,register" /></jsp:include>
	<div class="mainbox">
	
	
		<div class="content reginster cs">
			<h2 class="register_title">
				<strong>取回密码</strong>
				<span>我记起来了，马上<a href="index.shtml">登录</a></span>
			</h2>
			<div class="steps"><img src="/images/register_steps1.png" alt=""></div>

	

			<form action="retrievepassword_user.shtml" class="fukrm fukrm-ajax">
			
				<cite>
					<span><em>*</em>手机账户名：</span>
					<input type="text" name="mobile" check="required,phone,ajax_password_phone" placeholder="请输入联系人手机号码">
					<p>请输入您注册时填入的有效手机号</p>
				</cite>	
				
				<cite>
					<span><em>*</em>短信验证码：</span>
					<label><input type="text" name="code" check="required" style="width:136px" placeholder="请输入短信验证码" class="checkcode"></label>
					<b class="getcode" id="getcode" for="mobile" url="getverificationcode.shtml">获取验证码 ></b>
				</cite>

				<cite>
					<span><em>*</em>身份证号码：</span>
					<label><input type="text" name="card" check="required,idcard" placeholder="请输入您的身份证号" class="fukrm_save"></label>
					<p>请输入您的身份证号，以校验您的身份。</p>
				</cite>
				
				<br><br>
				<cite><input type="submit" value="提交"></cite>
			</form>

			<div class="reginster_note">
				<h2>常见FAQ</h2>
				<dl>
					<dt class="active"><a >1、加入异业联盟能给您带来什么？</a></dt>
					<dd>周边行业免费为您所用，广告宣传直接入店为您节省大量营销成本！所有消费都将会成为您的免费推销员，朋友之间口口相传的口碑，胜过您千言万语！</dd>
					<dt><a href="/article.shtml">2、注册有哪些步骤？</a></dt>
					<dt><a href="/article.shtml">3、申请加盟？</a></dt>
				</dl>
			</div>


		</div>
	</div>




	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm" /></jsp:include>
