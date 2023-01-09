<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//import java.util.Date; 에러
	Date now = new Date();
%>
<html>
<head>
<meta charset="UTF-8">
<title>2022.1.3 스크립트릿(Scriptlet) </title>
</head>
<body>
	<!-- < %= %> :스크립트릿(Scriptlet), 블럭안에 있는 명령을 문자열로 생성해주는 기능  -->
	<h1>현재시간 : <%= new java.util.Date() %></h1>
	<h1>현재시간 : <%= now %></h1>
	<!--JSP이용시 실시간으로 현재 시간 반영가능  -->
</body>
</html>