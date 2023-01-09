<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title> 1/5 _ 로그인페이지</title>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<body>
	<!-- 1/5 실습. 로그인폼 작성 성공되었으면 jsp04_join.jsp 호출 -->
	
	<div class="container">
		<form action="jsp04_join.jsp" method="post">
			<div class="form-group">
				<label for="id">ID : </label>
				<input type="text" class="form-control" name="id" id="id" />
			</div>
		
			<div class="form-group">
				<label for="name">Name : </label>
				<input type="text" class="form-control" name="name" id="name" />
			</div>
		
			<div class="form-group">
				<label for="name"> email : </label>
				<input type="text"class="form-control" name="email" id="email"/>
			</div>
		
			<input type="submit"  value="회원가입"/>
		</form>
		
	</div>
</body>
</html>