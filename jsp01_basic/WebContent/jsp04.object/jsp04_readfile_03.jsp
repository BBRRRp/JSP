<%@page import="java.net.URL"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
		<h1>application객체의 URL정보를 이용해서 파일읽기</h1>
		<h2>url.openStream() 메서드 이용</h2>
	<%
		char[] buff = new char[128];
		int len = -1;
		String path = "/jsp04_object/jsp01_out.jsp";
		
		URL url = application.getResource(path);
		
		try(InputStreamReader fr = new InputStreamReader(
				url.openStream(),"utf-8")) {
			while((len=fr.read(buff))!= -1) {
				out.println(new String(buff, 0, len));
			}
		} catch(Exception e) {
			out.println("에러 :" + e.getLocalizedMessage());
		}
		
	%>
</body>
</html>