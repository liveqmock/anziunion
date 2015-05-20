<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/cglib/header.jsp" ><jsp:param name="css" value="global,register" /></jsp:include>
<div class="mainbox">
	
	
		<div class="content reginster cs">
			<h2 class="register_title">
				<strong>取回密码</strong>
				<span>我记起来了，马上<a href="index.shtml">登录</a></span>
			</h2>
			<div class="steps"><img src="/images/register_steps3.png" alt=""></div>


			<p style="padding:150px 0;text-align:center;font-size: 16px;">
				<img src="images/success.png" alt="" style="vertical-align: middle;">
				恭喜您，密码成功设置！您可以使用新密码登录异页联盟！<br><span class="backtohome">5</span>秒后跳转到<a href="#" style="color:#f00;">首页</a>

				<br><a href="index.shtml" style="display: inline-block;margin-top:30px; background:#ee450a;padding:5px 10px;color:#fff;">立即登录</a>
			</p>




		</div>

	</div>




	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm" /></jsp:include>

		<script>

		var h = $('.backtohome');
		var time = parseInt(h.html())+1;

		(function(){
			if (time <= 0) {
				location.href = '/index.shtml';
			} else {
				
				h.html(--time);
				setTimeout(arguments.callee, 1000);
			}
		})();

	
	</script>