<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--1/6 쿠키생성  -->
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
	<h3>쿠키생성(Domain)</h3>
	
	<%
		Cookie cookie1 = new Cookie("id", "hong");
		cookie1.setDomain("anonymous.com");
		response.addCookie(cookie1);
		
		Cookie cookie2 = new Cookie("xxx", "쿠키만사용");
		response.addCookie(cookie2);	
	
		Cookie cookie3 = new Cookie("invalid", "유효하지않은쿠키");
		cookie3.setDomain("www.daum.net");
		response.addCookie(cookie3);
	%>
	
	<%= cookie1.getName()%> = <%= cookie1.getValue() %> [<%= cookie1.getDomain() %>] <br>
	<%= cookie2.getName()%> = <%= cookie2.getValue() %> [<%= cookie2.getDomain() %>] <br>
	<%= cookie3.getName()%> = <%= cookie3.getValue() %> [<%= cookie3.getDomain() %>] <br>
	
</body>
</html>