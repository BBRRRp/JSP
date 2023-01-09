<%@ page import="com.lec.cookie.MyCookie" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<body>
	<h3>사용자가 작성한 클래스로 cookie를 생성하기</h3>
	<%
		
		response.addCookie(MyCookie.createCookie("id", "hong"));
		response.addCookie(MyCookie.createCookie("pw", "12345"));
		response.addCookie(MyCookie.createCookie("name", "홍길동"));	
		response.addCookie(MyCookie.createCookie("pathxxx", "/jsp08_cookies/path1", "/jsp08_cookies", 60));	
	%>
	
	<p>사용자가 작성한 MyCookie클래스로 cookie를 생성했습니다.</p>
</body>
</html>