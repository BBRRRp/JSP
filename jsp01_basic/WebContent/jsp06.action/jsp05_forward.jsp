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
	<!-- <form action="jsp05_forward_02.jsp"> -->
	<form action ="<%= request.getContextPath()%>/jsp06.action/jsp05_forward_02.jsp">
		이동할 페이지 = 
		<select class="form-select" aria-label="page forward..." name ="code" id="">
  			<option selected>Open this select menu</option>
  			<option value="1">첫번째 페이지</option>
  			<option value="2">두번째 페이지</option>
  			<option value="3">세번째 페이지</option>
		</select>
	<br>
	
	<input type="submit" class="btn btn-info" value="페이지 forward"/>
	</form>

</body>
</html>