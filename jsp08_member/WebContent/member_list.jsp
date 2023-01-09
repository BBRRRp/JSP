<%@page import="com.lec.member.dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list"); %>
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
		<h3>회원목록</h3>
		<table class="table table-hover">
			<tr class="table-dark text-light">
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>비밀번호</th>
				<th>주민번호</th>
				<th>마일리지</th>
			</tr>
			<% for(int i=0;i<list.size();i++) { %>
			<tr>
				<td><%= i+1 %></td>
				<td><a href="/member/member_detail.jsp?id=<%= list.get(i).getId() %>"><%= list.get(i).getId() %></a></td>
				<td><%= list.get(i).getName() %></td>
				<td><%= list.get(i).getPassword() %></td>
				<td><%= list.get(i).getRegNumber() %></td>
				<td><%= list.get(i).getMileage() %></td>
			</tr>
			<% } %>
		</table>
	</div>
</body>
</html>


















