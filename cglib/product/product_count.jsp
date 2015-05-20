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
.yl:HOVER{ text-decoration: underline;color: red;}
</style>
		

	<div class="main cs">

		<div class="aside">
			<dl>
				<dt><i class="icon icon-shangpinguanli"></i>商品管理</dt>
				<dd class="active"><a href="product_count_request.shtml"><i class="icon icon-xiaoshoutongji"></i>销售统计</a></dd>
				<dd><i class="icon icon-shangpinliebiaopress"></i><a href="product_lis_request.shtml">在线商品</a></dd>
				
				<dd><a href="product_Pendingauditlist_request.shtml"><i class="icon icon-shangpinshenhe"></i>待审核商品</a></dd>
				<dd><a href="product_Notthroughlist_request.shtml"><i class="icon icon-shenhebutongguo"></i>未通过商品</a></dd>
				<dd><a href="product_downlist_request.shtml"><i class="icon icon-xiajiaguanli"></i>已下架商品</a></dd>
				<dd><a href="commodity_add.shtml"><i class="icon icon-tianjia"></i>添加商品</a></dd>
			</dl>
		</div>

		<h2 class="tle"><i class="icon icon-shangpinliebiaopress"></i>销售统计<small>添加您的商品，让你的客户看到您！</small></h2>
	
		<div class="total_stitches" style="border: 1px solid #ebebeb; padding-bottom: 50px;">
			<h4 style="display: block;background: #EE2323;color:#fff;line-height:38px;text-indent:10px">本月销售统计</h4>
			<div id="site_statistics" class="chart" style="width: 750px;height: 280px;margin: 20px auto 0;"></div>
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
	

