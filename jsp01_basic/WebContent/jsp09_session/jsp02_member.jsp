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
	<h3>session 정보를 저장하기</h3>
<%
	session.setAttribute("id", "hong");
	session.setAttribute("pw", "12345");
	session.setAttribute("name", "홍길동");
	
%>
	sessionID = <%= session.getId() %> <br>
	아이디 = <%= session.getAttribute("id") %> <br>
	비밀번호 = <%= session.getAttribute("pw") %> <br>
	이름 = <%= session.getAttribute("name") %>
</body>
</html>