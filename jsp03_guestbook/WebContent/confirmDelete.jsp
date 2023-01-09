<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	int cp = Integer.parseInt(request.getParameter("cp"));
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
		<form action="delete_message.jsp" method="post">
			<b class="text-danger">메시지를 삭제하려면 비번입력 ㄱㄱ</b>
			<div class="input-group mb-2 mr-sm-2">
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-lock"></i></span>
				</div>
				<input type="password" name="pw" class="form-control" size="30"/>
			</div>
			<input type="hidden" name="id" value="${param.id}"/>
			<input type="hidden" name="cp" value="${param.cp}"/>
			<input type="submit" class="btn btn-danger" value="메시지삭제"/>
		</form>
	</div>
</body>
</html>