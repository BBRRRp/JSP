<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<title> 1.10 JSTL에서 제공되는 EL 함수들</title>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<body>
	<h3> JSTL에서 제공하는 EL 함수들</h3>
	<c:set var="str1" value="JSTL의 functions태그를 사용하는 방법"/>
	<c:set var="str2" value="사용"/>
	<c:set var="nums" value="1,2,3,4,5,6,7,8,9,10" />
	<ul>
		<li>문자열의 길이 = ${fn:length(str1)}</li>
		<li>대문자 = ${fn:toUpperCase(str1)}</li>
		<li>소문자 = ${fn:toLowerCase(str1)}</li>
		<li>문자열 추출(1) = ${fn:substring(str1, 3, 7)}</li>
		<li>문자열 추출(2) = ${fn:substringAfter(str1, str2)}</li>
		<li>문자열 추출(3) = ${fn:substringBefore(str1, str2)}</li>
		<li>공백자르기 = ${fn:trim(str1)}</li>
		<li>문자열 대체 = ${fn:replace(str1, " ","%")}</li>
		<li>문자열 위치 = ${fn:indexOf(str1, str2)}</li>
		<li>문자열 시작위치 = ${fn:startsWith(str1, str2)}</li>
		<li>문자열 시작위치 = ${fn:startsWith(str1, 'JSTL')}</li>
		<li>문자열 종료위치 = ${fn:endsWith(str1, 'JSTL')}</li>
		<li>문자열 포함여부 = ${fn:contains(str1, 'JSTL')}</li>
		<li>문자열 포함여부 = ${fn:contains(str1, 'jstl')}</li>
		<li>문자열 포함여부 = ${fn:containsIgnoreCase(str1, 'jstl')}</li>
		<c:set var="num" value="${fn:split(nums, ',')}"/>
				${ num }<br>
		<li>문자열 삽입	= ${fn:join(num, '-')}	</li>
		<li>특수 문자처리 = ${fn:escapeXml(str1) }</li>
		
	
	</ul>
	
</body>
</html>