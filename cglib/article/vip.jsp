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
		<a href='article_vip.shtml' class='menu_multi_title'><span style="color: red;">会员卡发布</span></a>
						
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
					<a href="article_vip.shtml">会员卡发布</a>
					
				</div>
				<h2 class="help_main_tle">发布会员卡说明</h2>

				<div class="faq_answer" >
					<p>&nbsp;<strong>发布会员</strong><br>&nbsp;1,<span style="color: red;">商户发布会员卡默认待审核</span>,后台管理员审核后自动会显示在积分商城<br>
						&nbsp;2,会员卡审核1-2工作日内完成,<span style="color: red;">会员卡折扣必须小于或等于加盟时让里出的最低折扣，</span><br>&nbsp;3,让利的部分会以积分的形式返给消费用户，有利于带动消费
						<br>&nbsp;4,商户发布会员可以上传自定义会员卡模板和使用我们提供的会员卡模板两种方式
						<br>&nbsp;5,会员卡消费升级规则默认5种，商户可以任意修改规则但会员卡折扣不能大于加盟时的最低折扣
						<br>&nbsp;6,会员卡消费升级规则商家可以禁用和启用一种或多种规则，但是默认最少要有一种
						</p>
				<p>&nbsp;</p>
					<img alt="" src="/images/A7.jpg" ><br>
				  
				
			</div>	
		</div>
	</div>
</div>
		

		
			
	


		
	

	</div>



	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,article" /></jsp:include>