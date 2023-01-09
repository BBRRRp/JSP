<%@page import="com.lec.web.exception.InvalidPasswordException"%>
<%@page import="com.lec.web.service.DeleteMessageService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	int cp = Integer.parseInt(request.getParameter("cp"));
	String pw = request.getParameter("pw");
	boolean invalidPass = false;
	
	try {
		DeleteMessageService deleteService = DeleteMessageService.getInstance();
		deleteService.deleteMessage(id, pw);
	} catch(InvalidPasswordException e) {
		invalidPass = true; // 비번불일치
	}	
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
	<div class="container" align="center">
		<h3>메시지삭제하기</h3>
		
		 	<% if(!invalidPass) {%>
		 		<h4 class="bg-success text-white">메시지 삭제 성공</h4>
			<% } else { %>
				<h4 class="bg-danger text-white">비번 불일치. 다시 입력 ㄱㄱ</h4>	
			<% } %>
			<br />
			<a href="list.jsp?page=<%=cp%>" class="btn btn-primary"> 목록보기 </a>
	</div>
</body>
</html>