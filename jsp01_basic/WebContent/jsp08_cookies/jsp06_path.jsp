<%@page import="java.net.URLEncoder"%>
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
		<h3> 쿠키경로 지정하기</h3>
		<%
			//경로를 path1으로 지정해서 쿠키를 추가
			Cookie cookie1 = new Cookie("path1", URLEncoder.encode("경로:/jsp08_cookies/path1", "utf-8"));
			cookie1.setPath("jsp08_cookies/path1");
			response.addCookie(cookie1);
		
			//경로를 지정하지 않고 쿠키를 추가	
			Cookie cookie2 = new Cookie("path2", URLEncoder.encode("경로:/", "utf-8"));
			response.addCookie(cookie2);
			
			//경로를 root(/)로 지정하고 쿠키를 추가
			Cookie cookie3 = new Cookie("path3", URLEncoder.encode("경로:/jsp08_cookies/path1", "utf-8"));
			cookie3.setPath("/");
			response.addCookie(cookie3);
			
			//경로를 path1으로 지정해서 쿠키를 추가
			Cookie cookie4 = new Cookie("path4", URLEncoder.encode("경로:/jsp08_cookies/path2", "utf-8"));
			cookie4.setPath("jsp08_cookies/path2");
			response.addCookie(cookie4);
		%>

	<%= cookie1.getName() %> = <%= cookie1.getValue() %> [<%= cookie1.getPath() %> ] <br>
	<%= cookie2.getName() %> = <%= cookie2.getValue() %> [<%= cookie2.getPath() %> ] <br>
	<%= cookie3.getName() %> = <%= cookie3.getValue() %> [<%= cookie3.getPath() %> ] <br>
	<%= cookie4.getName() %> = <%= cookie4.getValue() %> [<%= cookie4.getPath() %> ] <br>
</body>
</html>