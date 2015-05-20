<%@page import="java.text.SimpleDateFormat"%>
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
			<c:if test="${pionner_flag eq 0}"><dd class="active"><i class="icon icon-fabu"></i><a href="/pioneerIndex.shtml">创业说明</a></dd></c:if>
			<c:if test="${pionner_flag eq 1}"><dd><i class="icon icon-icon"></i><a href="/pioneer_withdraw_deposit_detail.shtml">提现操作</a></dd></c:if>
			<dd><i class="icon icon-tubiaozitihua01"></i><a href="/getNotice.shtml">公告</a></dd>
			
		</dl>
	</div>


	<h2 class="tle">
		<i class="icon icon-76wodeyibanyewu"></i>我的创业中心
		<small>您邀请的联盟用户所获得的返利信息。邀请越多，获利越丰厚！<em class="pioneer_receipt_btn">查看电子收据</em></small>
	</h2>
	<br>


	<h4 class="pioneer_tle"> 
		<span>我的创业累积返利：<em>${list6.balance}</em>元</span>
		<div class="pioneer_tle_deng">总业绩: <strong>${list6.total}元</strong></div>
		创业职级：
		<c:if test="${user_detail.position_type eq '0'}">无</c:if>
		<c:if test="${user_detail.position_type eq '1'}"><em>市场专员</em></c:if>
		<c:if test="${user_detail.position_type eq '2'}"><em>市场主管</em></c:if>
		<c:if test="${user_detail.position_type eq '3'}"><em>市场经理</em></c:if>
		<c:if test="${user_detail.position_type eq '4'}"><em>市场总监</em></c:if>
		<c:if test="${user_detail.position_type eq '5'}"><em>副总裁</em></c:if>
		<c:if test="${user_detail.position_type eq '6'}"><em>荣誉董事</em></c:if>
	</h4>

	<div class="pioneer_data" style="padding: 0 20px;">
		<table border="0" cellspacing="0" cellpadding="0" class="pioneer_withdraw" style="margin-top: 10px;">
			<tbody>
				<tr>
					<td rowspan="2" >
						<h3>可提现资金</h3>
						<h1><em style="color:#ff7c3c">${list6.money }</em>元</em> 
							&nbsp; <c:if test="${IS_WITHDRAWD eq '3'}"><a href="to_pioneer_withdraw_deposit.shtml" class="btn btn-green" >提 现</a></c:if>
						</h1>
						<p>可提现资金
							<b style="color:#ee2323">=</b> 
							累积返利
							<b style="color:#ee2323">-</b> 
							已提现资金
							<b style="color:#ee2323">-</b> 
							冻结资金
						</p>
						冻结资金：￥<em>${list6.frozen }</em><br>

					</td>
					<td rowspan="2">
						<h3>我的推荐人</h3>
						<h2><em style="color:#ff7c3c">${list6.realname} &nbsp;</em></h2>
						<h3>推广人数</h3>
						<h2><em style="color:#ff7c3c">${list6.count+list6.count_second+list6.count_three }</em></h2>
						<c:if test="${list6.count+list6.count_second+list6.count_three > 0}"><h3><a href="/getRturnDetailByMid.shtml" style="color:#30A831;">我的创业网</a></h3></c:if>
						
					</td>
					<td>
						<h3>创业奖金</h3>
						<h2><em style="color:#ff7c3c">${list6.total_recommend }</em>元</h2>
					</td>
					<td>
						<h3>市场区域奖励</h3>
						<h2><em style="color:#ff7c3c">${list6.total_position }</em>元</h2>
					</td>
				</tr>

				<tr>
					<td>
						<h3>市场分红</h3>
						<h2><em style="color:#ff7c3c">${list6.sum_bonus }</em>元</h2>
					</td>
					<td>
						<h3>管理补贴</h3>
						<h2><em style="color:#ff7c3c">${list6.recommends}</em>元</h2>
					</td>
				</tr>
			</tbody>			
		</table>

		<table border="0" cellspacing="0" cellpadding="0" class="pioneer_withdraw" style="margin-top: 10px;">
			<tbody>
				
				<tr>
					<th>创业奖金</th>
					<td>
						<h3>第一销售渠道</h3>
						<h2><em style="color:#ff7c3c">${list6.total_recommend_first }</em>元，人数：<b>${list6.count_first }</b></h2>
					</td>
					<td>
						<h3>第二销售渠道</h3>
						<h2><em style="color:#ff7c3c">${list6.total_recommend_second }</em>元，人数：<b>${list6.count_second }</b></h2>
					</td>
					<td>
						<h3>第三销售渠道</h3>
						<h2><em style="color:#ff7c3c">${list6.total_recommend_three }</em>元，人数：<b>${list6.count_three }</b></h2>
					</td>
				</tr>
				<tr>
					<th>管理补贴</th>
					<td>
						<h3>一级管理补贴</h3>
						<h2><em style="color:#ff7c3c">${list6.total_manager_first }</em>元</h2>
					</td>
					<td>
						<h3>二级管理补贴</h3>
						<h2><em style="color:#ff7c3c">${list6.total_manager_second }</em>元</h2>
					</td>
					<td>
						<h3>三级管理补贴</h3>
						<h2><em style="color:#ff7c3c">${list6.total_manager_three }</em>元</h2>
					</td>
				</tr>


				 
			</tbody>
		</table>
		
	</div>
	

	<p class='pioneer_code'>
		<span class="label-info"> 注意！ </span> 您邀请的用户必须输入您的邀请码后，您才可以享受到你邀请的用户为您带来的各项利润分成，请联系您推广的用户申请加盟创业系统时务必填写邀请码！！
	</p>
	<br>

	<form action="billtOrdrdtime.shtml" class="fukrm table_tle flots_time" method="post" style="margin:0 20px;">
		<span><i class="icon icon-riqixuanzetubiao"></i>选择日期：</span>
		<input type="text" name="date" class="pioneer_date" value="" id="pioneer_date" readonly="readonly" style="width:90px;" >
		&nbsp;	&nbsp;	&nbsp;	
		<a href="#" class="pioneer_date_prev"><<上一星期</a>&nbsp;	&nbsp;	
		<a href="#" class="pioneer_date_next">下一星期>></a>
	</form>
	
	<div id="main" style="width: 770px;height: 250px;"></div>
	
	
	<div class="pioneer_data">
		
		<h5>创业奖金</h5>
		<div class="table">
			<table border="0" cellspacing="0" cellpadding="0" style="margin:0;">
				<thead>
					<tr>
						<th>时间</th>
						<th>推广账号</th>
						<th>注册资金</th>
						<th>返利比例</th>
						<th>返利等级</th>
						<th>返利金额</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list2}" var="list" varStatus="l">
					<c:if test="${l.count<=5}">
					<tr>
						<td><fmt:formatDate value="${list.trade_date }" pattern="yyyy-MM-dd HH:mm"/></td>
						<td>${fn:substring(list.mobile,0 ,3)}****${fn:substring(list.mobile,7 ,11)}</td>
						<td><font color="red">${list.price }</font>元</td>
						<td>${list.scale*100 }%</td>
						<td><c:if test="${list.level eq '1'}">第一销售渠道</c:if>
						<c:if test="${list.level eq '2'}">第二销售渠道</c:if>
						<c:if test="${list.level eq '3'}">第三销售渠道</c:if></td>
						<td><span class="btn btn_red">${list.trade_total }元</span></td>
					</tr>
					</c:if>
					</c:forEach>
					<tr>
						<td colspan="5">总计获得的创业奖金 <a href="/toSeedetailsPioneer.shtml?total=jiangjin">查看明细>></a></td>
						<td><c:if test="${!empty result_list5.total1}"><span class="btn btn_red">${result_list5.total1 }元</span></c:if></td>
					</tr>
				</tbody>			
			</table>
		</div>

		<br>
		<h5>市场区域业绩奖励</h5>
		<div class="table">
			<table border="0" cellspacing="0" cellpadding="0" style="margin:0;">
				<thead>
					<tr>
						<th>时间</th>
						<th>邀请账号</th>
						<th>注册资金</th>
						<th>返利比例</th>
						<th>返利金额</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${list4}" var="list" varStatus="l">
					<c:if test="${l.count<=5}">
					<tr>
						<td><fmt:formatDate value="${list.trade_date }" pattern="yyyy-MM-dd HH:mm"/></td>
						<td>${fn:substring(list.mobile,0 ,3)}****${fn:substring(list.mobile,7 ,11)}</td>
						<td><font color="red">${list.price }</font>元</td>
						<td>${list.scale*100 }%</td>
						<td><span class="btn btn_green">${list.trade_total }元</span></td>
						
					</tr>
					</c:if>
					</c:forEach>
					<tr>
						<td colspan="4">总计获得市场区域业绩奖励 <a href="/toSeedetailsPioneer.shtml?total=shichang">查看明细>></a></td>
						<td><c:if test="${!empty result_list5.total3}"><span class="btn btn_green">${result_list5.total3 }元</span></c:if></td>
					</tr>
				</tbody>			
			</table>
		</div>

		<br>
		<h5>管理补贴</h5>
		<div class="table">
			<table border="0" cellspacing="0" cellpadding="0" style="margin:0;">
				<thead>
					<tr>
						<th>时间</th>
						<th>邀请账号</th>
						<th>注册资金</th>
						<th>返利比例</th>
						<th>返利等级</th>
						<th>返利金额</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${list3}" var="list" varStatus="l">
					<c:if test="${l.count<=5}">
					<tr>
						<td><fmt:formatDate value="${list.trade_date }" pattern="yyyy-MM-dd HH:mm"/></td>
						<td>${fn:substring(list.mobile,0 ,3)}****${fn:substring(list.mobile,7 ,11)}</td>
						<td><font color="red">${list.price }</font>元</td>
						<td>${list.scale*100 }%</td>
						<td>
							<c:if test="${list.level eq '2'}">一级管理</c:if>
							<c:if test="${list.level eq '3'}">二级管理</c:if>
							<c:if test="${list.level eq '4'}">三级管理</c:if>
						</td>
						<td><span class="btn btn_blue">${list.trade_total }元</span></td>
					</tr>
					</c:if>
					</c:forEach>
					<tr>
						<td colspan="5">总计管理补贴 <a href="/toSeedetailsPioneer.shtml?total=guanli">查看明细>></a></td>
						<td><c:if test="${!empty result_list5.total2}"><span class="btn btn_blue">${result_list5.total2 }元</span></c:if></td>
					</tr>
				</tbody>			
			</table>
			<p class='pioneer_code' style="margin-left:0;"><span class="label-info"> 注意！ </span> 说明：返利金额已扣除个人所得税6%</p>
		</div>

		
	</div>

	<br>

</div>



<div class="pioneer_receipt">
	<h1>我的电子收据 <i>X</i></h1>

	<div class="pioneer_receipt_cnt">
		<h2>
			<span><img src="images/pioneer_receipt3.png" alt="" style="width:40px;"></span>
			
			收款收据<br/>
			<em style="font: normal 0.8em/1.5 '微软雅黑', Arial,Tahoma,Helvetica,sans-serif; margin-bottom: 5px; float: left;">编号：${list7.ordernumber }</em>
		</h2>
		<table border="0" cellspacing="0" cellpadding="0" style="margin:0;">
			
			<tbody>

				<tr>
					<td colspan="3" >
						<%
						Date currentTime = new Date(); 
						SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
						String dateString = formatter.format(currentTime);
						%>
						<span>会员名：${list7.mobile }</span><em>日期：<%=dateString %></em>
						姓名：${list7.realname}
					</td>
				</tr>
				<tr>
					<td>汇款时间</td>
					<td>金额</td>
					<td>费用说明</td>
				</tr>
				<tr>
					<td><fmt:formatDate value="${list7.apply_date }" pattern="yyyy月MM月dd日"/></td>
					<c:if test="${list7.price eq '1000' }">
					<td>
						<h3><b>佰</b><b>拾</b><b>万</b><b>仟</b><b>佰</b><b>拾</b><b>元</b><b>角</b><b>分</b></h3>
						<h4><b>0</b><b>0</b><b>￥</b><b>1</b><b>0</b><b>0</b><b>0</b><b>0</b><b>0</b></h4>
					</td>
					</c:if>
					<c:if test="${list7.price eq '2000' }">
					<td>
						<h3><b>佰</b><b>拾</b><b>万</b><b>仟</b><b>佰</b><b>拾</b><b>元</b><b>角</b><b>分</b></h3>
						<h4><b>0</b><b>0</b><b>￥</b><b>2</b><b>0</b><b>0</b><b>0</b><b>0</b><b>0</b></h4>
					</td>
					</c:if>
					<c:if test="${list7.price eq '5000' }">
					<td>
						<h3><b>佰</b><b>拾</b><b>万</b><b>仟</b><b>佰</b><b>拾</b><b>元</b><b>角</b><b>分</b></h3>
						<h4><b>0</b><b>0</b><b>￥</b><b>5</b><b>0</b><b>0</b><b>0</b><b>0</b><b>0</b></h4>
					</td>
					</c:if>
					<c:if test="${list7.price eq '10000' }">
					<td>
						<h3><b>佰</b><b>拾</b><b>万</b><b>仟</b><b>佰</b><b>拾</b><b>元</b><b>角</b><b>分</b></h3>
						<h4><b>0</b><b>￥</b><b>1</b><b>0</b><b>0</b><b>0</b><b>0</b><b>0</b><b>0</b></h4>
					</td>
					</c:if>
					<c:if test="${list7.price eq '20000' }">
					<td>
						<h3><b>佰</b><b>拾</b><b>万</b><b>仟</b><b>佰</b><b>拾</b><b>元</b><b>角</b><b>分</b></h3>
						<h4><b>0</b><b>￥</b><b>2</b><b>0</b><b>0</b><b>0</b><b>0</b><b>0</b><b>0</b></h4>
					</td>
					</c:if>
					<c:if test="${list7.price eq '50000' }">
					<td>
						<h3><b>佰</b><b>拾</b><b>万</b><b>仟</b><b>佰</b><b>拾</b><b>元</b><b>角</b><b>分</b></h3>
						<h4><b>0</b><b>￥</b><b>5</b><b>0</b><b>0</b><b>0</b><b>0</b><b>0</b><b>0</b></h4>
					</td>
					</c:if>
					<c:if test="${list7.price eq '100000' }">
					<td>
						<h3><b>佰</b><b>拾</b><b>万</b><b>仟</b><b>佰</b><b>拾</b><b>元</b><b>角</b><b>分</b></h3>
						<h4><b>￥</b><b>1</b><b>0</b><b>0</b><b>0</b><b>0</b><b>0</b><b>0</b><b>0</b></h4>
					</td>
					</c:if>
					<td rowspan="2"></td>
				</tr>
				<tr>
					<td>合计人民币(大写)</td>
					<c:if test="${list7.price eq '1000' }">
					<td>壹仟元整</td>
					</c:if>
					<c:if test="${list7.price eq '2000' }">
					<td>兩仟元整</td>
					</c:if>
					<c:if test="${list7.price eq '5000' }">
					<td>伍仟元整</td>
					</c:if>
					<c:if test="${list7.price eq '10000' }">
					<td>一萬元整</td>
					</c:if>
					<c:if test="${list7.price eq '20000' }">
					<td>兩萬元整</td>
					</c:if>
					<c:if test="${list7.price eq '50000' }">
					<td>五萬元整</td>
					</c:if>
					<c:if test="${list7.price eq '100000' }">
					<td>十萬元整</td>
					</c:if>
				</tr>
				<tr>
					<td colspan="2" style="text-align:left;">备注：此费用为安淘惠电商创业加盟费。</td>
					<td></td>
				</tr>
			</tbody>
		</table>

		<h6>
			<span>收款单位（签字）：<img src="images/pioneer_receipt1.png" alt=""></span>
			<em>开票人：<img src="images/pioneer_receipt2.png" alt=""></em>
		</h6>
	</div>

	<a href="#" class="pioneer_receipt_print">打印票据</a>
</div>



<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,laydate/laydate,fukrm,echarts-all,backstage" /></jsp:include>

<script>

	var value = '<div class="pioneer_receipt" style="display:block;width:460px">'+ $('<div/>').append($('.pioneer_receipt_cnt').clone()).html() +'</div>';
	$(document).on('click','.pioneer_receipt_print',function(){
		var html = window.document.body.innerHTML;
		window.document.body.innerHTML = value;
		window.print();
		window.document.body.innerHTML = html;
		return false;
	}).on('click','.pioneer_receipt h1 i',function(){
		$(this).closest('.pioneer_receipt').hide();
	}).on('click','.pioneer_receipt_btn',function(){
		$('.pioneer_receipt').show();
	});



	function GetDateStr(dd,count) {
		dd.setDate(dd.getDate()+count);//获取AddDayCount天后的日期
		return dd.getFullYear()+"-"+(dd.getMonth()+1)+"-"+dd.getDate();
	}


	var myChart = echarts.init(document.getElementById('main')).setOption({
		calculable: true,
		color: ['#f94646', '#40C5FC', '#9DCC34'],
		title: {text:'', x:'center'},
		grid: {x: 80,y: 40,x2: 320,y2: 30},
		legend: {data: ['创业奖金', '管理补贴', '市场区域业绩奖励'],x:'right',y:'bottom'},

		xAxis: [{data: ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日']}],
		yAxis: [{type: 'value',position: 'left'}],
		series: [
			{name: '创业奖金',type: 'bar',stack: 'type',data:[0,0,0,0,0,0,0]},
			{name: '管理补贴',type: 'bar',stack: 'type',data:[0,0,0,0,0,0,0]},
			{name: '市场区域业绩奖励',type: 'bar',stack: 'type',data:[0,0,0,0,0,0,0]},
			{
				name: '数据分类总计',
				type: 'pie',
				tooltip: {trigger: 'item',formatter: '{a} <br/>{b} : {c} ({d}%)'},
				center: [590, 120],
				radius: [0, 50],
				itemStyle:{normal: {labelLine: {length: 20}}},
				data: [{value: 0,name: '创业奖金'},{value: 0,name: '管理补贴'},{value: 0,name: '市场区域业绩奖励'}]
			}
		]
	});

	var pioneer_date = $('.pioneer_date');
	var prev = $('.pioneer_date_prev');
	var next = $('.pioneer_date_next');

	var changeData = function(json){
		

		var data = [0,0,0];
		var title = json[0].day+' -- '+json[json.length-1].day +' 业绩统计';
		for(var i=0,l=json.length;i<l;i++){
			data[0] += json[i].trade_type1;
			data[1] += json[i].trade_type2;
			data[2] += json[i].trade_type3;
		}

		var now =  new Date(Date.parse(json[0].day.replace(/-/g, "/")));
		pioneer_date.val(json[0].day);
		prev.attr('href',GetDateStr(now,-7));
		next.attr('href',GetDateStr(now,+14));

		var t= 0;
		var name = ['创业奖金', '管理补贴', '市场区域业绩奖励'];
		(function(){
			var option = [
					[0,json[t].trade_type1, false, false],
					[1,json[t].trade_type2, false, false],
					[2,json[t].trade_type3, false, false]
				];
			if(t<3){
				option.push([3,{name: name[t],value:data[t]},true,false])
			}
			myChart.addData(option);
	    	if(t<6){
	    		t++;
	    		setTimeout(arguments.callee,500);
	    	}
	    })();
	}


	laydate({
		elem: '#pioneer_date', 
		event: 'focus', 
		choose: function(datas){$.getJSON('/togetObjectlist.shtml?date='+datas,changeData);}
	});

	prev.on('click',function(){$.getJSON('/togetObjectlist.shtml?date='+this.getAttribute('href'),changeData);return false});
	next.on('click',function(){$.getJSON('/togetObjectlist.shtml?date='+this.getAttribute('href'),changeData);return false});

	$.getJSON('togetObjectlist.shtml',changeData);
</script>
