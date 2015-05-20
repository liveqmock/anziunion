<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<jsp:include page="/cglib/header.jsp" ><jsp:param name="css" value="global,register" /></jsp:include>



	<div class="register_banner" style="display: block;height: 244px;">
		<ul>
			<li><img src="/images/register_wealth.jpg" alt=""></li>
		</ul>
	</div>


	<div class="center reginster">
	
		
	
		<div class="steps"><img src="/images/steps_register1.png" alt=""></div>


			
			<form action="registered.shtml" class="fukrm fukrm-ajax" >
			<input type="hidden" name="type" value="0">

				<label>
					<span><em>*</em>联系人手机号码：</span>
					<input type="text" name="mobile" placeholder="请输入联系人手机号码" check="required,phone,ajax_register_phone" class="fukrm_save">
					<p>手机号码为异业联盟登陆账户名，请保证输入正确有效</p>
				</label>

				<label>
					<span><em>*</em>商户名称：</span>
					<input type="text" name="username" value="" placeholder="请输入商户名称" class="username" >
				</label>
				
				<label>
					<span>资源码：</span>
					<input type="text" name="sigen" value="${sigen }" placeholder="请输入资源码">
				</label>
				

				
				<label>
					<span><em>*</em>短信验证码：</span>
					<input type="text" name="code" placeholder="请输入手机验证码" check="required,ajax_register_phone" style="width:136px" class="checkcode">
					<b class="getcode" for="mobile" url="getverificationcode.shtml">获取验证码 ></b>
					<p>请点击“获取验证码”获取验证码，验证码5分钟内有效</p>
				</label>


				<label>
					<span><em>*</em>账户密码：</span>
					<input type="password" name="password" placeholder="请输入异业联盟账户密码" check="required,password"  class="checkstrong fukrm_save">
					<p style="width:400px;padding-top:5px;">
						密码强度: <span class="checkstrong_res">
						<b>弱</b><b>中</b><b>强</b></span><br>
						<img src="/images/icon_warm.png" style="vertical-align: -2px;">为保证您帐号的安全，建议密码由6-16位字符（字母、数字、符号）<br>组合而成，不能只使用一种字符，不区分大小写！
					</p>
				</label>

				
				<label>
					<span><em>*</em>确认账户密码：</span>
					<input type="password" name=""  placeholder="请重新输入账户密码" check="required,repassword"  class="fukrm_save">
				</label>

			
				<label>
					<span><em>*</em>店名：</span>
					<input type="text" name="storename" placeholder="请输入您的店铺名称" check="required,textlength">
				</label>
				
				<label>
					<span><em>*</em>电话：</span>
					<input type="text" name="storephone" placeholder="请输入您的商铺电话" check="required,context">
				</label>
				
				<cite>
					<span><em>*</em>商户LOGO</span>

					<input type="text" name="logo" check="required" class="js-cutpic" cutsize="250,160" />


					<p>LOGO最佳显示比例宽x高：<font color="#ee2323">90*45</font>，像素最高不<font color="#ee2323">高</font>于140px*90px，<br>其他像素图片将会造成图片拉伸。<font color="#ee2323">强烈建议使用PNG-24透明背景图片</font>
				</p>
				</cite><br>



				<cite>
					<span><em>*</em>企业形象</span>
					<label><input type="text" class="js-cutpic" name="enterpriseimg"  check="required" cutsize="600,304" /></label>
					<label><input type="text" class="js-cutpic" name="enterpriseimg2" check="required" cutsize="600,304" /></label>
					<label><input type="text" class="js-cutpic" name="enterpriseimg3" check="required" cutsize="600,304" /></label>
					<label><input type="text" class="js-cutpic" name="enterpriseimg4" check="required"  cutsize="600,304" /></label>
					<p>最佳显示比例宽x高：<font color="#ee2323">600px*304px</font>其他像素图片将会造成图片拉伸。<br>
						本地上传图片大小不能超过500K。
					</p>
				</cite><br>


				<cite>
					<span><em>*</em>所属行业：</span>
					<input type="text" name="tid" placeholder="请输入商户类型" check="required" readonly="readonly" value="" placeholder="选择行业" style="width:100px;" class="stors_type">
					<p>为了让你的客户更快更方便的找到您，请精准的选择您的行业</p>
				</cite>
			
				<label>
					<span><em>*</em>经营范围：</span>
						<textarea name="scope" cols="60" placeholder="关键字搜索,以逗号隔开" rows="3" check="textlength"></textarea>
					
				</label>

				<label>
					<span><em>*</em>店铺介绍：</span>
						<textarea name="note" cols="60" placeholder="关键字搜索 以逗号隔开" rows="4" check="textsize"></textarea>

				</label>
				
				<cite>
					<span><em>*</em>商铺地址：</span>
					<label class="js-form-city">
						<select class="prov" name="province"  style="width: 120px;" ></select>
						<select class="city" name="city" style="width:120px;"></select>
						<select class="town" name="county" style="width:180px;"></select>
					</label>
				</cite>
				<label>
					<input type="text" name="address" placeholder="请输入详细地址" check="" style="width: 400px;">
				</label>
				
				<cite>
					<span><em>*</em>地图位置：</span>
					<div id="map" style="width:500px;height:300px;margin-bottom: 10px;"></div>
					<input type="text" name="coordinates" placeholder="地图位置" check="required"  value="113.980066,22.543784" >
				</cite>


				<label>
					<input type="checkbox" name="agreement" class="checkagree" checked="true" check="checked" >已阅读并同意<a href="#" target="_blank" style="color:#f00;">《安淘惠客户协议书》</a>
				</label>


				<cite><input type="submit" value="提交"></cite>
				<br><br><br><br><br>
			</form>


			<div class="reginster_note">
				<h2>常见FAQ</h2>
				<dl>
					<dt class="active"><a >1、加入异业联盟能给您带来什么？</a></dt>
					<dd>周边行业免费为您所用，广告宣传直接入店为您节省大量营销成本！所有消费都将会成为您的免费推销员，朋友之间口口相传的口碑，胜过您千言万语！</dd>
					<dt><a href="/article.shtml" target="_blank">2、注册有哪些步骤？</a></dt>
					<dt><a href="/article.shtml" target="_blank">3、申请加盟？</a></dt>
				</dl>
			</div>


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
			var map = new BMap.Map("map");
			var marker;
			map.centerAndZoom(new BMap.Point(113.980066,22.543784), 11);
			map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT}));
			map.addControl(new BMap.NavigationControl()); 
			map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL})); 
			map.enableScrollWheelZoom();                 //启用滚轮放大缩小

			map.addEventListener("click", function(e){
				//修改位置
				map.removeOverlay(marker);
				marker = new BMap.Marker(e.point);  // 创建标注
				map.addOverlay(marker);
				$('input[name=coordinates]').val(e.point.lng + ", " + e.point.lat);
			});
		}  

		window.onload = loadJScript;  //异步加载地图

	</script>