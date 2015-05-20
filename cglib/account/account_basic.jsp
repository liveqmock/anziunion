<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="account" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />

<style type="text/css"> 
#focus {width:550px; height:304px;margin: 20px auto; overflow:hidden; position:relative;}
#focus ul {height:304px; position:absolute;}
#focus ul li {float:left; width:550px; height:304px; overflow:hidden; position:relative;}
#focus .btnBg {position:absolute; width:550px; height:20px; left:0; bottom:0; background:#000; text-align:right; color:#FFF;}
#focus .btn {position:absolute; width:780px; height:10px; padding:5px 10px;bottom:0; text-align:right; z-index:4}
#focus .btn span {display:block;width:25px; float:left; height:10px;line-height: 10px;  font-size:10px; text-align:center; margin-left:5px; cursor:pointer; background:#fff;}
.title{ float:right; margin-right:20px;}
.red{ color:red;}
.sm{ text-align:right;position:absolute; bottom:0; right:0; width:800px; height:20px; line-height:20px; z-index:3;}
</style>

	<div class="main">
		<!-- 侧边 -->
		<div class="aside">
			<dl>
				<dt><i class="icon icon-lladdresshome"></i>商户中心：</dt>
				<dd class="active"><i class="icon icon-yonghuxinxi"></i><a href="getUser.shtml">基本信息</a></dd>
				<dd><i class="icon icon-shenfenrenzheng"></i><a href="account_store.shtml">商户认证</a></dd>
				<dd><i class="icon icon-yinxinglicai"></i><a href="poscode.shtml">POS机信息</a></dd>
				<dd><i class="icon icon-bbgyinxingqia"></i><a href="account_bankList.shtml">银行卡绑定</a></dd>
				<dd><i class="icon icon-xiugaimima"></i><a href="go_password.shtml">修改登录密码</a></dd>
				<dd><i class="icon icon-xiugai"></i><a href="takePassword.shtml">修改提现密码</a></dd>
			</dl>
		</div>



		<div class="ui-border">
			<h2 class="tle"><i style="color:#ff5454;" class="icon icon-yonghuxinxi"></i>基本信息<small>您的资料将处于绝对保密状态。</small></h2>

			<ul class="account-information fn-clear">
				<li class="fn-clear">
					<div class="item-name"><i style="color:#0a9df1" class="icon icon-bbgdianpu"></i>商户店铺名称：</div>
					<div class="item-text">${list[0].storename}</div>
				</li>
				<li class="fn-clear bc">
					<div class="item-name"><i style="color:#f85617" class="icon icon-yonghumingzhuanhuan"></i>登录账号：</div>
					<div class="item-text">${list[0].mobile}</div>
				</li>
				<li class="fn-clear">
					<div class="item-name"><i style="color:#30c8e9" class="icon icon-shijian1"></i>注册时间：</div>
					<div class="item-text"><fmt:formatDate value="${list[0].sysdate}"  pattern="yyyy-MM-dd HH:mm:ss"/></div>
				</li>
				<li class="fn-clear bc">
					<div class="item-name"><i style="color:#e930e2" class="icon icon-chanpinleimu"></i>商户行业类型：</div>
					<div class="item-text">${list[0].tid}</div>
				</li>
				
				<li class="fn-clear">
					<div class="item-name"><i style="color:#6fcc15" class="icon icon-tubiaozitihua01"></i>店铺介绍：</div>
					<div class="item-text">${list[0].note}</div>
				</li>
				
				<li class="fn-clear bc">
					<div class="item-name"><i style="color:#f7ae1f" class="icon icon-shixinweizhiqiandao"></i>地址：</div>
					<div class="item-text">${list[0].province}${list[0].city}${list[0].county}${list[0].address}</div>
				</li>

				<li class="fn-clear">
					<div class="item-name"><i style="color:#f7a912" class="icon icon-kmd"></i>经纬度：</div>
					<div class="item-text">${list[0].coordinates}</div>
				</li>
			</ul>


			<ul class="account-status fn-clear" style="border-top:1px solid #ddd;">
				<li class="account-status-item account-status-authen">
					<div class="account-status-img  ico-authen">
					</div>
					<div class="account-status-det">
						<h4 class="tit">商户认证</h4>
						<p class="descript">
							<i class=" descript-icon  fn-left"></i>
							<span class="fn-left">已认证</span>
							<a class="fn-left" href="#"></a>
						</p>
					</div>
					<p class="account-status-info">您已享有商户服务</p>
				</li>
				<li class="account-status-item account-status-certify">
					<div class="account-status-img  ico-safeguard ">
					</div>
					<div class="account-status-det">
						<h4 class="tit">pos机保障</h4>
						<p class="descript">
							<i class=" descript-icon  fn-left"></i>
							<span class="fn-left">已保障</span>
							<a class="fn-left" href="#"></a>
						</p>
					</div>
					<p class="account-status-info account-status-infoB">您可享受pos机保障服务</p>
				</li>
				<li class="account-status-item account-status-mobile">
					<div class="account-status-img  ico-mobile">

					</div>
					<div class="account-status-det">
						<h4 class="tit">手机  <span class="mobile-number">(${list[0].mobile})</span></h4>
						<p class="descript">
							<i class=" descript-icon  fn-left"></i>
							<span class="fn-left">已绑定</span>
							<a class="fn-left" href="#"></a>
						</p>
					</div>
					<p class="account-status-info account-status-infoP">您可享有手机相关的服务</p>
				</li>
			</ul>

		</div>

		<div  class="ui-border" style="margin-top:10px;">
			<h2 class="tle"><i class="icon icon-dianpu"></i>企业形象</h2>

			<div id="focus">
				<ul>
					<li><img src="${basePath}${list[0].enterpriseimg}" width="550px" height="304px"/></li>
					<li><img src="${basePath}${list[0].enterpriseimg2}" width="550px" height="304px"/></li>
					<li><img src="${basePath}${list[0].enterpriseimg3}"  width="550px" height="304px"/></li>
					<li><img src="${basePath}${list[0].enterpriseimg4}" width="550px" height="304px"/></li>
				</ul>
			</div>
		</div>

		<div  class="ui-border" style="margin-top:10px;">
			<h2 class="tle"><i class="icon icon-ditu"></i>地图位置</h2>
			<div id="map" style="height:300px;border:1px solid #fff;" mapdata="${list[0].coordinates}"></div>
		</div>

		<a href="account_basic.shtml?id=${list[0].id}" class="btn-reset" style="background:#26C70C;margin-bottom:20px">修改店铺信息</a>
	</div>


	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm" /></jsp:include>
	

	<script>

		function loadJScript() {
			var script = document.createElement("script");
			script.type = "text/javascript";
			script.src = "http://api.map.baidu.com/api?v=2.0&ak=6MnMg2PV1zdUKf99lHPmfduG&callback=init";
			document.body.appendChild(script);
		}
		function init() {
			// 百度地图API功能

			var $map = $('#map')
			var mappoin = $map.attr('mapdata').split(',');

			var map = new BMap.Map('map');
			var point = new BMap.Point(mappoin[0],mappoin[1]);
			map.centerAndZoom(point, 15);
			map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT}));
			map.addControl(new BMap.NavigationControl()); 
			map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL})); 
			map.enableScrollWheelZoom();                 //启用滚轮放大缩小

			var marker = new BMap.Marker(point);  // 创建标注
			map.addOverlay(marker);  
			// map.openInfoWindow(new BMap.InfoWindow($map.attr('title') || ''),point); //开启信息窗口




		}  

		window.onload = loadJScript;  //异步加载地图



	</script>