<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/cglib/header.jsp" ><jsp:param name="css" value="global,register" /></jsp:include>

	<style>
		.fuck{display: inline-block; position: relative; width: 160px;font-size: 14px;height: 40px;line-height: 40px;border-radius: 2px; color: #fff;background: #ee2323;text-align: center;border: none; cursor: pointer; behavior:url(pie.htc); }
	</style>
	
	<div class="register_banner">
		
		<ul>
			<li><a><img src="/images/register_banner.jpg" alt=""></a></li>
		</ul>
	</div>


	<div class="center reginster">


		<h2 class="register_title">
			<strong>帐户注册</strong>
			<span>已注册，马上<a href="index.shtml">登录</a></span>
		</h2>

		<div class="steps"><img src="/images/steps_register4.png" alt=""></div>

		<br><br><br>

		
			<div style="text-align: center;">
				<img src="/images/register_over.png" alt="">
				<br><br>
				<a class="fuck" href="/index.shtml">确认</a>
				<br><br><br><br><br><br><br><br><br>
			</div>
			
			
			




		</div>


	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm" /></jsp:include>
	<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"loadover.shtml",
			data:{},
			dataType:"json",
			type:"post",
			success:function(data){
				data = data.list[0];
				var res = [];
				res.push('<cite style="display: block;"><span>用户名：</span>'+data.username+'</cite>');	
				res.push('<cite style="display: block;"><span>账号：</span>'+data.mobile+'</cite>');	
				res.push('<cite style="display: block;"><span>店名：</span>'+data.storename+'</cite>');
				res.push('<cite style="display: block;"><span>商铺地址</span>'+data.province+data.city+data.county+data.address+'</cite>');
				res.push('<cite style="display: block;"><span>姓名：</span>'+data.name+'</cite>');
				res.push('<cite style="display: block;"><span>身份证号：</span>'+data.card+'</cite>');
				res.push('<cite style="display: block;"><span>营业执照号：</span>'+data.license+'</cite>');
				res.push('<cite style="display: block;"><span>银行卡号：</span>'+data.bcard+'</cite>');
				res.push('<cite style="display: block;"><span>开户银行：</span>'+data.baddress+'</cite>');
				$('#showuser').html(res.join(''));			
			}
		});
	})
	</script>
