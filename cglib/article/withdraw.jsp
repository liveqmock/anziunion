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
				<!-- 	<div class='multi_menu_item'>
		<a href='article_vip.shtml' class='menu_multi_title'>会员卡发布</a>
						
					</div> -->
					<div class='multi_menu_item'>
						<a href='article_withdraw.shtml' class='menu_multi_title'><span style="color: red;">立即提现</span></a>
						
					</div>
					
					<div class='multi_menu_item'>
						<a href='article_password.shtml' class='menu_multi_title'>忘记密码</a>
						
					</div>
					
				</div>
			</div>

			
			<div class="help_main">
				<div class="u_crumb">
					<a href="/cglib/article/article.jsp">帮助中心</a>&gt;
					<a href="/cglib/article/withdraw.jsp">立即提现</a>
					
				</div>
				<h2 class="help_main_tle">提现说明</h2>

				<div class="faq_answer" >
					<p>&nbsp;<strong>立即提现</strong><br>商户申请立即提现,提现金额必须小于或等于账户当前余额<br>
						提现申请1-2工作日工作人员审核完成,<span style="color: red;">提现银行卡是您注册时绑定的银行卡</span></p>
				  	T+0：实时到账，建议大额交易选择T+0到账，以保障一次性到账<br>
				  	T+1：一天之内到账,&nbsp;T+2：两天之内到账,&nbsp;T+3：三天之内到账<br>
				  	T+4：四天之内到账,&nbsp;T+5：五天之内到账,<br>
				  	<span style="color: red;">每日密码输入错误超过三次资金冻结一天,24小时后解封</span><br>
				<p>&nbsp;</p>
					<img alt="" src="/images/A8.jpg" ><br>
				  
				
			</div>	
		</div>
	</div>
</div>
		

		
			
	


		
	

	</div>



	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,article" /></jsp:include>