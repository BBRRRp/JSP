<%@page import = "java.util.ArrayList" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String name = "홍길동";
	String gender = "남자";
	int age = 99;
	
	ArrayList<String> bd = new ArrayList<>();
	bd.add("소향"); //BoardVO
	bd.add("여자");
	bd.add("43");
%>

<html>
<head>
<meta charset="UTF-8">
<title>1/3</title>
</head>
<body>
	<h1>이름 : <%= name %></h1>
	<h1>성별 : <%= gender %></h1>
	<h1>나이 : <%= age %></h1>
	<hr/>
	<h1>이름 <%= bd.get(0) %></h1>
	<h1>성별 <%= bd.get(1) %></h1>
	<h1>나이 <%= bd.get(2) %></h1>	
	
</body>
</html>