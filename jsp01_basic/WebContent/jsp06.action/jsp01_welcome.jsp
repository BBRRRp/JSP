<%@ page import="java.util.Date" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 1/5 -->

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
		<%@include file="jsp01_menu.jsp" %>
	
		<%! 
			String greeting = "저희 회사에 방문해 주신 것을 환영합니다.";
		%>
		
		<div class="jumborton">
			<div class="container">
			 		<h3 class="display-3">
			 			<%= greeting %>
			 		</h3>
			</div>
		</div>
		
		<div class="container">
			<div class="text-center">
				<h3><%= greeting %></h3>
			<%
				Date day = new Date();
				String am_pm;
					int hour = day.getHours();
					int minute = day.getMinutes();
					int second = day.getSeconds();
				
					if(hour/12==0) { am_pm = "AM"; } else { am_pm = "PM"; hour = hour - 12; }
					String CT = hour + ":" + minute + ":" + second;
					out.println("현재접속시간 : " + CT + "\n");
			%>
			</div>
			<hr>
		</div>
		
	<%@ include file="jsp01_footer.jsp" %>
</body>
</html>