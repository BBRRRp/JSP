<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
	<title>1.10 태그파일로 제목태그 출력하기</title>
</head>
<body>
	<h3>태그파일로 제목태그 출력하기</h3>
	<mt:header title="태그파일 : null"/>
	<mt:header title="태그파일 : h1" level="1"/>
	<mt:header title="태그파일 : h2" level="2"/>
	<mt:header title="태그파일 : h3" level="3"/>
	<mt:header title="필수속성" />

</body>
</html>