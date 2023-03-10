<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--1/4
	2. pageContext 기본객체

  	 1) JSP파일 하나당 하나씩 존재하는 기본객체로서
  	 
  	  a. 기본객체 구하기
  	  b. 속성처리하기
  	  c. 페이지 흐름 제어하기
  	  d. 에러 데이터 구하기
	
	 2) 관련메서드
	 
	  a. getRequest() : request객체 구하기
	  b. getResponse() : response객체 구하기
	  c. getSession() : session객체 구하기
	  d. getServletContext() : application 객체 구하기
	  e. getServletConfig() : config객체 구하기
	  f. getOut() : out객체 구하기
	  g. getPage() : page객체 구하기
	  h. getException() : exception객체 구하기
	  
  -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

</head>
<body>
	<h3><%= request.toString() %> = <%= pageContext.getRequest() %> </h3>
	<h3><%= response %> = <%= pageContext.getResponse() %> </h3>
	<h3><%= session %> = <%= pageContext.getSession() %></h3>	
	<h3><%= out %> = <%= pageContext.getOut() %></h3>	
	
	<hr>
	<%
		HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
	%>
	pageContext.getRequest로 가져온 request객체의 정보 = <%= req.getRemoteAddr() %><br>
	request객체에서 직접 가져온 정보 					   = <%= request.getRemoteAddr() %><br>
	<hr>
	<h3><%= req == request %> </h3>
	
	<% out.print("<h3>out 기본객체에서 직접 출력!</h3>"); %> <br>
	<% pageContext.getOut().print("<h3>pageContext에서 가져온 out기본객체에서 직접 출력!</h3>"); %>
	<h3><%= out == pageContext.getOut() %></h3>
	
</body>
</html>