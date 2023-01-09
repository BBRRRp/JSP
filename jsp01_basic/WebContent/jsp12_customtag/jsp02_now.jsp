<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html> 
<html>
<head>
 <title> 1.10 now.tag </title>
</head>
<body>
	<c:set var="now" value="<%= new java.util.Date() %>"/>
	 오늘은 <b>[ ${ now } ]</b>일 입니다.
	 
	 <h3>커스텀 태그: 현재 시간</h3>
	 오늘은 <b>[ <mt:now/> ]</b>일 입니다.
</body>
</html>