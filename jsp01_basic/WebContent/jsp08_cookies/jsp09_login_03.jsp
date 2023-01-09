<%@page import="com.lec.cookie.MyCookie"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MyCookie cookies = new MyCookie(request);
%>
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
	<div class="container">
		<h3>로그인여부 확인하기</h3>
		<%
			if(cookies.exists("ADMIN")) {
		%>
				<h4 class="bg-danger text-white">아이디 <%= cookies.getValue("ADMIN")%>로 로그인 중입니다!!</h4>
		<%
			} else {
		%>
				<h4>로그인을 하지 않은 상태입니다!!</h4>
		<%
			}
		%>
	</div>
</body>
</html>