<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="activites" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />


	<div class="main cs">
		<div class="aside">
			<dl>
				<dt><i class="icon icon-xiajiaguanli"></i>模板管理</dt>
				<dd ><i class="icon icon-tubiaozitihua01"></i><a href="getTemplatevip.shtml">模板列表</a></dd>
				<dd class="active"><i class="icon icon-tianjia"></i><a href="template_add.shtml">添加模板</a></dd>
			</dl>
		</div>


		<div class="usr_title">
		<i class="usr_title_img" style="background:none;"><img src="/images/addvip.png"/></i>
			<h3>发布会员卡模板</h3>
			<p>上传会员卡模板，提供商户使用</p>
		</div>
	
		<form action="saveTemplatevip.shtml" class="fukrm fukrm-check" method="post" enctype="multipart/form-data">
			
			<cite>
				<span><em>*</em>模板名称：</span>
				<input type="text" name="name" check="required,textlength" placeholder="请输入模板名称" />
			
			</cite>
			
			
		
			<cite>
				<span><em>*</em>会员卡图片：</span>
				<label><input type="file" name="cardfielthe" check="required" default="images/icon_form_upload.png"/></label>
				<p>上传会员卡模板，提供商户使用</p>
			</cite>

			
			
			<cite><input type="submit" value="提交"></cite>
			<br><br>
		</form>

	</div>


	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,backstage" /></jsp:include>
