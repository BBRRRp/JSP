<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 선언부 -->
<%! //add(), sub(), mul(), div() 선언
	public int add(int a, int b) {return a+b;}	
	public int sub(int a, int b) {return a-b;}	
	public int mul(int a, int b) {return a*b;}	
	public double div(double a, double b) {return a/b;}	

%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 실습. 계산기 로직  
	<%= add(10,10) %>
	-->
	계산기 
	더하기 : <%= add(20, 10) %> <Br>
	빼기:  <%= sub(20, 10) %><Br>
	곱하기 :<%= mul(20, 10) %><Br>
	나누기:<%= div(20, 10)%>

</body>
</html>