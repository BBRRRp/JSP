<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int code = Integer.parseInt(request.getParameter("code"));
	String forward_page = null;
	out.println("<h3>jsp05_forward_02.jsp?code=" + code + "</h3><br>");
	
	if(code == 1) {
		forward_page = "./forward/a.jsp";
	} else if(code == 2) {
		forward_page = "./forward/b.jsp";
	} else {		
		forward_page = "./forward/c.jsp";
	}
%>
<jsp:forward page="<%= forward_page %>" />