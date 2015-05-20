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
				<dd ><i class="icon icon-dongtai"></i><a href="vipCardOrder.shtml">会员卡订单数据</a></dd>
				<dd class="active"><i class="icon icon-huiyuan"></i><a href="getUserVipList.shtml">推广返利</a></dd>
				<dd><i class="icon icon-huiyuan"></i><a href="gethiveaction.shtml">蜂巢系统</a></dd>
			</dl>
			
		</div>


		<div class="usr_title">
		
			<h2 class="tle"><i class="icon icon-fabu"></i>推广返利<small>赚更多积分,享受更多优惠！</small></h2>
			<div style="position: absolute; right:0;top:20px;font-size: 20px;color: #036eb8;">
			
			<c:if test="${empty list2[0].takemoneys}">返利总额：0&nbsp;积分</c:if>
			<c:if test="${!empty list2[0].takemoneys}">返利总额：${list2[0].takemoneys}&nbsp;积分</c:if>
			<br>
			<a class="color_red opendialog" style="font-size: 14px;" data="${code}" url="${url}">怎样推广赚积分？</a> | 
			<a  style="font-size: 14px;" class="color_red opendvip">我的返利账号</a>
			</div>
			
				
			
		</div>
		

		<!--  <form action="getUserNameVipList.shtml" class="fukrm table_tle" method="post">
			会员账号：<input type="text" name=mobile value="" style="width:100px;" maxlength="20">
			<input type="submit" value="搜索">
		</form>
        -->
		<div class="table">
			<table border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th>编号</th>
						<th>会员账号</th>
						<th>推广获得积分</th>
						<th>日期</th>
					</tr>
				</thead>
				
				<tbody>	
			<c:if test="${empty pageSupport.result}"><tr><td colspan="7"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>
				<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
					<tr>
						<td>${list.id}</td>
						<td>${list.phone}</td>
						<td>${list.integral}</td>
						<td><fmt:formatDate value="${list.regdate}"  pattern="yyyy-MM-dd"/></td>
					</tr>
					</c:forEach>
					
				</tbody>			
			</table>

			<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false" ></div>  

		</div>


	

	</div>



	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,backstage" /></jsp:include>
	<script type="text/javascript">
		$(function(){
			$('.opendialog').click(function(){
			$.ajax({
					url:"/promoteAdd.shtml",
					data:{},
					dataType:"text",
					type:"post",
					success:function(data){
					dialog.html(data);
					dialog.dialog('open');		
				}
			});		
			
		})
		
		
		$('.opendvip').click(function(){
			$.ajax({
					url:"/getVip.shtml",
					data:{},
					dataType:"text",
					type:"post",
					success:function(data){
					dialog.html(data);
					dialog.dialog('open');		
				}
			});		
			
		})
	})
	</script>
