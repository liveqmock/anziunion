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
					<a href="article.shtml" class='menu_multi_title'><span style="color: red;">商户加盟</span></a>
						
					</div>
					<div class='multi_menu_item'>
						<a href="article_product.shtml" class='menu_multi_title'>商品发布</a>
						
					</div>
<!-- 					<div class='multi_menu_item'><a href='article_vip.shtml' class='menu_multi_title'>会员卡发布</a></div>
 -->					<div class='multi_menu_item'>
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
					<a href="article.shtml">商户加盟</a>
					
				</div>
				<h2 class="help_main_tle">加盟说明</h2>

				<div class="faq_answer" >
					<p>&nbsp;<strong>1、基本信息</strong><br>&nbsp;商户注册必须填写基本信息,<span style="color: red;">只支持手机号方式注册</span><br>
						注册之前必须先联系异页联盟后台管理员，双方签订合同,管理员录入商户手机号后方可注册</p>
				<p>&nbsp;</p>
					<img alt="" src="/images/A1.png">
				<p><strong>2、商户认证信息填写</strong><br>
					商户认证信息必须填写，后台审核后方可进入系统内发布商品等相关操作<br>
				<p>&nbsp;</p>
				<img alt="" src="/images/A2.jpg">
				
				<p><strong>3、银行卡绑定</strong><br>
				<font face="宋体">商户只能绑定一张银行卡，用于提现使用</font>
				<p>&nbsp;</p>
				<img alt="" src="/images/A3.jpg">
				
				<p><strong>4、登录</strong><br>
				<font face="宋体">注册完成后，进入登录页面，登录系统可以查看注册时的信息进行修改<br>
					待管理员审核通过后，绑定pos机就可以使用发布商品等相关操作
				</font>
				<p>&nbsp;</p>
				<img alt="" src="/images/A4.jpg">
			</div>
			</div>

		</div>
		

		
			
	


		
	

	</div>



	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,article" /></jsp:include>