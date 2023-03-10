<%@page import="java.sql.Connection"%>
<%@page import="com.lec.db.JDBCUtility"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title> DB Connection Test</title>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<body>
	<div class="container" align="center">
		<h3>DB Connection Test</h3>
		
		<%
			try (Connection conn = JDBCUtility.getConnection()) {
				out.println("<p class='bg bg-success text-white'>DB Connection 성공!!</p>");
				
			} catch(Exception e) {
				out.println("DB Connection 실패" + e.getMessage());
				application.log("<p class='bg bg-danger text-white'> DB Connection 성공!</p>", e);
			} 
		
		%>
	</div>
</body>
</html>