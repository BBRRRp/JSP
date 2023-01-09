<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page buffer="1kb" %>
<%@ page errorPage="/jsp05.error/error/viewError.jsp" %>
<!--1/5  -->
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
	<!-- IE에서 에러페이지가 512kb보다 작으면 에러페이지는 출력되지 않고 
			자체적으로 제공하는 http 오류메시지 페이지가 출력된다. -->
	<% 
		for(int i =0; i <100; i++) {
			out.println(i);
		}
	%>
	
	<%= 1/0 %>
</body>
</html>