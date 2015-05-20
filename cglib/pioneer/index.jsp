<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="pioneer" />
</jsp:include>



<div class="main cs"> 

	<div class="aside">
		<dl>

			<dt><i class="icon icon-shanghu01"></i>电商创业系统</dt>
			<c:if test="${pionner_flag eq 1}"><dd class="active"><i class="icon icon-shuju"></i><a href="/pioneerDetail.shtml">创业中心</a></dd></c:if>
			<c:if test="${pionner_flag eq 0}"><dd class="active"><i class="icon icon-fabu"></i><a href="/pioneerIndex.shtml">创业说明</a></dd></c:if>
			<c:if test="${pionner_flag eq 1}"><dd><i class="icon icon-icon"></i><a href="/pioneer_withdraw_deposit_detail.shtml">提现操作</a></dd></c:if>
			<dd><i class="icon icon-tubiaozitihua01"></i><a href="/getNotice.shtml">公告</a></dd>
			
		</dl>
	</div>



	<h2 class="tle"><i class="icon icon-fabu" style="font-size:30px;"></i>创业系统说明<small>欢迎了解创业系统！三大创业支持，圆您创业梦想，成就事业辉煌！</small></h2>




	<p class="pioneer_code">凡加入到创业系统的创业者，通过创业资源码进行创业推广，即可实现您的创业梦想！创业等级设市场专员，市场主管，市场经理，市场总监，
	副总裁，荣誉董事六个级别；不同的级别享受不一样的创业补贴，级别越高，享受的补贴越多。</p>



	<div style="text-align: center;padding: 50px 0 30px;"><img src="/images/pioneer_dis1.png" alt=""></div>

	<!-- 如果已经申请成功，以下的不加  begin -->
	<a href="#pioneer_form" class="pioneer_btn">现在就去申请</a>
	

	<form id="pioneer_form" action="/pioneer_add_request.shtml" class="fukrm fukrm-check pioneer_form" method="post"  enctype="multipart/form-data"  >

		<cite>
			<span><em>*</em>注册资金：</span>
			<select  name="apply_type" style="width:312px;">
				<option value="1">1000元</option>
				<option value="2">2000元</option>
				<option value="3">5000元</option>
				<option value="4">10000元</option>
				<option value="5">20000元</option>
				<option value="6">50000元</option>
				<option value="7">100000元</option>
			</select>
			 <p class="pioneer_name"></p>
		</cite>

		<cite>
			<span><em>*</em>支付方式：</span>
			<label><input type="radio" name="paytype" value="1" class="pioneer_paytype" checked="checked">一次性支付</label>
			<label><input type="radio" name="paytype" value="1" class="pioneer_paytype">分多次支付</label>
		</cite>

		<cite class="pioneer_paytype_cnt" style="display:none">
			<span><em>*</em>首次支付：</span>
			<input type="text" name="" check="required,number" placeholder="请输入您首次支付的数额,不高于注册资金" >
		</cite>

		<br>
		<cite><input type="submit" value="确认支付"> </cite>
		<br><br>



		
	</form>

	<!-- 如果已经申请成功，以上的不加  end -->



</div>



<c:if test="${!empty apply_message}"><script>alert('${apply_message}');</script></c:if>

<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,backstage" /></jsp:include>

<script>
	
	var pioneer_paytype_cnt = $('.pioneer_paytype_cnt');

	$(document).on('click','.pioneer_paytype',function(){
		var the = $(this);
		if(the.prop('checked') && the.closest('label').text() === '分多次支付' ){
			pioneer_paytype_cnt.show();
		}else{
			pioneer_paytype_cnt.hide();
		}

	});

</script>