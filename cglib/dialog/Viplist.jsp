<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
		
		<div class="table" style="width: 650px;">
			<table border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						
						<th>返利账号</th>
						<th>绑定时间</th>
						<th>绑定方式</th>
					</tr>
				</thead>
				<c:if test="${empty pageSupport.result}"><tr><td colspan="3"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>
				<tbody>	
					<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
					<tr>
						<td>${list.mobile}</td>
						<td><fmt:formatDate value="${list.sysdate}"  pattern="yyyy-MM-dd"/></td>
						<td>
							<c:if test="${list.type eq '0'}">注册码</c:if>
							<c:if test="${list.type eq '1'}">推广链接</c:if>
							<c:if test="${list.type eq '2'}">商品分享</c:if>
						</td>
					</tr>
					</c:forEach>
				</tbody>			
			</table>

			<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false" ></div>  

		</div>
	


	<script>dialog.dialog("option","title", "返利账号");</script>
