<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<% 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";

	request.setAttribute("basePath","");
	request.setAttribute("css", request.getParameter("css"));
	request.setAttribute("active",request.getParameter("header_active"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	
	<title>异业联盟</title>
	 <meta name="description" content="安淘惠异业联盟，海量商家入驻,安淘惠、异业联盟、跨界联盟、云蜂巢系统、思维创富系统、云创富系统、商家入驻、结算系统、商品管理系统">
	<meta name="keywords" content="安淘惠异业联盟，海量商家入驻,安淘惠、异业联盟、跨界联盟、云蜂巢系统、思维创富系统、云创富系统、商家入驻、结算系统、商品管理系统">
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	<base href="${basePath}">
	<%-- 加载css --%>
	<c:forEach var="item" items="${css}"><link type="text/css" rel="stylesheet" href="/css/${item}.css"></c:forEach>

	<!--[if lt IE 8]><script src="js/ie67.js"></script><![endif]-->
	<!--[if lt IE 9]><script src="/js/excanvas.min.js"></script><![endif]-->
	<script> 
		// 全局变量
		var GLOBAL = {};
		<c:if test="${sessionScope.userid eq null}">GLOBAL.loaded =  false;</c:if>
		<c:if test="${sessionScope.userid > 0}">GLOBAL.loaded =  true;</c:if>
	</script>
</head>
<body>

	<!-- 顶部广告-->
	<!--<section class="header_ad" style="background: #44b4ff;"><a href="#"><img src="images/head_ad.jpg" alt=""></a></section>-->

	
	<!-- 加载 顶部 -->
	<c:if test="${sessionScope.userid eq null}">
		<!-- 未登陆 -->
		<jsp:include page="/cglib/header_unlogin.jsp" flush="true"/>
	</c:if>

	<c:if test="${sessionScope.userid > 0}">
		<!-- 已登陆 -->
		<jsp:include page="/cglib/validation.jsp" flush="true"/>
		<jsp:include page="/cglib/header_logined.jsp" flush="true"/>
	</c:if>



	
	