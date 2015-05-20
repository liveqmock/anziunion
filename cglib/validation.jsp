<%@ page language="java" pageEncoding="UTF-8" %>
<%
Integer id = (Integer) request.getSession().getAttribute("userid");
if(id == null || id<0){
%>
 <jsp:forward page="/index.shtml"/>       
<%}%>

