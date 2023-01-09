<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<h1>파일의 절대경로를 이용해서 파일읽기</h1>
	<%
		//java.io or java.nio패키지
		char[] buff = new char[128];
		int len = -1;
		String path = "D:/PBR/05.JSP/jsp01_basic/WebContent/jsp04_object/jsp01_out.jsp";
		try(InputStreamReader fr = new InputStreamReader( new FileInputStream(path), "utf-8")) {
			while((len=fr.read(buff))!=-1) {
				out.println(new String(buff, 0, len));
			}
		} catch(Exception e) {
			out.println("에러 : " + e.getLocalizedMessage());
		}
	%>
</body>
</html>