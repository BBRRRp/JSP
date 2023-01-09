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
	<div class="container" align="center">
		<form action="upload" method="post" enctype="multipart/form-data">
			text1: <input type="text" name="text1" class="mb-sm-2"/><br>
			file1: <input type="file" name="file1" class="mb-sm-2"/><br>
			file2: <input type="file" name="file2" class="mb-sm-2"/><br>
			<input type="submit" class="btn btn-primary" value="파일업로드하기"/>
		</form>
	</div>
</body>
</html>