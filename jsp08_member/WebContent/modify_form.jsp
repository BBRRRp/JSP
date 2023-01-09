<%@page import="com.lec.member.dto.Member"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% Member member = (Member) session.getAttribute("login_info"); %>
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
	<div class="container" align="center">
		<h3>회원정보수정하기</h3>
		<form action="modify" method="post" class="form-group">
			<table class="table table-dark">
				<tr>
					<td style="width:20%">아이디</td>
					<td><input type="text" class="form-control" disabled value="<%= member.getId() %>"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" class="form-control" name="name" value="<%= member.getName() %>"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" class="form-control" name="pw" value="<%= member.getPassword() %>"/></td>
				</tr>
				<tr>
					<td>주민번호</td>
					<td><input type="text" class="form-control" name="ssn" value="<%= member.getRegNumber() %>"/></td>
				</tr>
				<tr>
					<td>마일리지</td>
					<td><input type="text" class="form-control" name="mileage" value="<%= member.getMileage() %>"/></td>
				</tr>
			</table>
			<br />
			<input type="hidden" name="id" value="<%= member.getId() %>"/>
			<input type="submit" class="btn btn-success mr-sm-3" value="회원정보수정"/>
			<input type="reset" class="btn btn-success mr-sm-3" value="새로고침"/>
		</form>
	</div>
</body>
</html>