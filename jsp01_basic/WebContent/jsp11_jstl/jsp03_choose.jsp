<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<!-- ?id=hong&age>18  -->
	<ul>
		<c:choose>
			<c:when test= "${param.id =='hong' }">
				<li>당신의 사용자 ID는 <b>${param.id}</b>입니다. </li>
			</c:when>
			<c:when test="${ param.age>18 }">
				<li>당신은 <b>성인</b> 입니다.</li>
			</c:when>
			
			<c:otherwise>
				<li>당신의 아이디 또는 나이에 대한 정보를 찾지 못했습니다.</li>
			</c:otherwise>			
		</c:choose>
	</ul>
</body>
</html>