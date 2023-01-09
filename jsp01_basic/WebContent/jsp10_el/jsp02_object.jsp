<%@page import="com.lec.el.온도계"%>\
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--1/7  -->
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
	<% 온도계 thermometer = new 온도계(); 
		request.setAttribute("t", thermometer);
	%>
	
	<h3>온도변환기(V 1.0)</h3>
		${t.getInfo()}<br>
		${t.setCelsius("서울", -2)}<br> 
		${t.getCelsius("서울")}<br> 
		서울의 화씨온도 = ${ t.getFahrenheit("서울")}


</body>
</html>