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
				<dt><i class="icon icon-icon12"></i>优惠管理</dt>
				<dd ><i class="icon icon-chanpinleimu"></i><a href="vipCardList.shtml">会员卡列表</a></dd>
				<dd><i class="icon icon-fabu"></i><a href="vipCard.shtml">发布会员卡</a></dd>
				<dd class="active"><i class="icon icon-dongtai"></i><a href="vipCardOrder.shtml">会员卡订单数据</a></dd>
				<dd><i class="icon icon-huiyuan"></i><a href="getUserVipList.shtml">推广返利</a></dd>
				<dd><i class="icon icon-huiyuan"></i><a href="gethiveaction.shtml">蜂巢系统</a></dd>
			</dl>
		</div>



		
	


		<h2 class="tle"><i class="icon icon-dongtai"></i>会员数据<small>拥有您的会员卡，用户会更喜欢您！</small></h2>
		<form action="vipCardOrderTime.shtml" class="fukrm table_tle" method="post">
	<input type="text" name="sysdate" class="laydate-icon" onclick="laydate()" readonly="readonly" style="width:100px;" placeholder="开始">&nbsp;至
	<input type="text" name="enddate" class="laydate-icon" onclick="laydate()" readonly="readonly" style="width:100px;" placeholder="结束">
			<input type="submit" value="查询">
		</form>


		<div class="table">
			
			<table border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th>编号</th>
						<th>用户账号</th>
						<th>会员卡名称</th>
						<th>绑定日期</th>
					</tr>
				</thead>
				
				<tbody>	
					<c:if test="${empty pageSupport.result}"><tr><td colspan="6"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>


					<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
					<tr>
						<td>${list.id}</td>
						<td>${fn:substring(list.phone,0 ,3)}****${fn:substring(list.phone,7 ,11)}</td>
						<td>${list.name}</td>
						<td><fmt:formatDate value="${list.sysdate}"  pattern="yyyy-MM-dd"/></td>
					</tr>
					</c:forEach>
					
				</tbody>			
			</table>

			<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false" ></div>  

		</div>


	

	</div>


	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,backstage" /></jsp:include>
	<script type="text/javascript" src="/js/laydate/laydate.js"></script>
