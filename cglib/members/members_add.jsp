<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

	request.setAttribute("header_active","members");
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
				<dt>会员管理</dt>
				<dd><a href="userVipList.shtml">会员列表</a></dd>
				<dd><a href="/cglib/members/members_import.jsp">导入会员</a></dd>
				<dd class="active"><a href="members_add.shtml">添加会员</a></dd>
			</dl>
		</div>


		<div class="main">
			<h2>会员管理</h2>
			

			<form action="members_savevip.shtml" class="js-form js-form-checkvipmobile js-form-ajax"  method="post">
				
				<cite>
					<span><em>*</em>姓名：</span>
					<label>
						<input type="text" name="name" check="required,name,context">
						<em>请输入会员姓名</em>
					</label>
					<i></i>
				</cite>

				<cite>
					<span><em>*</em>电话号码：</span>
					<label>
						<input type="text" name="mobile" check="required,phone" >
						<em>请输入会员电话号码</em>
					</label>
					<i></i>
				</cite><br>

				<cite><input type="submit" value="添加会员"></cite>
			</form>

		</div>


	

	</div>





	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" flush="true"/>
	<script src="/js/global.js"></script>
	<script src="/js/form.js"></script>
	<script src="/js/layer/layer.js"></script>
	<script>
	
	//	提交前检查
	$('.js-form-checkvipmobile').on('click','input[type=submit]',function(){
	
		

		var form = $(this).closest('form');
		var input =form.find('input');
		
		if(!input.eq(0).formCheck()){
		 	return false;
		}
		
		
		if(!input.eq(1).formCheck()){
		 	return false;
		}
		
		// 注添加会员——检查手机号码
		$.ajax({
			type: "POST",
			dataType:'json',
			url: "members_checkPhone.shtml",
			data: "mobile=" + input.eq(1).val(), //传值，这里直接传了字符串
			success: function(data) { 
				if(data.status && data.status === '200'){
					form.trigger("submit");
				}else{
					input.eq(1).closest('label').next('i').attr('class','form-note-error').html('用户已绑定');
				}
			},
			error:function(){
				// results('服务器繁忙，请稍后再试');
			}
		});


		
		return false;
		
	});
	
	
	</script>
</body>
</html>