<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<jsp:include page="/cglib/header.jsp" ><jsp:param name="css" value="global,backstage" /></jsp:include>


<img src="/images/pay_submit_hot.png" style="display: none;">
<div class="pay">
	
	<div class="pay_value">
		订单号：${ordernumber}
		<span>金额：<strong>${price }</strong>元</span>
	</div>




	<form action="confirm_pay.shtml" class="fukrm pay_form" method="post">
		<h2>添加银行卡支付</h2>

		<input type="hidden" name="orderno" value="${ordernumber}">
		<input type="hidden" name="price" value="${price}">
		<input type="hidden" name="type" value="1" class="pay_type">


		<!-- 	<h3>选择银行卡：</h3> -->
<!-- 
			<label><input type="radio" name="bankno" value="103"><span><img src="/images/103.png"></span><cite>622188***6518</cite></label>
			<label><input type="radio" name="bankno" value="103"><span><img src="/images/103.png"></span><cite>622188***6518</cite></label>
			<label><input type="radio" name="bankno" value="103"><span><img src="/images/103.png"></span><cite>622188***6518</cite></label>
			<label><input type="radio" name="bankno" value="103"><span><img src="/images/103.png"></span><cite>622188***6518</cite></label>
			<label><input type="radio" name="bankno" value="103"><span><img src="/images/103.png"></span><cite>622188***6518</cite></label>

 -->
		<br><br>

		<cite>
			<span>持卡人姓名：</span>
			<input type="text" name="realname" value="" check="required,name" placeholder="请输入持卡人姓名">
		</cite>
		<cite>
			<span>身份证号：</span>
			<input type="text" name="identity" value="" check="required,IDcard" placeholder="请输入持卡人身份证号">
		</cite>
		<cite>
			<span>银行卡号：</span>
			<input type="text" name="card" value="${card}" check="required,bank,xiyongcard" placeholder="输入银行卡号进行安全智能识别">
			<div class="pay_card_msg"></div>
			<a href="#" class="pay_opendailog" dialog="1">查看所支持的银行</a>
			<p class="pay_note"><img src="/images/pay_note.png" alt="">支持百余家全国及地方银行，多家境外银行及卡组织</p>
			<p class="pay_note"><img src="/images/pay_note.png" alt="">请注意您的银行卡在线支付限额额度</p>
		</cite>


		<div class="pay_xinyong">
			<cite>
				<span>有效期：</span>
				<input type="text" name="cardexpirydate" value="" check="required" placeholder="有效期格式：月份/年份，如：03/15">
				<a href="#" class="pay_opendailog" dialog="2">了解有效期</a>
			</cite>

			<cite>
				<span>CVN2码：</span>
				<input type="text" name="cardcvn2" value="" check="required" placeholder="请输入CVN2码">
				<a href="#" class="pay_opendailog" dialog="3">了解CVN2码</a>
			</cite>
		</div>



	

		<cite>
			<span>手机号码：</span>
			<input type="text" name="phone" value="" check="required,phone" placeholder="请输入此卡绑定的手机号码">
		</cite>

		<cite class="pay_getcode_box">
			<span>付款校验码：</span>
			<input type="text" name="code" value="" check="required" placeholder="请输入付款校验码" style="width:196px">
			<b class="pay_getcode" for="phone" url="getverificationcode.shtml">点击获取付款校验码</b>
		</cite>

		<br><br>
		<cite><input type="submit" value="支付订单" class="pay_submit pay_submit_getcode"></cite>
		<br>


			
		</div>

	</form>




</div>



<div class="pay_dialog pay_dialog_1">
	<div class="pay_dialog_cnt">
		<h2>所支持银行 <small>支持但不限于以下所列银行</small> <i class="pay_dialog_close"></i></h2>

		<label><span><img src="/images/403.png"></span></label>
		<label><span><img src="/images/310.png"></span></label>
		<label><span><img src="/images/308.png"></span></label>
		<br>
		<label><span><img src="/images/307.png"></span></label>
		<label><span><img src="/images/305.png"></span></label>
		<label><span><img src="/images/304.png"></span></label>
		<br>
		<label><span><img src="/images/303.png"></span></label>
		<label><span><img src="/images/301.png"></span></label>
		<label><span><img src="/images/105.png"></span></label>
		<br>
		<label><span><img src="/images/104.png"></span></label>
		<label><span><img src="/images/103.png"></span></label>
		<label><span><img src="/images/102.png"></span></label>
		<br>
		<br>
		<br>


<%--
102100099996 中国工商银行
103100000026 中国农业银行
104100000004 中国银行
105100000017 中国建设银行
303100000006 中国光大银行
305100000013 中国民生银行
403100000004 中国邮政储蓄银行
301290000007 交通银行
302100011000 中信银行
304100040000 华夏银行
307584007998 平安银行
308584000013 招商银行
309391000011 兴业银行
310290000013 上海浦东发展银行
313100000013 北京银行
313110000017 天津银行
313121006888 河北银行
313131000016 邢台银行
313141052422 承德银行
313143005157 沧州银行
313161000017 晋商银行
313191000011 内蒙古银行
313192000013 包商银行
313205057830 鄂尔多斯银行
313222080002 大连银行
313227000012 锦州银行
313227600018 葫芦岛银行
313228000276 营口银行
313229000008 阜新银行
313241066661 吉林银行
313261000018 哈尔滨银行
313261099913 龙江银行
313290000017 上海银行
313301008887 南京银行
313301099999 江苏银行
313305066661 苏州银行
313331000014 杭州银行
313332082914 宁波银行
313333007331 温州银行
313336071575 湖州银行
313337009004 绍兴银行
313345001665 台州银行
313391080007 福建海峡银行
313393080005 厦门银行
313421087506 南昌银行
313428076517 赣州银行
313433076801 上饶银行
313452060150 青岛银行
313453001017 齐商银行
313456000108 烟台银行
313458000013 潍坊银行
313461000012 济宁银行
313463400019 莱商银行
313468000015 德州银行
313473070018 临商银行
313473200011 日照银行
313491000232 郑州银行
313493080539 洛阳银行
313521000011 汉口银行
313551088886 长沙银行
313581003284 广州银行
313602088017 东莞银行
313611001018 广西北部湾银行
313614000012 柳州银行
313653000013 重庆银行
313658000014 德阳银行
313731010015 富滇银行
313821001016 兰州银行
313851000018 青海银行
313871000007 宁夏银行
313882000012 昆仑银行
315456000105 恒丰银行
316331000018 浙商银行
318110000014 渤海银行
319361000013 徽商银行
595100000007 新韩银行
596110000013 企业银行
597100000014 韩亚银行
313338707013 张家口市商业银行
313345010019 浙江泰隆商业银行
313345400010 浙江民泰商业银行
313463000993 泰安市商业银行
313465000010 威海市商业银行
313492070005 开封市商业银行
313513080408 南阳市商业银行
313656000019 攀枝花市商业银行
313659000016 绵阳市商业银行
313881000002 乌鲁木齐市商业银行
314305400015 吴江农村商业银行
314305506621 江苏常熟农村商业银行
314581000011 广州农村商业银行
314653000011 重庆农村商业银行
402100000018 北京农村商业银行
402584009991 深圳农村商业银行
402602000018 东莞农村商业银行
402871099996 宁夏黄河农村商业银行
402391000068 福建省农村信用社
402521000032 湖北省农村信用社
402641000014 海南省农村信用社
402332010004 宁波鄞州农村合作银行
--%>


	</div>
</div>

<div class="pay_dialog pay_dialog_2">
	<div class="pay_dialog_cnt">
		<h2>CVN2码说明 <i class="pay_dialog_close"></i></h2>
		<br>
		<div style="text-align: center;width: 740px;"><img src="/images/pay_note_pic2.png" alt=""></div>
		<br><br>
		<p>有效期是打印在信用卡正面卡号下方，标准格式为月份在前，年份在后的一串.</p>
		<br>
		<br>
		<br>
	</div>
</div>


<div class="pay_dialog pay_dialog_3">
	<div class="pay_dialog_cnt">
		<h2>CVN2码说明 <i class="pay_dialog_close"></i></h2>
		<br>
		<div style="text-align: center;width: 740px;"><img src="/images/pay_note_pic1.png" alt=""></div>
		<br><br>
		<p>CVN2码是卡确认码/安全码，银行卡背面的签名条一串数列的末三位</p>
		<br>
		<br>
		<br>
	</div>
</div>





<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm" /></jsp:include>
<script>
		
	var pay_code = $('.pay_code');
	var form = $('.pay_form');

	$('.pay_dialog').on('click','.pay_dialog_close',function(){
		$(this).closest('.pay_dialog').hide();
		return false;
	});

	$('.pay_opendailog').on('click',function(){

		$('.pay_dialog_'+this.getAttribute('dialog')).show();

		return false;
	});
<%--
	// 测试数据
	// 4367485103900850 // 信用卡
	// 6210817200014540338 //储蓄卡
	// 
	// 真实账号
	// 6222980024596407
	// 362330198609090275
	// 13590319910
	// 陈涛
--%>

	// 发送手机短信
	var pay_getcode = $('.pay_getcode').on('click',function(){

		var check = [];
		form.find('input').not($(this).closest('cite').find('input')).filter('[check]').filter(':visible').each(function(){
			var the = $(this);
			if(!the.siblings('i').is('.form-note-success') && !the.formCheck() ){
				check.push(the);
			}
		});
		
		if(check.length>0){
			check[0].focus();
			return false;
		}
		
		if(this.submited){
			return false;
		}else{
			this.submited = true;
		}

		$.ajax({
			type: "POST",
			dataType:'json',
			url: '/commit_pay.shtml',
			data: form.serialize(),
			success: function(data) {

				if (data.status == 200) {
					var time = 60; //单位秒
					var dom = pay_getcode.html('校验码有效期还有 <b>('+time+')</b>').siblings('i').attr('class','').html('').end().find('b');
					(function(){
						if(time <=0){
							pay_code.html('点击获取付款校验码').get(0).submited = false;
						}else{
							dom.html(time);
							time --;
							setTimeout(arguments.callee,1000);
						}
					})();
				// 失败
				}else {
					alert(data.message);
				}
				pay_getcode.get(0).submited = false;
			}
		});
		return false;
	});



	form.on('submit',function(){
		var the = $(this);
		var check = [];
		form.find('input').not($(this).closest('cite').find('input')).filter('[check]').filter(':visible').each(function(){
			var the = $(this);
			if(!the.siblings('i').is('.form-note-success') && !the.formCheck() ){
				check.push(the);
			}
		});
		
		if(check.length>0){
			check[0].focus();
			return false;
		}


		if(this.submited){
			return false;
		}else{
			this.submited = true;
		}
		$.ajax({
			type: "POST",
			dataType:'json',
			url: '/confirm_pay.shtml',
			data: form.serialize(),
			success: function(data) {
				if(data.status && data.status == 200){
					var time = 10;
					var jump =  form.append('<h1>订单支付成功，<b>'+time+'</b>秒后跳转</h1>').find('h1 b');
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
				the.get(0).submited = false;
			}
		});


		return false;
	})




</script>