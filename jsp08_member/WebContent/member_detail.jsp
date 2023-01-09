<%@page import="com.lec.member.dto.Member"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<% Member member = (Member) session.getAttribute("login_info"); %>
	<div class="container" align="center">
		<h3>회원정보(로그인회원)</h3>
		아 이 디  : <%= member.getId() %><br>
		이    름  : <%= member.getName() %><br>
		주민번호  : <%= member.getRegNumber() %><br>
		마일리지  : <%= member.getMileage() %><br>
		<br>
		<input type="button" class="btn btn-success mr-md-3" value="회원수정"
			onclick="location.href='modify_form.jsp'"/>
		<input type="button" class="btn btn-success" value="회원탈퇴"
			onclick="location.href='remove'"/>
	</div>
</body>
</html>