<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<jsp:include page="/cglib/validation.jsp" flush="true"/>
<div class="dialog_box">

	
	<table class="table" cellspacing="0" width="1000" height="900">
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
				<td>商品名称:</td>
				<td>${list[0].name}</td>
			</tr>
			<tr>
				<td>种类:</td>
				<td>${list[0].tid}</td>
				<td>品牌:</td>
				<td>${list[0].brand}</td>
			</tr>
			<tr>
				<td>关键字搜索:</td>
				<td>${list[0].scope}</td>
				<td>状态:</td>
				<td>
					<c:if test="${list[0].status eq '0'}"><span class="color_gre">已上架</span></c:if>
					<c:if test="${list[0].status eq '1'}"><span class="color_gre">已下架</span></c:if>
					<c:if test="${list[0].status eq '2'}"><span class="color_gre">待审核</span></c:if>
					<c:if test="${list[0].status eq '3'}"><span class="color_gre">未通过</span></c:if>
				
				</td>
			</tr>
			<tr>
				
				<td>创建时间:</td>
				<td><fmt:formatDate value="${list[0].syadate}"  pattern="yyyy-MM-dd"/></td>
				<td>价格:</td>
				<td>${list[0].pice}元</td>
			</tr>
			<tr>
				<td>商品图片:</td>
				<td colspan="3">
				<div class="preview" href="${basePath}${list[0].scopeimg}" title=""  style="float: left;"  >
					<img src="${basePath}${list[0].scopeimg}"  width="180px;" height="158px;"/>
				</div>	
				<div class="preview" href="${basePath}${list[0].picpath}" title=""  style="float: left; margin-left: 10px;" >
					<img src="${basePath}${list[0].picpath}"  width="180px;" height="158px;"/>
				</div>
				<div class="preview" href="${basePath}${list[0].picpath2}" title=""   style="margin-left:10px;">
					<img src="${basePath}${list[0].picpath2}"  width="180px;" height="158px;"/>
				</div>	
				<div class="preview" href="${basePath}${list[0].picpath3}" title=""   style="float: left;margin-left: 10px;">
					<img src="${basePath}${list[0].picpath3}"  width="180px;" height="158px;"/>
				</div>	
				<div class="preview" href="${basePath}${list[0].picpath4}" title=""  style="float: left; margin-left: 10px;" >
					<img src="${basePath}${list[0].picpath4}"  width="180px;" height="158px;"/>
				</div>	
				</td>
			</tr>

			<tr>
				<td>描述:</td>
				<td colspan=3>${list[0].account}</td>
			</tr>
			
			
			<tr>
				<td >审核回执信息:</td>
				<td colspan="3"><c:if test="${!empty list[0].receipt}">${list[0].receipt}</c:if></td>
			</tr>
				
		</tbody>
	</table>
</div>
<script type="text/javascript" src="/js/jquery.imagePreview.1.0.js"></script>
<script type="text/javascript">
$(function(){
	$("div.preview").preview();	  
});
</script>
