<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="en"/>
<fmt:bundle basename="resource.message">
	<fmt:message key="TITLE" var="title"/>
</fmt:bundle>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
  	<title>${title}</title>
</head>
<body>
	<h3>${title}</h3>
	
	<fmt:bundle basename="resource.message">
		<fmt:message key="GREETING"><br>
			<c:if test="${!empty param.id}">
				<fmt:message key="USER">
					<fmt:param value="${param.id}"/>
				</fmt:message>
			</c:if>
		</fmt:message>
	</fmt:bundle>
</body>
</html>