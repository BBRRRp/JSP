<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Map<String, String> member = new HashMap<>();
member.put("id", "sohyang");
member.put("pw", "12345");
member.put("name", "소향");
member.put("addr", "인천 송동...");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" align="center">
		
		<h3>Collection(Map)계열 반복처리</h3>

		<c:set var="data" value="<%=member%>" />
		<c:forEach var="m" items="${ data }">
			${m.key} = ${m.value }<br>
		</c:forEach>
		<hr />

		<h3>Array 계열 반복처리</h3>
		<c:set var="arrays" value="<%=new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }%>"/>
		<c:forEach var="i" items="${arrays}">
			${i},
		</c:forEach>
		<hr />

		<h3>core tag를 이용한 반복처리</h3>
		<c:forEach var="i" items="${arrays}" begin="2" end="4" varStatus="status">
			${status.index} : ${status.count} = [${i}] <br>
		</c:forEach>
		<hr>
		
		<h3>실습: 1~100까지 홀수의 합(begin, end, step)</h3>
		<c:set var="sum" value="0" />
			<c:forEach var="i" begin="1" end="100" step="2">
				<c:set var="sum" value="${ sum + i }" />
			</c:forEach>
		${ sum }
		<hr>

		<h3>실습: 구구단 출력하기</h3>
		<c:forEach var="i" begin="1" end="9">
			<c:forEach var="j" begin="1" end="9"> 
				${ i } * ${ j } = ${ i * j }<br>
			</c:forEach><br>
		</c:forEach>

	</div>

</body>
</html>