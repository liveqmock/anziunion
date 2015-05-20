<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<jsp:include page="/cglib/header.jsp" ><jsp:param name="css" value="global,article" /></jsp:include>



	<div class="mainbox cs">
		
		<div class="help_top">
			<span class="help_tit"><a href="article.shtml">帮助中心</a></span>
			<span class="help_tit_dis">欢迎您来到帮助中心。</span>
		</div>



		<div class="main cs">

				<div class="help_side">
				<div class="h_multi_menu">
					<div class='multi_menu_item active'>
				<a href="article.shtml" class='menu_multi_title'>商户加盟</a>
						
					</div>
					<div class='multi_menu_item'>
				<a href="article_product.shtml" class='menu_multi_title'>商品发布</a>
						
					</div>
					<!-- <div class='multi_menu_item'>
			<a href='article_vip.shtml' class='menu_multi_title'>会员卡发布</a>
						
					</div> -->
					<div class='multi_menu_item'>
						<a href='article_withdraw.shtml' class='menu_multi_title'>立即提现</a>
						
					</div>
					
					<div class='multi_menu_item'>
				<a href='article_password.shtml' class='menu_multi_title'><span style="color: red;">忘记密码</span></a>
						
					</div>
					
				</div>
			</div>

			
			<div class="help_main">
				<div class="u_crumb">
					<a href="article.shtml">帮助中心</a>&gt;
					<a href="article_password.shtml">忘记密码</a>
					
				</div>
				<h2 class="help_main_tle">找回密码说明</h2>

				<div class="faq_answer" >
					<p>&nbsp;<strong>1,基本信息</strong><br>&nbsp;输入手机号和身份证号匹配，手机会受到验证密码，验证成功进入下一步<br>
						</p>
				<p>&nbsp;</p>
					<img alt="" src="/images/A9.jpg" ><br>
				  
					<p>&nbsp;<strong>2,填写新密码</strong><br>&nbsp;输入新密码和确认新密码，密码最好喝数字和字母结合<br>
						</p>
				<p>&nbsp;</p>
					<img alt="" src="/images/A10.jpg" ><br>
					
				<p>&nbsp;<strong>3,重置成功</strong><br>&nbsp;新密码重置成功,5秒会自动跳到登录页面<br>
						</p>
				<p>&nbsp;</p>
					<img alt="" src="/images/A11.jpg" ><br>
			</div>	
		</div>
	</div>
</div>
		

		
			
	


		
	

	</div>



	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,article" /></jsp:include>