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
				<dd class="active"><a href="/cglib/members/members_import.jsp">导入会员</a></dd>
				<dd><a href="members_add.shtml">添加会员</a></dd>
			</dl>
		</div>


		<div class="main">
			<h2>导入会员</h2>
			

			<form action="saveImportVip.shtml" class="js-form" method="post"  enctype="multipart/form-data">
				<div style="float:right;margin-right:50px;">
					<span>导入规则：</span><br/>
					<span>1：已经绑定过的会员无需导入</span><br/>
					<span>2：不能导入手机号相同的会员</span><br/>
					<span>3：excel表格首行命名：手机号    +  姓名</span><br/>
					<span>4：文件后缀名只能.xls</span><br/>
				</div>
				<cite class="form-auto-file">
					<span><em>*</em>导入会员：</span>
					<label><input type="file" name="cardfielis" style=""></label> 
				</cite>
				<br>
				
			
				<cite><input type="submit" value="导入会员"></cite>
			</form>
		</div>
	</div>





	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" flush="true"/>
	<script src="/js/global.js"></script>
	<script src="/js/layer/layer.js"></script>
	<script type="text/javascript">
	$('.js-form').on('submit',function(){
		var file = $(this).find('input[type=file]').val();
		if(file === ''){
		 	//alert("请选着文件");
		 	alert('请选择文件');
		 	return false; 
		}
	
		if(!/\w+([.xls]){1}$/.test(file)){
			alert('文件格式不正确');
	    	return false;
		}

	})
	
	
	</script>
</body>
</html>