<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%
	request.setAttribute("css","global,login");
	request.setAttribute("js","global,f");
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+path;
%>
<jsp:include page="/cglib/header.jsp" flush="true"/>


	<div class="login">
		

		<div class="login_banner">
			<h1>异业联盟商户服务系统</h1>
			<ul>
				<li><img src="/images/login_box1.jpg" alt=""></li>
			</ul>
		</div>






		<div class="login">
			<form class="js-form" action="longin.shtml" method="post" autocomplete="off">
				<h2>安淘惠登录</h2>

				<cite>
					<label>
						<input type="text" name="mobile" value="" check="required,phone" placeholder="请输入用户名/邮箱/手机">
						
						<img src="/images/icon_form_login_img1.png">
					</label>
					<i></i>
				</cite>

			
				<cite>
					<label>
						<input type="password" name="password" value="" placeholder="请输入登录密码">
						<em style="display: none;">请输入登录密码</em>
						<img src="/images/icon_form_login_img2.png">
					</label>
					<i></i>
				</cite>

				<cite>
					<label>
						<input type="text" name="code" style="width: 105px;" placeholder="请输入右边验证码">
						<em style="display: none;">请输入右边验证码</em>
						<img src="/images/icon_form_login_img3.png">
					</label>
					<b class="checkcode"><img src="<%=basePath%>:8085/authImg?type=loginCode&amp;id=1" onclick="this.src=this.src.replace(/\d*$/gi,(new Date).getTime())"></b>
					<i></i>
				</cite>

				<cite class="form_remember">
					
					<em><a href="password_name.shtml">忘记密码?</a> &nbsp;&nbsp; <a href="register_basic.shtml">申请加盟</a></em>
				</cite>

				<cite><input type="submit" value="登 &nbsp; 录"></cite>
			</form>	
		</div>
		




	</div>




<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" flush="true"/>
