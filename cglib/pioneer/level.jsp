<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 


<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="pioneer" />
</jsp:include>



<div class="main cs">

	<div class="aside">
		<dl>
			<dt><i class="icon icon-shanghu01"></i>电商创业系统</dt>
			<c:if test="${pionner_flag eq 1}"><dd class="active"><i class="icon icon-shuju"></i><a href="/pioneerDetail.shtml">创业中心</a></dd></c:if>
			<c:if test="${pionner_flag eq 0}"><dd><i class="icon icon-fabu"></i><a href="/pioneerIndex.shtml">创业说明</a></dd></c:if>
			<c:if test="${pionner_flag eq 1}"><dd><i class="icon icon-icon"></i><a href="/pioneer_withdraw_deposit_detail.shtml">提现操作</a></dd></c:if>
			<dd><i class="icon icon-tubiaozitihua01"></i><a href="/getNotice.shtml">公告</a></dd>
			
		</dl>
	</div>


	<br>

	<div class="pioneer_level">
		<dl class="pioneer_level_1">
			<dt>第一销售渠道（<b>${temp_length }</b>）</dt>
			<dd>
			<c:forEach items="${list}" var="list">
				<a href="${list.mid }">${list.mobile }  <br>注册时间：${list.apply_date } <br>注册资金：${list.price }元 <br>返利金额：${list.total }元</a>
			</c:forEach>
			</dd>
		</dl>

		<dl class="pioneer_level_2">
			<dt>第二销售渠道（<b>0</b>）</dt>
			<dd></dd>
		</dl>

		<dl class="pioneer_level_3">
			<dt>第三销售渠道（<b>0</b>）</dt>
			<dd></dd>
		</dl>
		
	</div>

</div>




<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,laydate/laydate,fukrm,echarts-all,backstage" /></jsp:include>

<script>


	$('.pioneer_level').on('click','a',function(){
		var next = $(this).closest('dl').next('dl');
		if(next.length<=0) return false;

		$(this).addClass('active').siblings('a').removeClass('active');

		$.ajax({
			type: "POST",
			dataType:'json',
			url: '/getRturnDetailRealByMid.shtml',
			data: {"mid":this.getAttribute('href')},
			success: function(json) {
				var data = json? json:[];
				var res = [];
				for(var i=0,l=data.length;i<l;i++ ){
					res.push('<a href="'+data[i].mid+'">'+data[i].mobile+'<br> 注册时间：'+data[i].apply_date+'<br> 注册资金：'+data[i].price+'元<br> 返利金额：'+data[i].total+'元</a>');
				}
				next.find('dt b').html(res.length);
				next.find('dd').html(res.join(''));
				next.find('a').eq(0).trigger('click');
				next = null;
			}
		});
		return false;
	}).find('.pioneer_level_1 a').eq(0).trigger('click');





</script>