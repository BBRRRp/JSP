<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 1/7
	c:catch var="exName"의 형태로 exception이 발생하면 해당 익셉션객체를 exName에 저장하는 태그이다.
	그 이후에 exName객체가 있을 경우에는 익셉션 처리를 할수가 있다.

 -->

 <h3> c:catch</h3>
 <c:catch var= "e">
 	name 파라미터의 값 = <%= request.getParameter("name") %><br>
 	<%
 		if(request.getParameter("name").equals("hong")) {
	%> 
 			$(param.name)은 honggildong입니다.!
 	<%		
 		}
 	%>
 	
 </c:catch>
 <c:if test= "${e !=null }">
 		에러가 발생했습니다.<br>
 		${e}
 </c:if>