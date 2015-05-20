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
				<dd><i class="icon icon-yonghuxinxi"></i><a href="getUser.shtml">基本信息</a></dd>
				<dd class="active"><i class="icon icon-shenfenrenzheng"></i><a href="account_store.shtml">商户认证</a></dd>
				<dd ><i class="icon icon-yinxinglicai"></i><a href="poscode.shtml">POS机信息</a></dd>
				<dd ><i class="icon icon-bbgyinxingqia"></i><a href="account_bankList.shtml">银行卡绑定</a></dd>
				<dd ><i class="icon icon-xiugaimima"></i><a href="go_password.shtml">修改登录密码</a></dd>
				<dd><i class="icon icon-xiugai"></i><a href="takePassword.shtml">修改提现密码</a></dd>
			</dl>
		</div>


		
	<h2 class="tle"><i class="icon icon-shenfenrenzheng"></i>商户认证信息<small>您的资料将处于绝对保密状态。</small></h2>
	
	<c:if test="${empty list}">
		<cite>您还未填写认证信息， <a href="gostore.shtml" style="color: red;">赶快填写</a></cite>
	</c:if>
			
	<c:if test="${!empty list}">				
		<div class="mr-t30 authen_cnt">
			<c:if test="${list[0].type eq '1'}">
				<ul class="ui-border security-information fn-clear">	
					<li class="fn-clear">
						<div class="item-name"><i style="color:#ff5454;" class="icon icon-qiye"></i>企业类型：</div>
						<div class="item-text">企业商户<span></span></div>
						<div class="item-action"></div>
					</li>
					<li class="fn-clear bc">
						<div class="item-name"><i style="color:#0a9df1;" class="icon icon-xingming"></i>姓名：</div>
						<div class="item-text"><span>${list[0].name}</span></div>
						<div class="item-action"></div>
					</li>
					<li class="fn-clear">
						<div class="item-name"><i style="color:#f85617;" class="icon icon-shenfenyanzheng"></i>身份证号：</div>
						<div class="item-text"><span>${list[0].card}</span></div>
						<div class="item-action"><a href="#"></a></div>
					</li>
					<li class="fn-clear bc">
						<div class="item-name"><i style="color:#30c8e9;" class="icon icon-renzheng"></i>身份证有效期：</div>
						<div class="item-text"><span>
						<fmt:formatDate value="${list[0].cardbegindate}"  pattern="yyyy-MM-dd"/>&nbsp;&nbsp;至&nbsp;&nbsp;
						<fmt:formatDate value="${list[0].cardenddate}"  pattern="yyyy-MM-dd"/>
						 </span></div>
						<div class="item-action"><a href="#"></a></div>
					</li>
				
					<li class="fn-clear">
						<div class="item-name"><i style="color:#e930e2;" class="icon icon-bbgyingyezhizhao"></i>营业执照有效期：</div>
						<div class="item-text"><span>
						<fmt:formatDate value="${list[0].licebegindate}"  pattern="yyyy-MM-dd"/>&nbsp;&nbsp;至&nbsp;&nbsp;
						<fmt:formatDate value="${list[0].liceendindate}"  pattern="yyyy-MM-dd"/>
						 </span></div>
						<div class="item-action"><a href="#"></a></div>
					</li>
					<li class="fn-clear bc">
						<div class="item-name"><i style="color:#6fcc15;" class="icon icon-yuangongzheng"></i>营业执照号：</div>
						<div class="item-text"><span>${list[0].license}</span></div>
						<div class="item-action"><a href="#"></a></div>
					</li>
					<li class="fn-clear">
						<div class="item-name" style="height: 150px;"></div>
						<div class="item-text"><img alt="" src="${basePath}${list[0].licensefile}" width="200px" height="150px"> 
							<img alt="" src="${basePath}${list[0].cardfielis}" width="200px" height="150px" style="margin-left: 50px;">	
						</div>
						<div class="item-action"><a href="#"></a></div>
					</li>
					<li class="fn-clear bc">
						<div class="item-name"><i style="color:#f7ae1f;" class="icon icon-renzheng2"></i>认证状态：</div>
						<div class="item-text"><font color="#7AC53F">
						<c:if test="${list[0].state eq'0' }">已通过认证</c:if>
						<c:if test="${list[0].state eq'1' }">未通过认证</c:if>	
						</font></div>
					</li>
					
					<li class="fn-clear">
						<div class="item-name"><i style="color:#ff5454;" class="icon icon-shenhefuzhi"></i>审核回执信息：</div>
						<div class="item-text"><font color="#7AC53F">
						<c:if test="${empty list[0].receipt}">无</c:if>
							${list[0].receipt}
						</font></div>
					</li>
				</ul>
			</c:if>



			<c:if test="${list[0].type eq '2'}">
				<ul class="ui-border security-information fn-clear">	
					<li class="fn-clear">
						<div class="item-name">企业类型：</div>
						<div class="item-text">个人商户<span></span></div>
						<div class="item-action"></div>
					</li>
					<li class="fn-clear bc">
						<div class="item-name">姓名：</div>
						<div class="item-text"><span>${list[0].name}</span></div>
						<div class="item-action"></div>
					</li>
					<li class="fn-clear">
						<div class="item-name">身份证号：</div>
						<div class="item-text"><span>${list[0].card}</span></div>
						<div class="item-action"><a href="#"></a></div>
					</li>
					<li class="fn-clear">
						<div class="item-name">身份证有效期：</div>
						<div class="item-text"><span>
						<fmt:formatDate value="${list[0].cardbegindate}"  pattern="yyyy-MM-dd"/>&nbsp;&nbsp;至&nbsp;&nbsp;
						<fmt:formatDate value="${list[0].cardenddate}"  pattern="yyyy-MM-dd"/>
						 </span></div>
						<div class="item-action"><a href="#"></a></div>
					</li>
				
					
					<li class="fn-clear bc">
						<div class="item-name">营业执照号：</div>
						<div class="item-text"><span>${list[0].license}</span></div>
						<div class="item-action"><a href="#"></a></div>
					</li>
					<li class="fn-clear">
						<div class="item-name">营业执照有效期：</div>
						<div class="item-text"><span>
						<fmt:formatDate value="${list[0].licebegindate}"  pattern="yyyy-MM-dd"/>&nbsp;&nbsp;至&nbsp;&nbsp;
						<fmt:formatDate value="${list[0].liceendindate}"  pattern="yyyy-MM-dd"/>
						
						 </span></div>
						<div class="item-action"><a href="#"></a></div>
					</li>
					<li class="fn-clear">
						<div class="item-name">营业执照号：</div>
						<div class="item-text"><span>${list[0].license}</span></div>
						<div class="item-action"><a href="#"></a></div>
					</li>
					<li class="fn-clear bc">
						
						<div class="item-text"><span> <img alt="" src="${list[0].licensefile}" width="200px" height="150px"> 
							<img alt="" src="${list[0].cardfielis}" width="200px" height="150px" style="margin-left: 50px;">	
						</span></div>
						<div class="item-action"><a href="#"></a></div>
					</li>
					<li class="fn-clear bc">
						<div class="item-name">认证状态：</div>
						<div class="item-text"><font color="#7AC53F">
						<c:if test="${list[0].state eq'0' }">已通过认证</c:if>
						<c:if test="${list[0].state eq'1' }">未通过认证</c:if>	
						</font></div>
					</li>
					
					<li class="fn-clear bc">
						<div class="item-name">审核回执信息：</div>
						<div class="item-text"><font color="#7AC53F">
						<c:if test="${empty list[0].receipt}">无</c:if>
							${list[0].receipt}
						</font></div>
					</li>
					
				</ul>
			</c:if>

			<a href="#" class="btn-reset js-reset" >重新认证</a>
		</div>
		
			
			
	</c:if>
	
	<form action="changermerchantsinfo.shtml"  method="post" class="fukrm fukrm-check reset_authen" enctype="multipart/form-data" 
	  <c:if test="${!empty list}">style="display:none;"</c:if> >
				<input type="hidden" name="id" value="${list[0].id}">
				<input type="hidden" name="type" value="${list[0].type}">
				
				<cite>
					<span><em>*</em>商户类型：</span>
					
						<c:if test="${list[0].type eq '1' }">企业商户</c:if> 
						<c:if test="${list[0].type eq '2' }">个体商户</c:if> 
					
				</cite>
				
				
				<c:if test="${list[0].type eq '1' }">
				
				<cite >
					<span><em>*</em>法人姓名：</span>
					<input type="text" name="username" value="${list[0].name }" check="required,name,textlength" placeholder="请输入法人姓名">
				</cite>
				<cite>
					<span><em>*</em>法人身份证号：</span>
					<input type="text" name="card" value="${list[0].card }" check="required,IDcard,textlength" placeholder="请输入法人身份证号">
					<p>身份证是15或18位数字</p>
				</cite>
				
				<cite>
					<span><em>*</em>身份证有效期：</span>
				
						<input type="text" name="begin1" value="${list[0].cardbegindate}" style="width: 100px;" class="datepicker" onclick="laydate()" readonly="readonly"> &nbsp;至&nbsp;
						<input type="text" name="end1" value="${list[0].cardenddate}" check="required" style="width: 100px;"  class="datepicker" onclick="laydate()"  readonly="readonly">
					
					<p>身份证有效期时间格式为：年，月，日 例：2007.06.05-2017.06.05</p>
				</cite>

				<cite class="form-uploadpic" >
					<span><em>*</em>身份证照片：</span>
					<label><input type="file" name="cardfielis" value="${list[0].cardfielis }" check="required" default="${list[0].cardfielis}" /></label>
					<p>身份证正面头部照，把身份证放在下巴处拍摄，<br>请确保身份证上的姓名、号码清晰！照片示范</p> 
				</cite>
				
				<cite>
					<span><em>*</em>营业执照号：</span>
					<input type="text" name="license" value="${list[0].license }" check="required,number,textlength" style="width: 400px;" placeholder="请输入企业营业执照号">
					<p>商户必须有营业执照方可上传商品</p>
				</cite>

				<cite>
					<span><em>*</em>执照有效期：</span>
						<input type="text" name="begin2" value="${list[0].licebegindate}" style="width: 100px;"  class="datepicker" onclick="laydate()" readonly="readonly"> &nbsp;至&nbsp;
						<input type="text" name="end2" value="${list[0].liceendindate}" check="required" style="width: 100px;"  class="datepicker" onclick="laydate()" readonly="readonly">
					<p>日期格式为：2020.12.01</p>
				</cite>

				<cite class="form-uploadpic" >
					<span><em>*</em>营业执照：</span>
					<label><input type="file" name="licensefile" value="${list[0].licensefile}" check="required" default="${list[0].licensefile}" /></label>
					<p>请上传清晰彩色原件电子版，可以是扫描件或者数码拍摄照片。<br>仅支持:jpg 的图片格式，图片大小不得超过1M。</p>
				</cite>
			
			</c:if> 
			
			<c:if test="${list[0].type eq '2' }">
				<cite >
					<span><em>*</em>姓名：</span>
					<input type="text" name="username" value="${list[0].name }" check="required,name,context" placeholder="请输入您的姓名">
				</cite>

				<cite>
					<span><em>*</em>身份证号：</span>
					<input type="text" name="card" value="${list[0].card }" check="required,IDcard,context" placeholder="请输入您的身份证号">
					<p>身份证是15或18位数字</p>
				</cite>

				<cite>
					<span><em>*</em>身份证有效期：</span>
				
						<input type="text" name="begin1" value="${list[0].cardbegindate}" style="width: 100px;" class="datepicker" onclick="laydate()" readonly="readonly"> &nbsp;至&nbsp;
						<input type="text" name="end1" value="${list[0].cardenddate}" check="required" style="width: 100px;"  class="datepicker" onclick="laydate()"  readonly="readonly">
					
					<p>身份证有效期时间格式为：年，月，日 例：2007.06.05-2017.06.05</p>
				</cite>

				<cite class="form-uploadpic" >
					<span><em>*</em>身份证照片：</span>
					<label><input type="file" name="cardfielis" value="${list[0].cardfielis }" check="required" default="${list[0].cardfielis }" /></label>
					<p>身份证正面头部照，把身份证放在下巴处拍摄，<br>请确保身份证上的姓名、号码清晰！照片示范</p> 
				</cite>

				<cite>
					<span><em>*</em>营业执照号：</span>
					<input type="text" name="license" value="${list[0].license }" check="required,number,context" style="width: 400px;" placeholder="请输入营业执照号">
					<p>商户必须有营业执照方可上传商品</p>
					
				</cite>

				<cite>
					<span><em>*</em>营业执照有效期: </span>
					<input type="text" name="begin2" value="${list[0].licebegindate}" class="datepicker" onclick="laydate()" style="width: 100px;" readonly="readonly"/> &nbsp;至&nbsp;
					<input type="text" name="end2" value="${list[0].liceendindate}"  class="datepicker" onclick="laydate()" check="required" style="width: 100px;" readonly="readonly">
				</cite>

				<cite class="form-uploadpic" >
					<span><em>*</em>营业执照：</span>
					<label><input type="file" name="licensefile" value="${list[0].licensefile}" check="required" default="${list[0].licensefile}" /></label>
					<p>请上传清晰彩色原件电子版，可以是扫描件或者数码拍摄照片。<br>仅支持:jpg 的图片格式，图片大小不得超过1M。</p>
				</cite>
			
			</c:if> 
			
				<br>
				<cite><input type="submit" value="提交"> <a href="#" class="cancel_authen">取消重新认证，直接返回>></a></cite>
				<br><br>
			</form>
		
	</div>



	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm" /></jsp:include>
	<script type="text/javascript" src="/js/laydate/laydate.js"></script>
<script>
	$(function() {
		$('.js-reset').on('click', function() {
			$(this).parent().hide();
			$('.reset_authen').show();
			return false;
		});

		$('.cancel_authen').on('click',function(){
			$('.reset_authen').hide();
			$('.authen_cnt').show();
			return false;
		})



	});
</script>