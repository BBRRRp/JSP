<%@page import="com.lec.cookie.MyCookie"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals(pw)) {
		response.addCookie(MyCookie.createCookie("ADMIN", id, "/", -1));
%>
		<h3>로그인성공!!</h3>
<%
	} else {
%>
		<script>
			alert("로그인에 실패 했습니다!");
			history.go(-1);
		</script>
<%
	}
%>
