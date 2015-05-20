<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="bill" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />
<style>
	 input[type="submit"]{height: 22px;padding-top: 2px; margin-left: 5px;}
	.laydate-icon{width: 100px;}
	.span1{margin-left:10%; color: red; font-weight:bold;}
	.span2{margin-left: 50px;color: red; font-weight: bold;}
	.bt{font-size: 20px;}
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


		<h2 class="tle"><i class="icon icon-shuju"></i>订单统计<small>查看您的订单信息</small></h2>

		<div class="total">
			<h3>
			
				<strong>历史订单总计：<b>
				<c:if test="${empty list3[0].numbers}">0件</c:if>
				<c:if test="${!empty list3[0].numbers}">${fn:substringBefore(list3[0].numbers,".")}件</c:if>
				</b></strong>
			</h3>
			

			<div class="total_data">
				
			</div>
			<div class="total_count">
			
				<strong>本月订单总计：<b>
					<c:if test="${empty list4[0].numbers}">0件</c:if>
					<c:if test="${!empty list4[0].numbers}">${fn:substringBefore(list4[0].numbers,".")}件</c:if>
				</b></strong>
		
			<span class="span2">
				本月线上购买订单：
					<c:if test="${empty list6[0].numbers}">0件</c:if>
					<c:if test="${!empty list6[0].numbers}">${fn:substringBefore(list6[0].numbers,".")}件</c:if>
				
			</span>
			<span class="span1">
				本月线下预约订单：
				<c:if test="${empty list5[0].numbers}">0件</c:if>
				<c:if test="${!empty list5[0].numbers}">${fn:substringBefore(list5[0].numbers,".")}件</c:if>
			</span>
			</div>

		</div>


		<div class="total_stitches">
			<div id="site_statistics_loading"><img src="/images/loading.gif" alt="loading" /></div>
			<div id="site_statistics_content" class="hide"><div id="site_statistics" class="chart"></div></div>
		</div>


	</div>

	<script>
			var order=${qxt2}
			var pos=${qxt}

			
			var statistics = [{
				data: order,
				label: "线上支付订单"
				
			}, {
				data: pos,
				label: "线下预约订单"
			}];
	</script>




	<!-- 页脚 -->
	
	<jsp:include page="/cglib/footer.jsp" >
	<jsp:param name="js" value="global,jquery.flot,backstage" /></jsp:include>
	<script type="text/javascript" src="/js/laydate/laydate.js"></script>
	

	<script>
		(function() {
		
			// used by plot functions
			var data = [];
			var totalPoints = 200;

			// random data generator for plot charts
			function getRandomData() {
				if (data.length > 0) data = data.slice(1);
				// do a random walk
				while (data.length < totalPoints) {
					var prev = data.length > 0 ? data[data.length - 1] : 50;
					var y = prev + Math.random() * 10 - 5;
					if (y < 0) y = 0;
					if (y > 100) y = 100;
					data.push(y);
				}
				// zip the generated y values with the x values
				var res = [];
				for (var i = 0; i < data.length; ++i) res.push([i, data[i]])
				return res;
			}

			if (!jQuery.plot) {
				return;
			}

			
			$('#site_statistics_loading').hide();
			$('#site_statistics_content').show();

			var plot = $.plot($("#site_statistics"),statistics, {
				series: {
					lines: {
						show: true,
						lineWidth: 2,
						fill: true,
						fillColor: {
							colors: [{
								opacity: 0.05
							}, {
								opacity: 0.01
							}]
						}
					},
					points: {
						show: true
					},
					shadowSize: 2
				},
				grid: {
					hoverable: true,
					clickable: true,
					tickColor: "#eee",
					borderWidth: 0
				},
				colors: ["#A5D16C", "#FCB322", "#32C2CD"],
				xaxis: {
					ticks: 11,
					tickDecimals: 0
				},
				yaxis: {
					ticks: 11,
					tickDecimals: 0
				}
			});


			function showTooltip(x, y, contents) {
				$('<div id="tooltip">' + contents + '</div>').css({
					position: 'absolute',
					display: 'none',
					top: y + 5,
					left: x + 15,
					border: '1px solid #333',
					padding: '4px',
					color: '#fff',
					'border-radius': '3px',
					'background-color': '#333',
					opacity: 0.80
				}).appendTo("body").fadeIn(200);
			}

			var previousPoint = null;
			$("#site_statistics").bind("plothover", function(event, pos, item) {
				$("#x").text(pos.x.toFixed(2));
				$("#y").text(pos.y.toFixed(2));

				if (item) {
					if (previousPoint != item.dataIndex) {
						previousPoint = item.dataIndex;

						$("#tooltip").remove();
						var x = item.datapoint[0],
							y = item.datapoint[1].toFixed(2);

						showTooltip(item.pageX, item.pageY,  x + '日,'+item.series.label+ y +'件');
					}
				} else {
					$("#tooltip").remove();
					previousPoint = null;
				}
			});

			//server load
			var options = {
				series: {
					shadowSize: 1
				},
				lines: {
					show: true,
					lineWidth: 0.5,
					fill: true,
					fillColor: {
						colors: [{
							opacity: 0.1
						}, {
							opacity: 1
						}]
					}
				},
				yaxis: {
					min: 0,
					max: 100,
					tickFormatter: function(v) {
						return v + "%";
					}
				},
				xaxis: {
					show: false
				},
				colors: ["#A5D16C"],
				grid: {
					tickColor: "#eaeaea",
					borderWidth: 0
				}
			};

			$('#load_statistics_loading').hide();
			$('#load_statistics_content').show();

			var updateInterval = 30;
			var plot = $.plot($("#load_statistics"), [getRandomData()], options);

			function update() {
				plot.setData([getRandomData()]);
				plot.draw();
				setTimeout(update, updateInterval);
			}
			update();
		})();
	</script>
