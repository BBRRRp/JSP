<%@page import="java.net.URLDecoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 1/6  -->
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
	<h1> 쿠키목록</h1>

 <%
 	Cookie[] cookies = request.getCookies();
 	
 	if(cookies!=null && cookies.length>0) {
 		for(int i =0; i<cookies.length;i++) {
 %>
 			<%= cookies[i].getName()%> = <%= URLDecoder.decode(cookies[i].getValue(), "utf-8") %> <br>
 <%
 		}
 	} else {
 %>
 		<p class="danger"> 쿠키가 존재하지 않습니다.</p>
 <% 
	} 
 %>
</body>
</html>