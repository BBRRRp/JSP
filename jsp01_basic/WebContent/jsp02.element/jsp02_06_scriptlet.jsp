<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp02_06_scriptlet</title>
</head>
<body>
		<!-- 1.표현식  -->
 		1~10까지의 합 = <%= 1+2+3+4+5+6+7+8+9+10 %>
 		<br>

		<!-- 2. scriptlet -->
 		<%
 			int sum = 0;
 			for(int i =1; i<=10;i++) {
 				sum += i;
 			}
 		%>
 		1~10까지의 합 = <%= sum %> 		
</body>
</html>