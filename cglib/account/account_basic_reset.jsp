<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="account" />
</jsp:include>

<jsp:include page="/cglib/validation.jsp"  />
	<div class="main">


		<!-- 侧边 -->
		<div class="aside">
			<dl>
				<dt><i class="icon icon-lladdresshome"></i>商户中心：</dt>
				<dd class="active"><i class="icon icon-yonghuxinxi"></i><a href="getUser.shtml">基本信息</a></dd>
				<dd><i class="icon icon-shenfenrenzheng"></i><a href="account_store.shtml">商户认证</a></dd>
				<dd><i class="icon icon-yinxinglicai"></i><a href="poscode.shtml">POS机信息</a></dd>
				<dd ><i class="icon icon-bbgyinxingqia"></i><a href="account_bankList.shtml">银行卡绑定</a></dd>
				<dd><i class="icon icon-xiugaimima"></i><a href="go_password.shtml">修改登录密码</a></dd>
				<dd><i class="icon icon-xiugai"></i><a href="takePassword.shtml">修改提现密码</a></dd>
			</dl>
		</div>



		<!-- 主体 -->
		<div class="usr_title">
			<i class="usr_title_img" style="background-position: -155px -386px;"></i>
			<h3>修改基本信息</h3>
			<p>您的资料将处于绝对保密状态。</p>
		</div>


		 <form action="updateUserOne.shtml" class="fukrm fukrm-check"  method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${list[0].id}">
			<label>
				<span><em>*</em>店名：</span>
				<input type="text" name="storename" value="${list[0].storename}" check="required,context">
			</label>
			
			<label>
				<span><em>*</em>电话：</span>
				<input type="text" name="storephone" value="${list[0].storephone}" check="required,context">
			</label>
			

			<cite>
				<span><em>*</em>商户LOGO</span>
				<input type="text" name="logo" check="required" class="js-cutpic" cutsize="250,160" value="${list[0].logo}" />
				<p>LOGO最佳显示比例宽x高：<font color="#ee2323">90*45</font>，像素最高不<font color="#ee2323">高</font>于140px*90px，<br>其他像素图片将会造成图片拉伸。<font color="#ee2323">强烈建议使用PNG-24透明背景图片</font>
				</p>
				</cite><br>
					
				<cite>
					<span><em>*</em>企业形象</span>
					<label><input type="text" class="js-cutpic" name="enterpriseimg"  check="required" cutsize="600,304"  value="${list[0].enterpriseimg}"/></label>
					<label><input type="text" class="js-cutpic" name="enterpriseimg2" check="required" cutsize="600,304" value="${list[0].enterpriseimg2}"/></label>
					<label><input type="text" class="js-cutpic" name="enterpriseimg3" check="required" cutsize="600,304" value="${list[0].enterpriseimg3}" /></label>
					<label><input type="text" class="js-cutpic" name="enterpriseimg4" check="required"  cutsize="600,304" value="${list[0].enterpriseimg4}"/></label>
					<p>最佳显示比例宽x高：<font color="#ee2323">600px*304px</font>其他像素图片将会造成图片拉伸。<br>
						本地上传图片大小不能超过500K。
					</p>
				</cite><br>

			<cite>
				<span><em>*</em>所属行业：</span>
				<input type="text" name="tid"  check="required" readonly="readonly" value="${list[0].tid}" placeholder="选择行业" style="width:100px;" class="stors_type">
				<p>为了让你的客户更快更方便的找到您，请精准的选择您的行业</p>
			</cite>
		
			<label>
				<span><em>*</em>经营范围：</span>
				<textarea name="scope" cols="60" placeholder="关键字搜索,以逗号隔开" rows="3" check="context">${list[0].scope}</textarea>
				
			</label>

			<label>
				<span><em>*</em>店铺介绍：</span>
					<textarea name="note" cols="60" placeholder="关键字搜索 以逗号隔开" rows="4" check="textsize">${list[0].note}</textarea>

			</label>
			
			<cite>
				<span><em>*</em>商铺地址：</span>
				<label class="js-form-city">

					<select class="prov" name="province"  style="width: 120px;"  default="${list[0].province}"></select>
					<select class="city" name="city" style="width:120px;"  default="${list[0].city}"></select>
					<select class="town" name="county" style="width:180px;"   default="${list[0].county}"></select>
				</label>
			</cite>

			<label>
				<input type="text" name="address" value="${list[0].address}" check="" style="width: 400px;">
			</label>
			
			<cite>
				<span><em>*</em>地图位置：</span>
				<div id="map" style="width:500px;height:300px;margin-bottom: 10px;"></div>
				<input type="text" name="coordinates" placeholder="地图位置" check="required"  value="${list[0].coordinates}" >
			</cite>

			


			<cite><input type="submit" value="提交"></cite>
			<br><br><br><br><br>
		</form> 

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
			var mappoin = $map.closest('cite').find('input').val().split(',');

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


			map.addEventListener("click", function(e){

				//修改位置
				map.removeOverlay(marker);
				marker = new BMap.Marker(e.point);  // 创建标注
				map.addOverlay(marker);

				$map.closest('cite').find('input').val(e.point.lng + ", " + e.point.lat);
			});


		}  

		window.onload = loadJScript;  //异步加载地图



	</script>