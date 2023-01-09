<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.lec.el.StaticMethod" %>
<!--1/7  -->
<%
	request.setAttribute("price", 12345l);
%>
<h3> 정적 메서드 호출하기</h3>
가격은 <b>${StaticMethod.staticMethod(price, "#,##0")} </b>원 입니다.
