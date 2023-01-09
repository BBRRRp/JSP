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
		<h3>파일업로드하기</h3>
		<form action="jsp05_fileupload.jsp" method="post" enctype="multipart/form-data" class="form-group">
			
			<table class="table table-hover">
			
				<tr>
					<td width="20%">업로드한사람</td>
					<td><input type="text" name="name" class="form-control" value="홍길동"/></td>
				</tr>
				
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" class="form-control" value="파일업로드 및 다운로드하기"/></td>
				</tr>
				
				<tr>
					<td>파일1</td>
					<td><input type="file" name="filename1" class="form-control"/></td>
				</tr>
				
				<tr>
					<td>파일2</td>
					<td><input type="file" name="filename2" class="form-control"/></td>
				</tr>
			</table>
			<input type="submit" class="btn btn-primary" value="파일업로드"/>
		</form>
	</div>
</body>
</html>

















