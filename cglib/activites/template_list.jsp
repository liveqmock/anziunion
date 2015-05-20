<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="activites" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />


	<div class="main cs">
		
	
		<div class="aside">
			<dl>
				<dt><i class="icon icon-xiajiaguanli"></i>模板管理</dt>
				<dd class="active"><i class="icon icon-tubiaozitihua01"></i><a href="getTemplatevip.shtml">模板列表</a></dd>
				<dd><i class="icon icon-tianjia"></i><a href="template_add.shtml">添加模板</a></dd>
			</dl>
		</div>


		<div class="usr_title">
			<i class="usr_title_img" style="background:none;"><img src="/images/huiyuan.png"/></i>
			<h3>模板列表</h3>
			<p>会员卡模板信息</p>
		</div>


		<div class="table">
			<table border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th>编号</th>
						<th>名称</th>
						<th>时间</th>
						<th>图片</th>
					</tr>
				</thead>
				
				<tbody>	
				<c:if test="${empty pageSupport.result}"><tr><td colspan="7"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>


					<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
					<tr>
						<td>${list.id}</td>
						<td>${list.name}</td>
						<td><fmt:formatDate value="${list.sysdate}"  pattern="yyyy-MM-dd"/></td>
						<td><img src="${basePath}${list.templatepath}" width="200" style="margin-left: 120px; margin-top: 10px;"/></td>
					</tr>
					</c:forEach>
				</tbody>			
			</table>

			<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false" ></div>  

		</div>


	

	</div>



	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,backstage" /></jsp:include>
