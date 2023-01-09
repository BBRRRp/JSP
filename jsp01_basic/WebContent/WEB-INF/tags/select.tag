<%@tag body-content="empty" pageEncoding="utf-8"%> 
<%@tag trimDirectiveWhitespaces="true" %>
<%@tag dynamic-attributes="map"%>
<%@attribute name="xxx" required="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<select name="xxx">
	<c:forEach items="${map}" var="option">
		<option value="${option.key}">${option.value}</option>
	</c:forEach>
</select>