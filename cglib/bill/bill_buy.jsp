<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="bill" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />
<style>
	.table tr td a{width: 68px;height: 21px;line-height: 21px;background-color:#2ba9e9;text-align: center;display: block;color: #ffffff;border-radius:6px;}
</style>
	<div class="main cs">
		
		<div class="aside">
			<dl>
				<dt><i class="icon icon-mingxizhang"></i>账户结算</dt>
				<dd ><i class="icon icon-lirunbiao"></i><a href="orderList.shtml">账单总表</a></dd>
				<dd class="active"><i class="icon icon-tongji"></i><a href="getorderBuyList.shtml">在线购买</a></dd>
				<dd><i class="icon icon-tubiaozitihua01"></i><a href="bill_pos.shtml">刷卡明细</a></dd>
				<dd ><i class="icon icon-riqixuanzetubiao"></i><a href="bill_members.shtml">提现记录</a></dd>
				<dd ><i class="icon icon-shuju"></i><a href="orderChartList.shtml">订单统计</a></dd>
				
			</dl>
		</div>
		

		<h2 class="tle"><i class="icon icon-tongji"></i>线上购买<small>查看在线购买您的商品</small></h2>
	
		<div class="flots_time" >
			<form action="/billtOrdrdtime.shtml" class="fukrm table_tle" method="post">
				<span><i class="icon icon-riqixuanzetubiao"></i>起止日期：</span>
				<input type="text" name="date" onclick="laydate()" value="2014-01-05" readonly="readonly" style="width:90px;" >
				-
				<input type="text" name="enddate"  onclick="laydate()" value="2014-01-05" readonly="readonly" style="width:90px;" >
				<input type="hidden" name="type" value="1">
				<input type="submit" value="查询">
			</form>
			<div class="flots_slider_label">
				<i class="icon icon-shijian"></i>选择本月：
			</div>
			<div class="flots_slider"><input id="slider" type="slider" name="area" value="1;31" /></div>
		</div>
		<div class="table " >
			<table border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						
						<th>用户账号</th>
						<th>商品名称</th>
						<th>总金额</th>
						<th>积分</th>
						<th>数量</th>
						<th>订单时间</th>
						<th>发货状态</th>
						<th>支付状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					
				<c:if test="${empty pageSupport.result}"><tr><td colspan="9"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>
				<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
					<tr>
						<td>${fn:substring(list.phone,0 ,3)}****${fn:substring(list.phone,7 ,11)}</td>
						<td>
						<span style="color: #f37800;"  class="monery">${list.cname}<img src="/images/moneys.png" title="点击查看详情" style="padding-top: 13px;padding-left: 10px;"></span>
						<div class="monerys">
								<table cellpadding="1" cellspacing="1" class="tb-amout-more">
									<colgroup><col><col ></colgroup>
									<tbody>
										<tr><th>类型</th><th>说明</th></tr>
										<tr><th colspan="2">发货时间 <fmt:formatDate value="${list.checkdate}"  pattern="yyyy-MM-dd HH:mm:ss"/></th></tr>
										<tr><td>姓名</td><td>${list.name}</td></tr>
										<tr><td>手机号</td><td>${list.phone}</td></tr>
										<tr><td>收货地址</td><td>${list.province}${list.city}${list.county}${list.address}</td></tr>
										<tr><td>快递单号</td><td>${list.expressno}</td></tr>
										<tr><td>快递公司</td><td>${list.expresname}</td></tr>
									</tbody>
								</table>
							</div>
						</td>
						
						<td><span style="color: #f37800;">${list.totalfee}</span></td>
						<td><span style="color: #53a000;">${list.integral}</span></td>
						<td>${list.number}</td>
						<td><fmt:formatDate value="${list.bookingdate}"  pattern="yyyy-MM-dd hh:mm"/></td>
						<td>
							<c:if test="${list.logistics eq'0'}"><a>已发货</a></c:if>
							<c:if test="${list.logistics eq'1'}"><a style="background-color: #E24B62;">未发货</a></c:if>
						</td>
						<td>
							<c:if test="${list.state eq'0'}"><span >已支付</span></c:if>
							<c:if test="${list.state eq'1'}"><span >未支付</span></c:if>
						</td>
						<td>
							<c:if test="${list.logistics eq'1'}">
								<a class="color_red opendialog" data="${list.id}" style="color: #ffffff;">发货</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				</tbody>			
			</table>

			<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false"></div>  
		</div>
	</div>
	
	
	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,jquery.flot,jquery.slider,fukrm,backstage,laydate/laydate" /></jsp:include>
	<script>
	
		$(function(){
			$('.opendialog').click(function(){
			var id= $(this).attr('data');
			$.ajax({
					url:"orderOne.shtml?id="+id,
					data:{},
					dataType:"text",
					type:"post",
					success:function(data){
					dialog.html(data);
					dialog.dialog('open');
					
			}
		});		
			
	})
		})
		
		$(document).on('click','span.monery',function(){
			var monerys = $(this).siblings('.monerys').show();
			$(document).one('click',function(){
				monerys.hide();
			})
		})



	// 本月时长
	var now = new Date();
	var month = now.getMonth()+1;
	var year = now.getFullYear();
	var length = (function(n){
		n.setDate(1);
		n.setMonth(month);
		n.setHours(-3);
		return n.getDate();
	})(now);

	var begin = $('input[name=date]');
	var toend = $('input[name=enddate]');
	month = month<10? '0'+month:month;

	$("#slider").slider({from:1,to: length,scale:(function(v){for(var i=0,r=[];i<v;){i++;r.push(i%2 == 0 ? '|' : i);}return r;})(length),limits:false,skin:"round_plastic",callback:function( value ){
		var v = value.split(';');
		v[0] = v[0]<10? '0'+v[0]:v[0];
		v[1] = v[1]<10? '0'+v[1]:v[1];
		begin.val(year+'-'+month+'-'+ v[0]);
		toend.val(year+'-'+month+'-'+ v[1]);
	  }});
	
	
	</script>