<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="union" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />
<style>
	.ajaxpage{text-align: center;}
	.ajaxpage .total{display: none;}
</style>


	<div class="main cs">
		
		<div class="aside">
			<dl>
				<dt><i class="icon icon-shanghu01"></i>跨界联盟</dt>
				<dd class="active"><i class="icon icon-pingtaizhongxin"></i><a href="union.shtml">商品广场</a></dd>
				<dd><i class="icon icon-76wodeyibanyewu"></i><a href="good_manager.shtml">接单管理</a></dd>
				<dd><i class="icon icon-76wodeyibanyewu"></i><a href="goods_publish.shtml">发布管理</a></dd>
			</dl>
		</div>


		
		<h2 class="tle">
			<i class="icon icon-pingtaizhongxin"></i>商品广场
			<small>您可以在广场接受其他行业的推广单，并显示在您的店铺推荐内，当完成消费后可享受利润分成</small>
		</h2>
		<br>



		<%--<div class="filter">
			<div class="filter_con">
				<div class="filter_tit">分类：</div>
				<div class="filter_attrs" id="filter_cat">
					<ul>
						<li><a href="/get_moreall.shtml?tid=文化用品">文化用品</a></li>
						<li><a href="/get_moreall.shtml?tid=家用电器">家用电器</a></li>
						<li><a href="/get_moreall.shtml?tid=办公用品">办公用品</a></li>
						<li><a href="/get_moreall.shtml?tid=服饰">服饰</a></li>
						<li><a href="/get_moreall.shtml?tid=运动户外">运动户外</a></li>
						<li><a href="/get_moreall.shtml?tid=生活饮食">生活饮食</a></li>
						<li><a href="/get_moreall.shtml?tid=美容产品">美容产品</a></li>
					</ul>
				</div>
			</div>
			<div class="filter_con">
				<div class="filter_tit">热门：</div>
				<div class="filter_attrs">
					<ul>
						<li><a href="/get_morebrand.shtml?brand=耐克">耐克</a></li>
						<li><a href="/get_morebrand.shtml?brand=三叶草">三叶草</a></li>
						<li><a href="/get_morebrand.shtml?brand=雅鹿">雅鹿</a></li>
						<li><a href="/get_morebrand.shtml?brand=周黑鸭">周黑鸭</a></li>
						<li><a href="/get_morebrand.shtml?brand=苹果">苹果</a></li>
						<li><a href="/get_morebrand.shtml?brand=逗妮开心">逗妮开心</a></li>
						<li><a href="/get_morebrand.shtml?brand=三大名山">三大名山</a></li>
					</ul>
				</div>
			</div>
		</div> --%>
	
		<div class="straddling_plaza">
		<c:if test="${empty pageSupport.result}"><tr><td colspan="6"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>
			<ul>
			<c:forEach var="good_list" items="${pageSupport.result}" varStatus="status" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
				<li>
					<h3><a href="/get_merchantsgoods_details.shtml?id=357"><img src="${good_list.picpath}" alt="${good_list.name}"></a></h3>
					<p><strong>[多城团购]</strong> <a href="/get_merchantsgoods_details.shtml?id=357">${good_list.account}</a></p>
					<cite>
						<strong>0</strong>元+<strong>${good_list.pice}</strong>积分 
						<span><em>${good_list.user_num}</em>家接单</span>
					</cite>
					<h5><span>提成比例：${good_list.profit}</span><em>${good_list.storename}</em></h5>
					<h6><a href="myorder.shtml?gid= ${good_list.id}&profit=${good_list.profit}&mid=${good_list.mid}"><i class="icon icon-icon12"></i>我要接单</a></h6>
				</li>
         </c:forEach>
         	</ul>
         </div>
		<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false" ></div>  
          </div>
<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,backstage" /></jsp:include>

	<script>
		$(function(){

			dialog.on('click','.cancel',function(){dialog.dialog('close');});

		
			// 我要接单异步
			dialog.on('click','.dialog_straddling_shelves',function(){
				$.ajax({
					type: "POST",
					dataType:'json',
					url: this.getAttribute('href'),
					success: function(data) { 
						 dialog.html('<div class="dialog_straddling" style="width:300px;"><h2>'+data.str+'</h2><br><div style="text-align: center;"><b class="cancel">关闭</b></div></div>').dialog("option","title", "跨界联盟接单").dialog('open');
						location.reload();
					}
				});
				return false;
			})


			// 我要接单点击事件
			$(document.body).on('click','.straddling_plaza a',function(){

				var html = '<div class="dialog_straddling" style="width:300px;"><h2>是否接单？</h2><br><div style="text-align: center;"><a class="dialog_straddling_shelves btn_submit" href="'+this.getAttribute('href')+'">确定接单</a><b class="cancel">关闭</b></div></div>';
					dialog.html(html).dialog("option","title", "跨界联盟接单").dialog('open');

				return false;
			});

		})
		
		var search = location.search || '';
		$('.filter').find('a').each(function(){
			if(search.indexOf(encodeURI(this.innerHTML))>-1){
				this.className = 'active';
			}
		});

	</script>