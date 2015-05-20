<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/cglib/header.jsp" ><jsp:param name="css" value="global,register" /></jsp:include>

	
	<div class="register_banner">
		
		<ul>
			<li><a><img src="/images/register_banner.jpg" alt=""></a></li>
		</ul>
	</div>


	<div class="center reginster">



		<h2 class="register_title">
			<strong>帐户注册</strong>
			<span>已注册，马上<a href="index.shtml">登录</a></span>
		</h2>

		<div class="steps"><img src="/images/steps_register2.png" alt=""></div>

			<div class="reginster_note">
				<h2>常见FAQ</h2>
				<dl>
					<dt class="active"><a >1、加入异业联盟能给您带来什么？</a></dt>
					<dd>周边行业免费为您所用，广告宣传直接入店为您节省大量营销成本！所有消费都将会成为您的免费推销员，朋友之间口口相传的口碑，胜过您千言万语！</dd>
					<dt><a href="/article.shtml" target="_blank">2、注册有哪些步骤？</a></dt>
					<dt><a href="/article.shtml" target="_blank">3、申请加盟？</a></dt>
				</dl>
			</div>



			<br><br>
			<form class="fukrm">	
				<cite>
					<span><em>*</em>企业类型：</span>
				
					<select name="type"  class="select_type" >
						<option value="1" selected="selected">企业商户</option>
						<option value="2">个人商户</option>
					</select>
				</cite>
			</form>

			<%-- 企业商户注册--%>
			<form action="merchantsinfo.shtml" class="fukrm fukrm-ajax select_type_company" enctype="multipart/form-data" >
				<input type="hidden" name="type" value="1" >
				<input type="hidden" name="type_flag" value="1">
				<cite >
					<span><em>*</em>法人姓名：</span>
					<input type="text" name="username" check="required,name,textlength" placeholder="请输入法人姓名">
				</cite>
				<cite>
					<span><em>*</em>法人身份证号：</span>
					<input type="text" name="card" check="required,IDcard,textlength" placeholder="请输入法人身份证号">
					<p>身份证是15或18位数字</p>
				</cite>
				
				<cite>
					<span><em>*</em>身份证有效期：</span>
				
						<input type="text" name="begin1" style="width: 100px;" class="datepicker" onclick="laydate()" readonly="readonly"> &nbsp;至&nbsp;
						<input type="text" name="end1" check="required" style="width: 100px;"  class="datepicker" onclick="laydate()"  readonly="readonly">
					
					<p>身份证有效期时间格式为：年，月，日 例：2007.06.05-2017.06.05</p>
				</cite>

				<cite class="form-uploadpic" >
					<span><em>*</em>身份证照片：</span>
					<label><input type="file" name="cardfielis" check="required" default="images/icon_form_upload.png" /></label>
					<p>身份证正面头部照，把身份证放在下巴处拍摄，<br>请确保身份证上的姓名、号码清晰！照片示范</p> 
				</cite>
				<!-- <cite>
					<span><em>*</em>组织机构代码：</span>
						<input type="text" name="organization" check="required,context" style="width: 400px;" placeholder="请输入组织机构代码">
				</cite>
 -->
				<cite>
					<span><em>*</em>营业执照号：</span>
					<input type="text" name="license" check="required,number,textlength" style="width: 400px;" placeholder="请输入企业营业执照号">
					<p>商户必须有营业执照方可上传商品</p>
				</cite>

				<cite>
					<span><em>*</em>执照有效期：</span>
						<input type="text" name="begin2" style="width: 100px;"  class="datepicker" onclick="laydate()" readonly="readonly"> &nbsp;至&nbsp;
						<input type="text" name="end2" check="required" style="width: 100px;"  class="datepicker" onclick="laydate()" readonly="readonly">
					</label>
					<p>日期格式为：2020.12.01，若证件有效期为长期，请勾选长期。</p>
				</cite>

				<cite class="form-uploadpic" >
					<span><em>*</em>营业执照：</span>
					<label><input type="file" name="licensefile" check="required" default="images/icon_form_upload.png" /></label>
					<p>请上传清晰彩色原件电子版，可以是扫描件或者数码拍摄照片。<br>仅支持:jpg 的图片格式，图片大小不得超过1M。</p>
				</cite>

				<br>
				<cite><input type="submit" value="提交"></cite>
				<br><br>
			</form>

			<%-- 个体商户注册--%>
			<form action="merchantsinfo.shtml" class="fukrm fukrm-ajax select_type_personal" enctype="multipart/form-data" style="display: none;">
				<input type="hidden" name="type" value="2" >
				<input type="hidden" name="type_flag" value="1">
				<cite >
					<span><em>*</em>姓名：</span>
					<input type="text" name="username" check="required,name,context" placeholder="请输入您的姓名">
				</cite>

				<cite>
					<span><em>*</em>身份证号：</span>
					<input type="text" name="card" check="required,IDcard,context" placeholder="请输入您的身份证号">
					<p>身份证是15或18位数字</p>
				</cite>

				<cite>
					<span><em>*</em>身份证有效期：</span>
						<input type="text" name="begin1" style="width: 100px;" class="datepicker" onclick="laydate()" readonly="readonly"> &nbsp;至&nbsp;
						<input type="text" name="end1" check="required" style="width: 100px;" class="datepicker" onclick="laydate()" readonly="readonly">
					<p>身份证有效期时间格式为：年，月，日 例：2007.06.05-2017.06.05</p>
				</cite>
				
				

				<cite class="form-uploadpic" >
					<span><em>*</em>身份证照片：</span>
					<label><input type="file" name="cardfielis" check="required" default="images/icon_form_upload.png" /></label>
					<p>身份证正面头部照，把身份证放在下巴处拍摄，<br>请确保身份证上的姓名、号码清晰！照片示范</p> 
				</cite>

			<!-- 	<cite>
					<span><em>*</em>税务局登记号：</span>
					<input type="text" name="taxcard" check="required,context" style="width: 400px;" placeholder="请输入税务局登记号">
				</cite> -->
				
				<cite>
					<span><em>*</em>营业执照号：</span>
					<input type="text" name="license" check="required,number,context" style="width: 400px;" placeholder="请输入营业执照号">
					<p>商户必须有营业执照方可上传商品</p>
					
				</cite>

				<cite>
					<span><em>*</em>营业执照有效期：</span>
					<input type="text" name="begin2" class="datepicker" onclick="laydate()" style="width: 100px;" readonly="readonly"> &nbsp;至&nbsp;
					<input type="text" name="end2"  class="datepicker" onclick="laydate()" check="required" style="width: 100px;" readonly="readonly">
				</cite>

				<cite class="form-uploadpic" >
					<span><em>*</em>营业执照：</span>
					<label><input type="file" name="licensefile" check="required" default="images/icon_form_upload.png" /></label>
					<p>请上传清晰彩色原件电子版，可以是扫描件或者数码拍摄照片。<br>仅支持:jpg 的图片格式，图片大小不得超过1M。</p>
				</cite>

				<br>
				<cite><input type="submit" value="提交"></cite>
				<br><br>
			</form>

		</div>
	




	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,laydate/laydate" /></jsp:include>

	<script>
	
		$(function () {	
			$('.select_type').on('change',function(){
			
				// 个人商户
				if(this.value === '2'){
					$('.select_type_personal').show();
					$('.select_type_company').hide();
				// 企业商户
				}else if(this.value === '1'){
					$('.select_type_personal').hide();
					$('.select_type_company').show();
				}
			});
		});


	</script>

