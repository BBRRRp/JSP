<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage = "/jsp05.error/error/error500.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
 </head>
<body>
	<!-- 에러발생시 에러페이지 적용 -->
	<%= request.getParameter("xxx").toUpperCase() %>

</body>
</html>