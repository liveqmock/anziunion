<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<jsp:include page="/cglib/header.jsp" ><jsp:param name="css" value="global,backstage" /></jsp:include>

<img src="/images/pay_submit_hot.png" style="display: none;">
<div class="pay">
	
	<div class="pay_value">
		订单号：${orderno}
		<span>金额：<strong>${price }</strong>元</span>
	</div>


	<form action="/confirm_pay.shtml" method="post" class="pay_form">

		<input type="hidden" name="orderno" value="${orderno}" >
		<input type="hidden" name="type" value="${type}" >
		<br>

	
		<div class="pay_inputs">

		
			<div class="item"><label><em>付款银行：</em><span><img src="/images/${bankno}.png"></span></label></div>

			<div class="item"><label><em>付款方式：</em>信用卡</label></div>


			<div class="item">
				<label><em>银行卡号：</em><input type="text" value="${card}" name="card" datatype="bankcard" nullmsg="请输入银行卡号！" errormsg="银行卡卡号输入错误"></label>
				<div class="Validform_checktip"></div>
			</div>


			
			
		<c:if test="${type eq '2'}">
			<div class="item">
				<label><em>有效期：</em><input type="text" value="" name="cardexpirydate"  datatype="datetype" nullmsg="请输入有效期，格式：年份月份" errormsg="格式错误，例：9104" ></label>
				<div class="Validform_checktip">格式：月份/年份</div>
			</div>
			
			<div class="item">
				<label><em>CVN2码：</em><input type="text" value="" name="cardcvn2" datatype="cvn" nullmsg="请输入CVN2码末三位" ></label>
				<div class="Validform_checktip">卡片背面签名栏末三位</div>
			</div>
		</c:if>

			<div class="item">
				<label><em>手机号码：</em><input type="text" name="phone" value="" datatype="phone" nullmsg="请输入手机号码" errormsg="手机号码格式错误"></label>
				<div class="Validform_checktip"></div>
			</div>

			<div class="item">
				<label>
					<em>付款校验码：</em><input type="text" value="" name="code" datatype="getcode" nullmsg="请输入付款校验码">
					<div class="pay_getcode" url="/commit_pay.shtml">免费获取</div> 
				</label>
				<div class="Validform_checktip"></div>
			</div>
			
		</div>




		<br><br>
		<input type="submit" value="确认支付" class="pay_submit" style="margin-left: 120px;">
		<br><br><br><br>


	</form>

</div>




<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,Validform.min" /></jsp:include>

<script>



	var form = $(".pay_form");
	var getcode = $('.pay_getcode').on('click',function(){

		
		var the = $(this);

		// 禁止重复点击
		if(the.is('.disabled')) return;
		the.addClass('disabled')

		// 发送手机短信
		$.ajax({
			type: "POST",
			dataType:'json',
			url: the.attr('url'),
			data: form.serialize(),
			success: function(data) {

				// 成功
				if (data.status == 200) {
					var time = 60; //单位秒
					var dom = the.html('倒计时 <b>('+time+')</b>').siblings('i').attr('class','').html('').end().find('b');
					(function(){
						if(time <=0){
							the.removeClass('disabled').html('获取验证码 >');
						}else{
							dom.html(time);
							time --;
							setTimeout(arguments.callee,1000);
						}
					})();
				// 失败
				}else {
					the.removeClass('disabled').html('获取验证码 >').closest('.item').find('.Validform_right').html(data.message);
					//the.removeClass('disabled').html(data.message);
				}
			}
		});
	});

	form.Validform({
		tiptype:2,
		showAllError:true,
		ajaxPost:true,
		datatype:{
			bankcard : /^\d{16,19}$|^\d{6}[- ]\d{10,13}$|^\d{4}[- ]\d{4}[- ]\d{4}[- ]\d{4,7}$/,
			datetype : /^\d{4}$/,
			cvn : /^\d{3}$/,
			phone : /(^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$)|(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/,
			getcode: /^\d*$/
		},
		callback:function(data){

			if(data.status && data.status == 200){
				var time = 10
				var jump =  form.html('<h1>订单支付成功，<b>'+time+'</b>秒后跳转</h1>').find('h1 b');
				(function(){
					if(time<0){
						location.href = data.url;
						return
					};
					jump.html(time);
					time --;
					setTimeout(arguments.callee,1000);
				})();

			}else{
				alert(data.status.msg);
			}
			

		}

	});





</script>