<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="dialog_box">
<jsp:include page="/cglib/validation.jsp" flush="true"/>

	<table class="table" cellspacing="0">
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
				<td>分店名称:</td>
				<td>${list[0].sname}</td>
			</tr>
			<tr>

				<td>分店地址:</td>
				<td>${list[0].province}${list[0].city}${list[0].county}${list[0].address}</td>
				<td>电话:</td>
				<td>${list[0].phone}</td>
			</tr>
			<tr>
				<td>状态:</td>
				<td>
					<c:if test="${list[0].status eq '0'}">待审核</c:if>
					<c:if test="${list[0].status eq '1'}">未通过</c:if>
					<c:if test="${list[0].status eq '2'}">已通过</c:if>
				</td>
				<td>审核回执信息:</td>
				<td><c:if test="${!empty list[0].receipt}">${list[0].receipt}</c:if></td>
				
			</tr>
			<tr>

				<td>分店照片:</td>
				<td><img src="${basePath}${list[0].photo}"  width="200px;" height="158px;"/></td>
				<td>营业执照:</td>
				<td><img src="${basePath}${list[0].permit}"  width="200px;" height="158px;"/></td>
			</tr>
			<tr>

				<td>分店描述:</td>
				<td colspan=3>${list[0].description}</td>
			</tr>	
		</tbody>
	</table>
</div>

