<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>


<jsp:include page="/cglib/validation.jsp" flush="true"/>

<div class="dialog_box">

	<div class="table">
		<table border="0" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<td width=80 >类型</td>
					<td>结果</td>
					<td width=80 >类型</td>
					<td>结果</td>
				</tr>
			</thead>
			<tbody>

				<tr>
					<td>编号:</td>
					<td>${list[0].id}</td>
					<td>名称:</td>
					<td>${list[0].name}折</td>
				</tr>
				<tr>
					<td>创建时间:</td>
					<td><fmt:formatDate value="${list[0].sysdate}"  pattern="yyyy-MM-dd"/></td>
					<td>状态:</td>
					<td>
						<c:if test="${list[0].state eq '0'}">已通过</c:if>
						<c:if test="${list[0].state eq '1'}">审核中</c:if>
					</td>
				</tr>
				
				
				
				<tr>
					<td>图标:</td>
					<td><img src="${basePath}${list[0].vipphoto}"  width="200px;" height="158px;"/></td>
					<td>审核回执信息:</td>
					<td><c:if test="${!empty list[0].receipt}">${list[0].receipt}</c:if></td>
				</tr>
				<tr>				
					
					<td>描述:</td>
					<td colspan=3>${list[0].note}</td>
				</tr>
				
				<tr>				
					
					<td>会员卡显示元素:</td>
					<td colspan=3>
						<c:if test="${list[0].element1 eq '0'}">左上角显示商户logo</c:if>
						<c:if test="${list[0].element2 eq '0'}">显示会员卡名称</c:if>
						<c:if test="${list[0].element3 eq '0'}">显示优惠折扣</c:if>
						<c:if test="${list[0].element4 eq '0'}">显示会员卡序列号</c:if>
					</td>
				 </tr>
					
			</tbody>
		</table>
	</div>
</div>

<script>
	dialog.dialog("option","title", "${list[0].name}");
</script>
