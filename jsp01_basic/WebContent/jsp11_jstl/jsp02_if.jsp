<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<h4>표현식</h4>
	<%
	
		if(true) {
	%>
			표현식 : 무조건 출력처리
	<%		
		}
	%>
	
	<h4>JSTL</h4>
	<c:if test="true">
		JSTL:무조건 출력처리
	</c:if>
	
	<hr>
	
	<c:if test = "${ param.name == 'hong' }">
		제이름은 홍길동 입니다!!
	</c:if>
	<br>
	<c:if test="${ param.age>18 }">
		제 나이는 ${param.age } 입니다. 성인입니다.
	</c:if>
	
</body>
</html>