<%@page import="com.lec.cookie.MyCookie"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	response.addCookie(MyCookie.createCookie("ADMIN", "", "/", 0));
%>
<h4>로그아웃이 되었습니다!!</h4>