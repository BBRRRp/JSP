<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals(pw)) {
		session.setAttribute("admin", id);
%>
		<!DOCTYPE html>
		<html><head>
		</head>
		<body>
			<h3>로그인 성공</h3>
		</body>		
		</html>	
<%
	} else {
%>		
		<script>
			alert("로그인실패!!");
			history.go(-1);
		</script>
<%
	 }
%>
