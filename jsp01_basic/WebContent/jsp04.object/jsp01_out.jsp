<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 1/4 
	
	** JSP에서 사용하는 기본객체와 영역(Scope)
	
	A. 기본객체
	
		1. request(javax.servelet.http.HttpServletRequet) : 클라이 언트의 요청정보를 저장
		2. response(javax.servlet.http.HttpServletResponse) : 웹서버의 응답정보를 저장
		3. out(javax.servlet.jsp.JspWriter) : JSP페이지의 생성결과를 출력할때 사용하는 출력스트림
		4. pageContext(javax.servlet.jsp.PageContext) : JSP페이지에 대한 정보를 저장
		5. session(javax.servlet.http.HttpSession) : Http 세션 정보 저장
		6. application(javax.servlet.http.HttpSession) : 웹애플리케이션에 대한 정보 저장
		7. page(java.lang.Object) : JSP페이지를 구현한 자바클래스의 인스턴스(객체)
		8. config(javax.servlet.ServletConfig) : JSP페이지에 대한 설정 정보를 저장
		9. exception(java.lang.Throwable) : Exception객체, 에러페이지라고 정의된 페이지에서만 사용가능
		
-->
<!--
	 1. out 기본객체
	 
		 out객체는 웹브라우저에 데이터를 전송하는 출력스트림으로서 JSP가 생성한 데이터를 웹페이지에 출력한다.
	 
	 A. out객체의 출력메서드는
	 
	 	a. print() : 데이터를 출력
	 	b. println() : 데이터를 출력하고 줄바꿈 문자(\r\n 또는 \n)을 출력
	 	c. newlLine() : 줄바꿈 문자(r\n or \n)를 출력
	 
	 B. out객체의 buffer관련 메서드
	 
	 	a. getBufferSize() : 버퍼의 크기를 리턴
	 	b. getRemaining() : 버퍼에 남은 용량을 리턴
	 	c. clear() : 버퍼 전체를 비움, 이미 flush가 되어 있다면 exception발생
	 	d. clearBuffer(): 버퍼 전체를 비움, 이미 flush가 되어 있다면 exception발생하지 않음
	 	e. flush() : 버퍼를 flush
	 	f. isAutoFlush() : 자동 flush여부를 boolean으로 리턴
	 
  -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
		<% System.out.println("<h1>안녕하세요!</h1>"); %>
		<% out.print("<h1>안녕하세요?</h1>"); %>
		<% out.print("<h1>반갑습니다.</h1>"); %>
		<hr>
		
		<h3>out 기본객체의 buffer 관련 메서드</h3>
		<h4>buffer의 크기 = <%= out.getBufferSize() %></h4>
		<h4>buffer의 잔량 = <%= out.getRemaining() %></h4>
		<h4>AutoFlush여부 = <%= out.isAutoFlush() %></h4>
		
</body>
</html>