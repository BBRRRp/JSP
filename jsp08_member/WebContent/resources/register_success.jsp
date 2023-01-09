<%@page import="com.lec.member.dto.Member"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% Member member = (Member) request.getAttribute("member"); %>
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
	<div class="container" align="center" style="width: 600px">
		<h3>회원등록이 성공되었습니다!!</h3>
		<table class="table table-dark text-white">
			<tr>
				<td style="width: 20%">아이디</td>
				<td><%= member.getId() %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%= member.getPassword() %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%= member.getName() %></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><%= member.getRegNumber() %></td>
			</tr>
			<tr>
				<td>마일리지</td>
				<td><%= member.getMileage() %></td>
			</tr>
		</table>
		<a href="/login_form.jsp" class="btn btn-primary mt-sm-5 mr-sm-2">로그인</a>
		<a href="/" class="btn btn-primary mt-sm-5">홈페이지이동</a>
	</div>
</body>
</html>
















