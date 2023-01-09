<%@page import="com.lec.web.model.Message"%>
<%@page import="com.lec.web.jdbc.ConnectionProvider"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.lec.web.dao.MessageDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	int cp = Integer.parseInt(request.getParameter("cp"));
	
	MessageDAO messageDAO = MessageDAO.getInstance();
	Connection conn = ConnectionProvider.getConnection();
	Message view_data = messageDAO.select(conn, id);
%>

<c:set var="view_data" value="<%=view_data %>"/>
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
		
			<h3>메시지 수정하기(페이지 번호 : <%= cp %>) </h3>
			
				<form action="update_message.jsp" class="form-group" method="post">
					<div class="input-group mb-2 mr-sm-2">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" name="guestName" class="form-control" value="${view_data.guestName}" disabled/>
					</div>
					<br>
					
					<div class="input-group mb-2 mr-sm-2">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-lock"></i></span>
						</div>
						<input type="password" name="pw" class="form-control"/>
					</div>
					<br>
					
					<div class="input-group mb-2 mr-sm-2">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-comment-dots"></i></span>
						</div>
						<textarea name="msg" id="" cols="30" rows="10" class="form-control">${view_data.message}</textarea>
					</div>
						<input type="hidden" name="id" value="${param.id}" />					
						<input type="hidden" name="cp" value="${param.cp}" />					
						<input type="submit" class="btn btn-primary mb-2" value="메시지수정하기"/>					
				</form>
		</div>

</body>
</html>