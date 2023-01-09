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
		<!-- http://www.localhost:8088/xxx -->
		<form action="xxx" method="get">
			<input type="submit" class="btn btn-success" value="web.xml방식 - get(/xxx)"/>
		</form>
		<br />
		<form action="xxx" method="post">
			<input type="submit" class="btn btn-success" value="web.xml방식 - post(/xxx)"/>
		</form>		
		<br />
		<form action="hello" method="get">
			<input type="submit" class="btn btn-success" value="web.xml방식 - get(/hello)"/>
		</form>
		<br />
		<form action="now" method="get">
			<input type="submit" class="btn btn-success" value="@WebServlet - get(/now)"/>
		</form>
		<br />
		<form action="now" method="get">
			<input type="submit" class="btn btn-success" value="@WebServlet - post(/now)"/>
		</form>
	</div>
</body>
</html>