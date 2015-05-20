<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="product" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />
	
<style>
.yl:hover{ text-decoration: underline;color: red;}
</style>
	<div class="main cs">

	
		<div class="aside">
			<dl>	
				<dt><i class="icon icon-shangpinguanli"></i>商品管理</dt>
				<dd><a href="product_count_request.shtml"><i class="icon icon-xiaoshoutongji"></i>销售统计</a></dd>
				<dd><i class="icon icon-shangpinliebiaopress"></i><a href="product_lis_request.shtml">在线商品</a></dd>
				
				<dd class="active"><a href="product_Pendingauditlist_request.shtml"><i class="icon icon-shangpinshenhe"></i>待审核商品</a></dd>
				<dd><a href="product_Notthroughlist_request.shtml"><i class="icon icon-shenhebutongguo"></i>未通过商品</a></dd>
				<dd><a href="product_downlist_request.shtml"><i class="icon icon-xiajiaguanli"></i>已下架商品</a></dd>
				<dd><a href="commodity_add.shtml"><i class="icon icon-tianjia"></i>添加商品</a></dd>
			</dl>
			
			
		</div>



	<h2 class="tle"><i class="icon icon-shangpinshenhe"></i>待审核商品<small>您的商品正在审核中，请耐心等候，我们以最快的速度审核您的商品，让她尽快出来在客户面前！</small></h2>

		<form action="productName_Pendingauditlist_request.shtml" class="fukrm table_tle" method="post">
			商品名：<input type="text" name="pname" value="${pname }" style="width:100px;" maxlength="20">
			<input type="submit" value="查询">
		</form>


		<div class="table">
			<table border="0" cellspacing="0" cellpadding="0">
				
				<thead>
					<tr>
						<th>名 称</th>
						<th>价格</th>
						<th>品牌</th>
						<th>类别</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
						
				<c:if test="${empty pageSupport.result}"><tr><td colspan="6"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>

				<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
					<tr>
						<td><a class="yl" title="点击预览" href="http://www.anzimall.com/get_merchantsgoods_preview_details.shtml?id=${list.id}" target="_blank">${list.name}</a></td>
						<td><span style="color: #f37800;">${list.pice}</span></td>
						<td>${list.brand}</td>
						<td>${list.tid}</td>
						<td><span style="width: 68px;height: 21px;line-height: 21px;background-color:#5EA016;text-align: center;display: block;color: #ffffff;border-radius:6px;">待审核</span><td>
							<a onclick="return confirm('确认修改吗')" href="getUpdateManagement.shtml?id=${list.id}" >修改</a>
							<a class="color_blu del" data="${list.id}">删除</a>
						</td>
					</tr>
				</c:forEach>

				</tbody>			
			</table>
		</div>

		
		<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false" url="product_Pendingauditlist_request.shtml"></div>  

	
	</div>



	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,backstage" /></jsp:include>
	
	<script>
		$(function(){
			$(".del").click(function(){
				var id= $(this).attr('data');
				if(window.confirm("你确定要删除吗?")){
					$.ajax({
						url:"delManagement.shtml?id="+id,
						data:{},
						dataType:"json",
						type:"post",
						success:function(data){
							if(data.message){
								alert(data.message);
								if(data.url){
									window.location.href = data.url;
								}else{
									location.reload();
								}
							}else{
								alert('未知错误');	
							}
						}
					});
				};
				return false;
			});		
  		})
	</script>
