<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  1/7

	url관련태그는 url생성기능과 redirect 처리기능을 제공한다.

-->
<!-- https://search.daum.net/search?w=tot&q=%EC%BD%94%EB%A1%9C%EB%82%98 -->
<c:url value="https://search.daum.net/search" var="searchURL">
	<c:param name="w" value="news"></c:param>
	<c:param name="q" value="코로나"/>
</c:url>

<ul>
	<li><a href="${ searchURL }">다음사이트검색(코로나)</a></li>
	<li><c:url value="jsp02_if.jsp"></c:url></li>
	<li><c:url value="./jsp02_if.jsp"></c:url></li>
	
</ul>
<c:redirect url="http://www.google.com"></c:redirect>