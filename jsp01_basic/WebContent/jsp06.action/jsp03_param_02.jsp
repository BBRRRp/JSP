<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String status = request.getParameter("status");
	
	if(status.equals("A")) {
		out.println("<h3 class='text-primary'> A급 제품입니다.! </h3>");
	} else {
		out.println("<h3 class='text-warning'> B급 제품입니다! </h3>" );	
	}
	
%>