<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 1/10 -->
<!DOCTYPE html>
<html>
<head>
	<title>1.10 formatNumber, dateFormat, timeZone 태그/</title>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<body>
	<h3>formatNumber 태그</h3>
		<c:set var="price" value="1000"/>
		<fmt:formatNumber value="${ price }" type="number"/><br>
		price : <fmt:formatNumber value="${ price }" type="number" var="nnn"/><br>
		value : ${ nnn }<br>
		<fmt:formatNumber value="${ price }" type="currency" currencySymbol="$"/><br>
		<fmt:formatNumber value="${ price }" type="currency" currencySymbol="$" groupingUsed="true"/><br>
		<fmt:formatNumber value="${ price }" type="currency" pattern="0000000.000"/><br>
				
	<h3>dateFormat 태그</h3>
	<c:set var="now" value="<%= new java.util.Date() %>"></c:set>
	${ now }<br>
	<fmt:formatDate value="${ now }"/><br>
	<fmt:formatDate value="${ now }" type="date"/><br>
	<fmt:formatDate value="${ now }" type="date" dateStyle="full"/><br>	
	<fmt:formatDate value="${ now }" type="date" dateStyle="short"/><br>
	<fmt:formatDate value="${ now }" type="time"/><br>	
	<fmt:formatDate value="${ now }" type="both"/><br>	
	<fmt:formatDate value="${ now }" type="both" dateStyle="full" timeStyle="full"/><br>	
	<fmt:formatDate value="${ now }" pattern="a hh:mm:ss"/><br>
	<fmt:formatDate value="${ now }" pattern="z a hh:mm:ss"/><br>
	
	<h3>timeZone 태그</h3>
	<fmt:timeZone value="HongKong">
		<fmt:formatDate value="${ now }" type="date" dateStyle="full"/><br>	
		<fmt:formatDate value="${ now }" pattern="z a hh:mm:ss"/><br>
	</fmt:timeZone>
	
	<h3>timeZone 목록</h3>
	<ul>
		<c:forEach var="tz" items="<%= java.util.TimeZone.getAvailableIDs() %>">
			<li>${ tz }</li>
		</c:forEach>
	</ul>

</body>
</html>