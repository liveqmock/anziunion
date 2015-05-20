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
			<a href="article_product.shtml" class='menu_multi_title'><span style="color: red;">商品发布</span></a>
						
					</div>
					<!-- <div class='multi_menu_item'>
						<a href='article_vip.shtml' class='menu_multi_title'>会员卡发布</a>
						
					</div> -->
					<div class='multi_menu_item'>
						<a href='article_withdraw.shtml' class='menu_multi_title'>立即提现</a>
						
					</div>
					
					<div class='multi_menu_item'>
						<a href='article_password.shtml' class='menu_multi_title'>忘记密码</a>
						
					</div>
					
				</div>
			</div>

			
			<div class="help_main">
				<div class="u_crumb">
					<a href="article.shtml">帮助中心</a>&gt;
					<a href="article_product.shtml">商品发布</a>
					
				</div>
				<h2 class="help_main_tle">发布商品说明</h2>

				<div class="faq_answer" >
					<p>&nbsp;<strong>发布商品</strong><br>&nbsp;<span style="color: red;">商户发布商品默认待审核</span>,后台管理员审核后自动会显示在积分商城<br>
						商品审核1-2工作日内完成,发布商品上传图片请严格按照规定格式，有利于您的商品更美观的展示在用户面前</p>
				<p>&nbsp;</p>
					<img alt="" src="/images/A5.jpg"><br>
				    <img alt="" src="/images/A6.jpg">
				
			</div>	
		</div>
	</div>
</div>
		

		
			
	


		
	

	</div>



	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,article" /></jsp:include>