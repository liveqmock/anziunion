<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="bill" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />

<style>
	.select_type p{font-size: 14px; line-height: 40px;color: #666;}
	.select_type label{display: block!important; line-height: 28px;}
	.discount{color:#08c;font-weight: normal; }
	.integral{font-size: 16px;color: #ee2323;}
	.takemoney_val em{font-style: normal;color: #08c;}
	.takemoney_val b{font-size: 14px;color: #ee2323;}
</style>
<div class="main cs">



	<div class="aside">
		<dl>
			<dt><i class="icon icon-mingxizhang"></i>账户结算</dt>
			<dd><i class="icon icon-tubiaozitihua01"></i><a href="/indexList.shtml">账单首页</a></dd>
			<dd><i class="icon icon-lirunbiao"></i><a href="orderList.shtml">账单总表</a></dd>
			<dd><i class="icon icon-shijian"></i><a href="billtOrdrdatarecord.shtml">订单详情</a></dd>
			<dd><i class="icon icon-riqixuanzetubiao"></i><a href="bill_members.shtml">提现记录</a></dd>
		</dl>
	</div>

		
	
	<h2 class="tle"><i class="icon icon-icon"></i>立即提现<small>立即申请提现，申请成功后您的款项在两个工作内到达您的指定账户</small></h2>

	<form action="updateSettlement.shtml"  method="post" class="fukrm fukrm-ajax">
		<input type="hidden" name="id" value="${list[0].id}">
		<input type="hidden" name="card" value="${list[0].card}">
		<input type="hidden" name="realname" value="${list[0].realname}">
		<input type="hidden" name="bankno" value="${list[0].bankno}">

		<cite>
			<span style="top:auto;bottom:0;"><em>*</em>可用金额：</span>
			<strong style="display:inline-block;color:#f00;font-size:50px;" class="allmoney">${list[0].money}</strong>元
		</cite>

		<cite>
			<span><em>*</em>银行账号：</span>
			<strong style="display:inline-block;width:300px;">${fn:substring(list[0].card,0 ,8)}******${fn:substring(list[0].card,13 ,16)}</strong>
		</cite>

		<cite>
			<span><em>*</em>开户行：</span>
			<strong style="display:inline-block;width:300px;">${list[0].bankno}</strong>
		</cite>

		<cite>
			<span><em>*</em>收款人姓名：</span>
			<strong style="display:inline-block;width:300px;">${list[0].realname}</strong>
		</cite>
		
		
		<cite class="select_type">
			<span><em>*</em>扣率方式：</span>
			<p>提现扣率：<b class="discount">${discount}</b>，可用积分：<b class="integral">${integral}</b></p>
			<label><input type="radio" name="type" value="0" checked="checked">积分抵扣手续费</label>
			<label><input type="radio" name="type" value="1">从提现中抵扣手续费</label>
		</cite>
		 
		<cite>
			<span><em>*</em>提取金额：</span>
			<input type="text" name="takemoney" placeholder="请输入提取金额" class="takemoney" >
			<p class="takemoney_val">请输入您的提现金额，单笔金额不低于<font color="#ee2323">500</font>元</p>
		</cite>

		<cite>
			<span><em>*</em>提现密码：</span>

			<input type="password" name="password" check="required,password" class="fukrm_save" placeholder="请输入提现密码" autocomplete="off">
			<p>每日密码输入错误超过三次资金冻结一天,24小时后解封</p>
		</cite>
		
		<cite>
			<span><em>*</em>手机号：</span>
			<input type="text" name="mobile" placeholder="请输入绑定的手机号码" check="required,phone,ajax_bill_phone" class="fukrm_save">
			<p>请点击“获取验证码”获取验证码，验证码5分钟内有效</p>
		</cite>
		
			
		<cite>
			<span><em>*</em>短信验证码：</span>
			<input type="text" name="code" placeholder="请输入手机验证码" check="required,ajax_bill_checkcode" style="width:136px" class="checkcode">
			<b class="getcode" for="mobile" url="getverificationcode.shtml">获取验证码 ></b>
			<p>提现金额必须小于您的可用金额</p>
		</cite>
		<br>
		
		<cite><input type="submit" value="申请提现"> <a href="article_withdraw.shtml" class="cancel_authen">提现帮助>></a></cite> 
		
	</form>

		
</div>


<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,backstage" /></jsp:include>
<script>
	var takemoney_val = $('.takemoney_val');
	var discount = parseFloat($('.discount').text());
	var integral = parseFloat($('.integral').text());
	var money = parseFloat($('.allmoney').text());
	$('input.takemoney').on('keyup',function(){
		var val =  this.value;
		var type = $('input:radio:checked').val();

		if(!val){
			takemoney_val.html('请输入您的提现金额，单笔金额不低于<font color="#ee2323">500</font>元');
			return;
		}

		if(!/^[.0-9]+$/.test(val)){
			takemoney_val.html('<font color="#ee2323">必须为数字或者小数</font>');
			return;
		}
		val = parseFloat(val);
		var deduct = Math.round(discount*val*100)/100;
		var surplu1 = Math.round((integral-deduct)*100)/100;
		var surplu2 = Math.round((val-deduct)*100)/100;


		if(val<500){
			takemoney_val.html('单笔金额不低于<font color="#ee2323">500</font>元');
			return;
		}

		if(val>money){
			takemoney_val.html('您的可用金额不足<font color="#ee2323">'+val+'</font>元');
			return;
		}

		if(surplu1>integral){
			takemoney_val.html('您的可用积分<b>不足</b>，请改用<em>从提现中抵扣手续费</em>方式');
			return;
		}

		if(type == 0){
			takemoney_val.html('您选择 <em>积分抵扣费率</em>，将扣除积分<b>'+deduct+'</b>，剩余<b>'+surplu1+'</b>积分');
			return;
		}

		if(type ==1){
			takemoney_val.html('您选择 <em>从提现中抵扣手续费</em>，将扣除手续费<b>'+deduct+'</b>元，资金到账<b>'+surplu2+'</b>元');
			return;
		}


	})


	$('input[name=type]').on('change',function(){
		$('input.takemoney').trigger('keyup');
	})

</script>