<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	 <style type="text/css">
        table
        {
            table-layout: fixed;
            width: 100%;
        }
        
        td {
    		 white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
     
        }
    </style>
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
				<dd class="active"><a href="stores_audit.shtml">待审核分店</a></dd>
				<dd><a href="stores_notby.shtml">未通过分店</a></dd>
				<dd><a href="stores_add.shtml">添加分店</a></dd>
			</dl>
		</div>


		<div class="main">
			<h2>待审核分店</h2>

			<form action="storesFuzzzy_audit.shtml" method="post"  class="js-form">

			<table class="table" cellspacing="0">
				<caption>

					<label class="fr">
						<input type="text" name="name">
						<em>请输入分店名称</em>
						<input type="submit" value="搜索">
					</label>


				</caption>
				<thead>
					<tr>
						<td>分店名称</td>
						<td>省份</td>
						<td>直辖市</td>
						<td>区</td>
						<td>地址</td>
						<td>状态</td>
					
						<td>创建时间</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
				
		<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
					<tr>
						<td>${list.sname}</td>
						<td>${list.province}</td>
						<td>${list.city}</td>
						<td>${list.county}</td>
						<td>${list.address}</td>
						<td>
							<c:if test="${list.status eq '0'}"><span class="color_gre">待审核</span></c:if>
							<c:if test="${list.status eq '1'}"><span class="color_gre">未通过</span></c:if>
							<c:if test="${list.status eq '2'}"><span class="color_gre">已通过</span></c:if>
						</td>
						
						<td><fmt:formatDate value="${list.sysdate}"  pattern="yyyy-MM-dd"/></td>
						<td>
						<a class="color_red" href="findByIdShop.shtml?id=${list.id}"  onclick="if(confirm('确定修改?')==false)return false;">修改</a>&nbsp;
						<a class="color_red btn_del"   data="${list.id}">删除</a>
						<a class="color_red opendialog"  data="${list.id}">详情</a>
						</td>
					</tr>
				</c:forEach>	

				</tbody>			
			</table>
		</form>
		<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false" url="stores_audit.shtml"></div>  
		
		</div>
	</div>


<!-- 弹出浮动框 -->
	<div class="dialog" style="display:none;" title="分店详情">
		
	</div>

	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" flush="true"/>
	<script src="/js/global.js"></script>
	<script src="/js/form.js"></script>
	<script src="/js/jquery.page.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/layer/layer.js"></script>
	<script type="text/javascript">
	$(function(){
	
		var dialog = $('.dialog').dialog({width:900,height:600,autoOpen:false})
		$('.main').on('click','.opendialog',function(){dialog.dialog('open')})
		
		$('.opendialog').click(function(){
			var id= $(this).attr('data');
			$.ajax({
					url:"findShop.shtml?id="+id,
					data:{},
					dataType:"text",
					type:"post",
					success:function(data){
					dialog.html(data);
					dialog.dialog('open');
					
			}
		});		
			
	});
	
		
		$(".btn_del").click(function(){
			var id= $(this).attr('data');
			if(window.confirm("你确定要删除吗?")){
				$.ajax({
					url:"stores_del.shtml?id="+id,
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
});
		
		
	</script>
	
</body>
</html>