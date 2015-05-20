<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<jsp:include page="/cglib/header.jsp"><jsp:param name="css" value="global,backstage" /><jsp:param name="header_active" value="invest" /></jsp:include>
<jsp:include page="/cglib/validation.jsp"  />
<style>
	.wealth_content{position: relative;overflow: hidden;}
	.wealth_content a{position: absolute;}
	.fuck{position: relative;overflow: hidden; width: 710px;height: 540px;margin: 0 auto; background: #f8f8f8;}
	.fuckthewealth{height: 540px; background: url(/images/fuckthewealth.png) no-repeat center center;text-align: center;}
	.fuckthewealth:before{content: '';display: inline-block;width: 1px;height: 100%;vertical-align: middle;}
	.fuckthewealth span{margin-left: 22px;margin-top: 25px; vertical-align: middle;display: inline-block;font-size: 14px;color: #fff; }
	.fuck li{float: left;position: relative; width: 100px;height: 101px;margin: 0 12px 210px; background: #ccc;white-space: nowrap;}
	.fuck li b{display: inline-block;vertical-align: middle;width: 100%;height: 100%;}
	.fuck li span{display: inline-block;vertical-align: middle;width: 100px; margin-left: -100px;text-align: center;white-space: normal;color: #fff;font-size: 14px;}
	.fuck li:after{content: '';display: block;position: absolute;top: 0;left: 0; width: 100px;height: 101px; background: url(/images/zhezhaoyuan.png) no-repeat;}
	.fuck ul{position: absolute;left: 53px;top: 70px;}
</style>

	<div class="main cs">
		
		<div class="aside">
			<dl>
				<dt><i class="icon icon-youqianrenxing"></i>创富系统</dt>
				<dd><i class="icon icon-shengrilibao"></i><a href="/investIndex.shtml">创富礼包</a></dd>
				<dd class="active"><i class="icon icon-bbgzhaoshang"></i><a href="/invenstTglist.shtml">招商创富</a></dd>
			<c:if test="${temp_flag eq 1}">
				<dd><i class="icon icon-tuiguangjihua"></i><a href="/invenstSpread.shtml">创富推广</a></dd>
			</c:if>	
			</dl>
		</div>


		
		<h2 class="tle">
			<c:if test="${temp_flag eq 1}">
			<span style="font-size:16px;font-weight:normal;">您的创富职级：</span><strong>商务助理 </strong>
			<small>距离晋级商务主管还需点亮 <font color="#ee2323;">${10-fn:length(list)}</font> 盏彩灯</small>
			</c:if>	

			<c:if test="${temp_flag eq 0}">
			<a href="/toBuyInvenst.shtml" style="position: absolute;right: 0;top: 30px;"><img src="/cglib/wealth/invenst7.png" alt=""></a>
			</c:if>	
		</h2>
		
		

		<br>

	
		<div class="fuck">
			
			<c:if test="${temp_flag eq 0}"><div class="fuckthewealth"><span>尚未加盟<br></span></div></c:if>	
			<c:if test="${temp_flag eq 1}"><div class="fuckthewealth"><span>我的创富等级<br>商务助理</span></div></c:if>	
			<ul>
				<c:if test="${!empty list[0]}">
					<li><b style="background:#f8c400;"></b><span>${ list[0].mobile }<br>商务助理</span></li>
				</c:if>	
				
				<c:if test="${empty list[0] }">
					<li><b style="background:#ccc;"></b><span>待招商</span></li>
				</c:if>	
				
				<c:if test="${!empty list[1]}">
					<li><b style="background:#78b90e;"></b><span>${ list[1].mobile }<br>商务助理</span></li>
				</c:if>	
			
				<c:if test="${empty list[1] }">
					<li><b style="background:#ccc;"></b><span>待招商</span></li>
				</c:if>	
				
				<c:if test="${!empty list[2]}">
					<li><b style="background:#b674fa;"></b><span>${ list[2].mobile }<br>商务助理</span></li>
				</c:if>	
			
				<c:if test="${empty list[2] }">
					<li><b style="background:#ccc;"></b><span>待招商</span></li>
				</c:if>
				
				<c:if test="${!empty list[3]}">
					<li><b style="background:#f8c400;"></b><span>${ list[3].mobile }<br>商务助理</span></li>
				</c:if>	
			
				<c:if test="${empty list[3] }">
					<li><b style="background:#ccc;"></b><span>待招商</span></li>
				</c:if>	
				
				<c:if test="${!empty list[4]}">
					<li><b style="background:#b674fa;"></b><span>${ list[4].mobile }<br>商务助理</span></li>
				</c:if>	
			
				<c:if test="${empty list[4] }">
					<li><b style="background:#ccc;"></b><span>待招商</span></li>
				</c:if>	
				
				<c:if test="${!empty list[5]}">
					<li><b style="background:#b674fa;"></b><span>${ list[5].mobile }<br>商务助理</span></li>
				</c:if>	
			
				<c:if test="${empty list[5] }">
					<li><b style="background:#ccc;"></b><span>待招商</span></li>
				</c:if>		
				
				<c:if test="${!empty list[6]}">
					<li><b style="background:#b674fa;"></b><span>${ list[6].mobile }<br>商务助理</span></li>
				</c:if>	
			
				<c:if test="${empty list[6] }">
					<li><b style="background:#ccc;"></b><span>待招商</span></li>
				</c:if>	
				
				<c:if test="${!empty list[7]}">
					<li><b style="background:#b674fa;"></b><span>${ list[7].mobile }<br>商务助理</span></li>
				</c:if>	
			
				<c:if test="${empty list[7] }">
					<li><b style="background:#ccc;"></b><span>待招商</span></li>
				</c:if>	
				
				<c:if test="${!empty list[8]}">
					<li><b style="background:#b674fa;"></b><span>${ list[8].mobile }<br>商务助理</span></li>
				</c:if>	
			
				<c:if test="${empty list[8] }">
					<li><b style="background:#ccc;"></b><span>待招商</span></li>
				</c:if>	
				
				<c:if test="${!empty list[9]}">
					<li><b style="background:#b674fa;"></b><span>${ list[9].mobile }<br>商务助理</span></li>
				</c:if>	
			
				<c:if test="${empty list[9] }">
					<li><b style="background:#ccc;"></b><span>待招商</span></li>
				</c:if>	
				
			</ul>

		</div>
	
		
	

		<c:if test="${temp_flag eq 0}">
			<div style="margin:30px 0;text-align:center">您还未成为资源运营商！现在<a href="/toBuyInvenst.shtml" style="color:#3f99ff;">就去申购！</a></div>
		</c:if>	

		<c:if test="${temp_flag eq 1}">
		
		<h4 style="margin-top:20px;font-weight:normal;position:relative;"><i class="icon icon-chakan" style="color:#f46302;font-size:28px;"></i>分润记录
		<span style="position: absolute;right:0px;bottom:5px;">累计分润: <strong>${list[0].integral * fn:length(list)}</strong></span>	</h4>
		<div class="info_table">
			<div class="table">
				
			
				<table border="0" cellspacing="0" cellpadding="0">
					
					 <thead>
						<tr>
							<th>时间</th>
							<th>招商账号</th>
							<th>分润金额</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list}" varStatus="index">
						<tr>
							<td> <fmt:formatDate value="${list.getdate}"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${list.mobile }</td>
							<td>5608*20% = 1121.6</td>
						</tr>
						</c:forEach>
					</tbody>	
				</table>
				<p>分润记录是资金招商发展的销售额提成明细，销售越多，收获越丰厚</p>
				
			</div>

			
			
		</div>
	</c:if>	

</div>

			
<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,jquery.flot,backstage" /></jsp:include>

<script>
	$('.head_nav').find('a[href="investIndex.shtml"]').parent().addClass('active');


</script>