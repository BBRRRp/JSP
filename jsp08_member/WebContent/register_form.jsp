<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
		crossorigin="anonymous">    	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<body>
	<div class="container bg-dark text-white jumbotron" align="center">
		<h3>회원등록하기</h3>
		<p>이 화면은 회원등록을 하기 위한 화면입니다!!!</p>
	</div>
	
	<div class="container" align="center" style="width:400px">
		<form action="register" class="form-group" method="post">
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-user"></i></span>
				</div>
				<input type="text" class="form-control" name="id" placeholder="user id....."/>
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-key"></i></span>
				</div>
				<input type="password" class="form-control" name="pw" placeholder="password...."/>
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-tags"></i></span>
				</div>
				<input type="text" class="form-control" name="name" placeholder="name...."/>
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-address-card"></i></span>
				</div>
				<input type="text" class="form-control" name="ssn" placeholder="주민번호...."/>
			</div>
			
			<input type="submit" class="btn btn-success" value="회원등록"/>
			<input type="reset" class="btn btn-success" value="새로고침"/>
		</form>
	</div>
	
</body>
</html>