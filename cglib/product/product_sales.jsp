<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="product" />
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
				<dt><i class="icon icon-shangpinguanli"></i>商品管理</dt>
				<dd class="active"><a href="product_count_request.shtml"><i class="icon icon-xiaoshoutongji"></i>销售统计</a></dd>
				<dd><i class="icon icon-shangpinliebiaopress"></i><a href="product_lis_request.shtml">在线商品</a></dd>
				
				<dd><a href="product_Pendingauditlist_request.shtml"><i class="icon icon-shangpinshenhe"></i>待审核商品</a></dd>
				<dd><a href="product_Notthroughlist_request.shtml"><i class="icon icon-shenhebutongguo"></i>未通过商品</a></dd>
				<dd ><a href="product_downlist_request.shtml"><i class="icon icon-xiajiaguanli"></i>已下架商品</a></dd>
				<dd><a href="commodity_add.shtml"><i class="icon icon-tianjia"></i>添加商品</a></dd>
			</dl>
		</div>




			
		<div class="usr_title">
		
		<i class="usr_title_img" style="background:none;"><img src="/images/pro_sales.png" height="60px;"/></i>
			
			<h3>销量统计</h3>
			<p>查看您的单个商品的成交统计</p>
		</div>

		<div class="total">
			<h3>
			
				<strong>历史成交总计：<b>
				<c:if test="${empty list2[0].numbers}">0次</c:if>
				<c:if test="${!empty list2[0].numbers}">${fn:substringBefore(list2[0].numbers,".")}次</c:if>
				</b></strong>
			</h3>
			

			<div class="total_data">
				
			</div>
			<div class="total_count">
			
				<strong>本月成交总计：<b>
					<c:if test="${empty list3[0].numbers}">0次</c:if>
					<c:if test="${!empty list3[0].numbers}">${fn:substringBefore(list3[0].numbers,".")}次</c:if>
				</b></strong>
		
			<span class="span2">
				本月线上交易：${fn:substringBefore(total1,".")}次
			</span>
			<span class="span1">
				本月线下预约：${fn:substringBefore(total2,".")}次
			</span>
			</div>

		</div>


		<div class="total_stitches">
			<div id="site_statistics_loading"><img src="/images/loading.gif" alt="loading" /></div>
			<div id="site_statistics_content" class="hide"><div id="site_statistics" class="chart"></div></div>
		</div>


	</div>

	<script>

			var order=${qxt}
			var pos=${qxt2}
			
			var statistics = [{
				data: order,
				label: "线上交易"
				
			}, {
				data: pos,
				label: "线下兑换"
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

						showTooltip(item.pageX, item.pageY,  x + '日,'+item.series.label+ y +'次');
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
