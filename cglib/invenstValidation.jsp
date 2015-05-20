<%@ page language="java" pageEncoding="UTF-8" %>
<%
Integer id = (Integer) request.getSession().getAttribute("temp_flag");
if(id == 1){
%>
 <jsp:forward page="/index.shtml"/>       
<%}%>

