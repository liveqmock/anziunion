<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
				<dd class="active"><a href="userVipList.shtml">会员列表</a></dd>
				<dd><a href="/cglib/members/members_import.jsp">导入会员</a></dd>
				<dd><a href="members_add.shtml">添加会员</a></dd>
			</dl>
		</div>


		<div class="main">
			<h2>会员列表</h2>
			<form action="userNameVipList.shtml" method="post"  class="js-form">
			<table class="table" cellspacing="0">
				<caption>
					<label class="fr">
						<input type="text" name="name">
						<em>请输入会员名称</em>
						<input type="submit" value="搜索">	
					</label>
				</caption>
				
				<thead>
					<tr>
						<td>添加时间</td>
						<td>编号</td>
						<td>姓名</td>
						<td>手机号码</td>
						<td>状态</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
					<tr>
						<td><fmt:formatDate value="${list.sysdate}"  pattern="yyyy-MM-dd  HH:mm:ss"/></td>
						<td>${list.id}</td>
						<td>${list.vipname}</td>
						<td>${list.mobile}</td>
						<td>
						<c:if test="${list.state eq '0'}"><span class="color_gre">未激活</span></c:if>	
						<c:if test="${list.state eq '1'}"><span class="color_gre">已激活</span></c:if>	
						</td>
						<td>
						 <a class="color_red btn_del" href="javascript:viod(0)"  data="${list.id}">删除</a>
						</td>

					</tr>
					</c:forEach>
					
				</tbody>			
			</table>
			</form>
			<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false" url="userVipList.shtml"></div>  

		</div>
	</div>



	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" flush="true"/>
	<script src="/js/global.js"></script>
	<script src="/js/form.js"></script>
	<script src="/js/jquery.page.js"></script>
	<script src="/js/layer/layer.js"></script>
	<script type="text/javascript">
		$(".btn_del").click(function(){
			var id= $(this).attr('data');
			if(window.confirm("你确定要删除吗?")){
				$.ajax({
					url:"delVipUser.shtml?id="+id,
					data:{},
					dataType:"json",
					type:"post",
					success:function(data){
					if(data.status === '200'){
						alert(data.message);
						location.reload();
					}else{
						alert(data.message);
						location.reload();
						}
					}
				});		
  			}
  			
		})
		
	</script>
</body>
</html>