<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<h1>application 객체를 이용해서 파일읽기</h1>
	<h2>application.getResourceAsStream(path) 메서드 이용</h2>
	<%
		char[] buff = new char[128];
		int len = -1;
		String path = "/jsp04_object/jsp01_out.jsp";
		try(InputStreamReader fr = new InputStreamReader(
				application.getResourceAsStream(path),"utf-8")) {
			while((len=fr.read(buff)) != -1) {
				out.println(new String(buff, 0, len));
			}
		} catch(Exception e) {
			out.println("에러 :" + e.getLocalizedMessage());
		}
	%>
</body>
</html>