<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 1/5  -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>

	<!-- 에러발생시 exception 처리  -->
	<% try { %>
		<%=	request.getParameter("xxx").toUpperCase() %>
	<% } catch(Exception e) { %>
		<h4> 파라미터를 찾지 못했습니다.</h4>
	<% } %>	
</body>
</html>