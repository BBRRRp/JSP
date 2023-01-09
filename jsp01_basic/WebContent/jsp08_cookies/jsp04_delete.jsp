<%@page import="java.net.URLDecoder"%>
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
	<h3>쿠키값 삭제하기</h3>
	
	<%
	Cookie cookie = null;
	Cookie[] cookies = request.getCookies();
	if(cookies!=null && cookies.length>0) {
		for(int i=0;i<cookies.length;i++) {
			if(cookies[i].getName().equals("name")) {
				cookie = new Cookie("name", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
	}
	%>
	name쿠키 값을 삭제했습니다.<br>
	<h3><%= cookie.getName() %> 쿠기의 값 = <%= cookie.getValue() %></h3>
	<h3><%= cookie.getName() %> 쿠기의 값 = <%= URLDecoder.decode(cookie.getValue(), "utf-8") %></h3>
	
</body>
</html>