<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="product" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />

<style>
.yl:hover{ text-decoration: underline;color: red;}
</style>
		

	<div class="main cs">

		<div class="aside">
			<dl>
				<dt><i class="icon icon-shangpinguanli"></i>商品管理</dt>
				
				<dd><a href="product_count_request.shtml"><i class="icon icon-xiaoshoutongji"></i>销售统计</a></dd>
				<dd class="active"><i class="icon icon-shangpinliebiaopress"></i><a href="product_lis_request.shtml">在线商品</a></dd>
				
				<dd><a href="product_Pendingauditlist_request.shtml"><i class="icon icon-shangpinshenhe"></i>待审核商品</a></dd>
				<dd><a href="product_Notthroughlist_request.shtml"><i class="icon icon-shenhebutongguo"></i>未通过商品</a></dd>
				<dd><a href="product_downlist_request.shtml"><i class="icon icon-xiajiaguanli"></i>已下架商品</a></dd>
				<dd><a href="commodity_add.shtml"><i class="icon icon-tianjia"></i>添加商品</a></dd>
			</dl>
		</div>


	<div style="border: 1px solid #ebebeb;width: 100%;margin-top: 20px;">

		<h2 class="tle"><i class="icon icon-shangpinliebiaopress"></i>商品列表<small>添加您的商品，让你的客户看到您！</small></h2>

	
		<form action="productName_list_request.shtml" class="fukrm table_tle" method="post" style="padding-left: 10px;">
			商品名：<input type="text" value="${name1 }" name="name1" style="width:100px;" maxlength="20">
			<input type="submit" value="查询">
		</form>


		<div class="table" style="margin:0 -1px;">
			<table border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th>名 称</th>
						<th>价格</th>
						<th>品牌</th>
						<th>类别</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

				<c:if test="${empty pageSupport.result}"><tr><td colspan="6"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>

				<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
					<tr>
						<td style="text-align: left;"><a class="yl" title="点击预览" href="http://www.anzimall.com/get_merchantsgoods_preview_details.shtml?id=${list.id}" target="_blank">${list.name}</a></td>
						<td><span style="color: #f37800;">${list.pice}</span></td>
						<td>${list.brand}</td>
						<td>${list.tid}</td>
						<td><a style="width: 68px;height: 21px;line-height: 21px;background-color:#2ba9e9;text-align: center;display: block;color: #ffffff;border-radius:6px;">已上架</a><td>
					<a class="color_red" onclick="return confirm('确认修改吗')" href="updateshelvesCommodity.shtml?id=${list.id}">下架</a>
						<a class="color_blu" href="salesProduct.shtml?cid=${list.id}" >统计</a>
						</td>

					</tr>
				</c:forEach>
				</tbody>			
			</table>
		</div>

		<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false"></div>  
	</div>
	</div>


		<script>
			
			var order= [];
			<c:if test="${!empty qxt}">order = ${qxt};</c:if>
			var statistics = [{
				data: order,
				label: "本月销售总计"
				
			}];
	</script>


	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,backstage,jquery.flot" /></jsp:include>
	<script>
		
		// 拆线图
		$.plot("#site_statistics",statistics, {
			series: {lines: {show: true,lineWidth: 2,fill: true,fillColor: {colors: [{opacity: 0.05}, {opacity: 0.01}]}},points: {show: true},shadowSize: 2},
			grid: {hoverable: true,clickable: true,tickColor: "#eee",borderWidth: 0},
			colors: ["#A5D16C", "#FCB322", "#32C2CD"],xaxis: {ticks: 11,tickDecimals: 0},yaxis: {ticks: 11,tickDecimals: 0}
		});


		var previousPoint = null;
		var tooltip = $('<div />').css({position: 'absolute',display: 'none',top: 5,left: 15,border: '1px solid #333',padding: '4px',color: '#fff','border-radius': '3px','background-color': '#333',opacity: 0.80}).appendTo("body");

		// 鼠标移动上去提示
		$("#site_statistics").bind("plothover", function(event, pos, item) {
			if (item) {
				if (previousPoint == item.dataIndex) { return }
					previousPoint = item.dataIndex;
					tooltip.html(item.datapoint[0] + '日,'+item.series.label+ item.datapoint[1].toFixed(2) +'件')
					.css({top: item.pageY + 5,left: item.pageX + 15}).show();
			} else {
				tooltip.hide();
				previousPoint = null;
			}
		});
	</script>
	

