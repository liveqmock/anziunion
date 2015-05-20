<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<jsp:include page="/cglib/header.jsp" >
<jsp:param name="css" value="global,backstage" />
<jsp:param name="header_active" value="invest" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />
<style>
	.wealth_content{position: relative;overflow: hidden;}
	.wealth_content a{position: absolute;}
</style>

	<div class="main cs">
		
		<div class="aside">
			<dl>
				<dt><i class="icon icon-youqianrenxing"></i>创富系统</dt>
				<dd class="active"><i class="icon icon-shengrilibao"></i><a href="/investIndex.shtml">创富礼包</a></dd>
				<dd><i class="icon icon-bbgzhaoshang"></i><a href="/invenstTglist.shtml">招商创富</a></dd>
			
			<c:if test="${temp_flag eq 1}">
				<dd><i class="icon icon-tuiguangjihua"></i><a href="/invenstSpread.shtml">创富推广</a></dd>
			</c:if>	
			
			</dl>
		</div>


		<img src="/cglib/wealth/invenst1.png" alt="" style="margin-left: -10px;margin-top: -10px;width: 790px;">

		<div class="wealth_content">
			<img src="/cglib/wealth/invenst2.png" alt="">
			<img src="/cglib/wealth/invenst3.png" alt="">
			<img src="/cglib/wealth/invenst4.png" alt="">
			<img src="/cglib/wealth/invenst5.png" alt="">
			<c:if test="${temp_flag eq 0}">
			<a href="/toBuyInvenst.shtml" style="left: 300px;top: 380px;"><img src="/cglib/wealth/invenst8.png" alt=""></a>
			</c:if>	
		</div>
		

	</div>
<!-- 页脚 -->




<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,jquery.flot,backstage" /></jsp:include>

