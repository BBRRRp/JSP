<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<!-- 1/5   -->
</head>
<body>

<!-- getAttributeNames()  -->

	<h1>application객체의 attribute</h1>
	<%
		Enumeration<String> app = application.getAttributeNames();
		while(app.hasMoreElements()) {
			String name = app.nextElement();
			Object value = application.getAttribute(name);
	%>
			
			<h4> application객체의 속성 : <%= name %> = <%= value %></h4>
			
	<%
		}
	%>
	<hr>
	<h1>session객체의 attribute</h1>
	<%
		Enumeration<String> sess = session.getAttributeNames();
		while(sess.hasMoreElements()) {
			String name = sess.nextElement();
			Object value = session.getAttribute(name);
	%>
			
			<h4> session객체의 속성 : <%= name %> = <%= value %> </h4>
	<%
		}
	%>
	<hr>
	<h1>request객체의 attribute</h1>
	<%
		Enumeration<String> req = request.getAttributeNames();
		while(req.hasMoreElements()) {
			String name = req.nextElement();
			Object value = request.getAttribute(name);
	%>
			
			<h4> request객체의 속성 : <%= name %> = <%= value %></h4>
	<%
		}
	
	%>
</body>
</html>