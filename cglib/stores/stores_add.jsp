<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setAttribute("header_active","stores");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<title>login</title>
	
	<base href="<%=basePath%>"/>
	<!--[if lt IE 8]><script src="js/ie67.js"></script><![endif]-->
	<link rel="stylesheet" href="/css/global.css">
	<link rel="stylesheet" href="/css/backstage.css">
</head>
<body>


	<!-- 页头 -->
	<jsp:include page="/cglib/header_logined.jsp" flush="true"/>
	<jsp:include page="/cglib/validation.jsp" flush="true"/>


	<div class="center cs">
		
		


		<div class="side">
			<dl>
				<dt>分店管理</dt>
				<dd><a href="stores_list.shtml">分店列表</a></dd>
				<dd><a href="stores_audit.shtml">待审核分店</a></dd>
				<dd><a href="stores_notby.shtml">未通过分店</a></dd>
				<dd class="active"><a href="stores_add.shtml">添加分店</a></dd>
			</dl>
		</div>


		<div class="main">
			<h2>添加分店</h2>
			
			<form action="stores_save.shtml" class="js-form js-form-ajax" method="post">
				
				<cite>
					<span><em>*</em>分店名称</span>
					<label>
						<input type="text" name="name" check="required">
						<em>请输入店铺名称</em>
					</label>
					<i></i>
				</cite>
				
				<cite>
					<span><em>*</em>分店电话</span>
					<label>
						<input type="text" name="phone" check="required">
						<em>请输入分店电话</em>
					</label>
					<i></i>
				</cite>

				<cite>
					<span><em>*</em>商铺地址：</span>
					<label class="js-form-city">
						<select class="province" name="province" data-value="广东省" data-first-title="选择省" disabled="disabled" style="width:120px;" ></select>
						<select class="city" name="city" data-value="深圳市" data-first-title="选择市" disabled="disabled" style="width: 120px;;"></select>
						<select class="area" name="county" data-value="宝安区" data-first-title="选择地区" disabled="disabled" style="width: 170px;"></select>
					</label>
					<i></i>
				</cite>

				<cite>
					<label>
						<input type="text" name="address" check="" style="width: 400px;">
						<em>请输入详细地址</em>
					</label>
					<i></i>
				</cite>


				<cite class="form-uploadpic" >
					<span><em>*</em>分店照片</span>
					<label>
						<em>不超过200KB,支持jpg，jpeg，gif，bmp，png</em>
						<div style=""><img src="images/no.gif" width="158px"  /></div>
						<p>上传并预览</p>
						<input type="file" name="cardfielthe"  check="required"/>
					</label>
					<i></i>
				</cite><br>

				<cite class="form-uploadpic" >
					<span><em>*</em>营业执照</span>
					<label>
						<em>不超过200KB,支持jpg，jpeg，gif，bmp，png</em>
						<div style=""><img src="images/no.gif" width="158px"  /></div>
						<p>上传并预览</p>
						<input type="file" name="licensefile"  check="required"/>
					</label>
					<i></i>
				</cite><br>

				<cite>
					<span><em>*</em>分店描述</span>
					<label>
						<textarea name="description" cols="66" rows="10"></textarea>
						<em>请输入分店描述</em>
						<p style="line-height:20px;text-align:right;margin-top:-5px;">字数不超过150字</p>
					</label>
					<i></i>
				</cite><br>
				<cite><input type="submit" value="提交审核"></cite>


			</form>

		</div>


	

	</div>




	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" flush="true"/>
	<script src="/js/global.js"></script>
	<script src="/js/form.js"></script>
	<script src="/js/layer/layer.js"></script>
</body>
</html>