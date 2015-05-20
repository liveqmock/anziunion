<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<jsp:include page="/cglib/header.jsp" >

	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="hive" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />
<style>
	.ajaxpage{text-align: center;}
	.ajaxpage .total{display: none;}
</style>
	<div class="main cs">
		
		<div class="aside">
			<dl>
				<dt><i class="icon icon-iconfontliubianxing"></i>云蜂巢系统</dt>
				<dd><i class="icon icon-lianmeng"></i><a href="gethiveaction.shtml">云蜂巢</a></dd>
				<dd><i class="icon icon-tuiguangshuoming"></i><a href="hive_explain.shtml">推广说明</a></dd>
				<dd class="active"><i class="icon icon-yaoqing"></i><a href="hive_pop.shtml">推广账号</a></dd>
			</dl>
		</div>


		<h2 class="tle">
			<i class="icon icon-yaoqing"></i>推广账号
			<small>邀请好友加入，享消费返利</small>
		</h2>


		<%-- <form action="mobile.shtml" class="fukrm table_tle" method="post" style="padding-left: 10px;">
			账号：<input type="text" name="mobile" value="" style="width:100px;" maxlength="20">
			<input type="submit" value="查询">
		</form>--%>

		<div class="table straddling">
			<table border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th>返利账号</th>
						<th>账号类型</th>
						<th>账号等级</th>
						<th>注册时间</th>
						<th>已返利</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty pageSupport.result}"><tr><td colspan="6"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>
			<c:forEach var="five_list" items="${pageSupport.result}" varStatus="status" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
						<tr>
						<td>${five_list.phone}</td>
						<td>
							<c:if test="${five_list.flag eq '1'}"><span class="btn btn_blue">商户</span></c:if>
							<c:if test="${five_list.flag eq '0'}"><span class="btn btn_blue">用户</span></c:if>
						</td>
						<c:if test="${five_list.type eq '1'}"><td><span class="btn btn_red">一级蜂巢</span></td></c:if>
						<c:if test="${five_list.type eq '2'}"><td><span class="btn btn_blue">二级蜂巢</span></td></c:if>
						<td>${five_list.regdate}</td>
						<td>${five_list.integral}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div>
<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false" ></div>  



	</div>
	
	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,backstage" /></jsp:include>

