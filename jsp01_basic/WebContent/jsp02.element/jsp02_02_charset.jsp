<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1/3_JSP_기본 문자셋</title>
</head>
<body>
	<!--
	JSP파일의 기본 문자셋은 현재 'UTF-8'로 설정되어 있지만 
	서버에서 응답되는 문자셋은 기본적으로 'ISO-8859-1'으로 설정되어 있기 때문에 
	웹브라우저에서는 한글문자는 깨져서 출력된다. 
	이런 에러를 방지하기 위해서는 문자셋을 일치시켜야 한다. 
	-->

	<h4>현재시간 : <%= new java.util.Date() %></h4>
</body>
</html>