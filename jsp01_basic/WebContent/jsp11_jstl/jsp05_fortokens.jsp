<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>forTokens - 콤마, 점등을 구분자로 사용</h3>
<c:set var="data" value="빨,주.노|초,파.남|보"/>

${data}

<hr />

<c:forTokens var="raindbow_color" items="${data}" delims=",">
	${ raindbow_color }<br>
</c:forTokens>

<hr>
<c:forTokens var="raindbow_color" items="${data}" delims=",.|">
	${ raindbow_color }<br>
</c:forTokens>
	