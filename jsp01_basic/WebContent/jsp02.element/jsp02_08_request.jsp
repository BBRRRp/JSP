<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 22/ 1/ 3 

	** request 기본객체
	
	request 기본객체는 JSP 페이지에서 가장 많이 사용되는 기본객체요소로 웹브라우저의 요청과 관련이 있다. 
	웹브라우저에서 웹사이트의 주소를 입력하면 웹브라우저는 해당주소의 웹서버에 연결한 후 요청정보를 전송하는데,
	이 요청 정보를 웹 서버에 제공하는 객체가 request 기본 객체이다.

	A. request 객체가 제공하는 기능
	
		1. 클라이언트 관련(웹브라우저 ~> 크롬, 익스플로러인지 정보)
		2. 서버와 관련된 정보
		3. 클라이언트가 전송한 요청파라미터 정보
		ex) http://ddddd/com?name=홍길동&age=1000
		4. 클라이언트가 전송한 요청헤더 정보
		5. 클라이언트가 전송한 쿠키정보
		6. 속성처리정보
		
	B. request 객체의 메서드

		1. getRemoteAddr() : 웹서버에 연결한 클라이언트의 IP주소
		2. getContentLength() : 클라이언트가 요청한 정보의 총 길이
		3. getCharacterEncoding() : 클라이언트가 요청정보를 전송할 때 사용한 문자셋 정보
		4. getContentType() : 클라이언트가 요청정보를 전송할 때 사용한 컨텐츠(문서)타입정보
		5. getProtocol() : 클라이언트가 요청한 프로토콜
		6. getMethod() : 웹브라우저가 정보를 전송할때 사용한 방식(get 또는 post)
		7. getRequestURI() : 웹브라우저가 요청한 URL 정보
		8. getContextPath() : JSP페이지가 소속된 웹애플리케이션의 context정보
		9. getServerName() : 연결할 때 사용한 웹서버의 이름
		10. getServerPort() : 연결할 때 사용한 웹서버의 포트번호
		
	C. request 객체의 요청 파라미터 관련 메서드
	
		1. getParameter(String name) : name(이름)인 파라미터의 값을 리턴, 없으면 null
		2. getParameterValues(String name): name(이름)인 모든 파라미터의 값을 배열로 리턴, 없으면 null
		3. getParameterNames() : 웹브라우저가 전송한 파라미터의 이름목록을 리턴
		4. getParameterMap() : 웹브라우저가 전송한 파라미터를 Map타입으로 리턴
			
	D. request 겍체의 요청 헤더정보 관련 메서드	
		
		1. getHeader(String name) : 지정한 name의 헤더의 값을 리턴
		2. getHeaders(String name) : 지정한 name의 헤더목록을 리턴
		3. getHeaderName(String name): 모든 헤더 이름을 리턴
		4. getIntHeader(String name): 지정한 헤더의 값을 정수값으로 리턴
		5. getDateHeader(String name): 지정한 헤더의 값을 시간값으로 리턴
	
  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1/3_request</title>
</head>
<body>
	<h1>B. request 객체의 메서드</h1>
	
	<h3>1. 클라이언트 IP 주소 : <%= request.getRemoteAddr() %></h3>
	<h3>2. 요청정보의 길이 : <%= request.getRemoteAddr() %></h3>
	<h3>3. 요청정보의 인코딩: <%= request.getCharacterEncoding() %></h3>
	<h3>4. 요청정보의 컨텐츠 타입: <%= request.getContentType() %></h3>
	<h3>5. 요청정보의 프로토콜: <%= request.getProtocol() %></h3>
	<h3>6. 요청정보의 전송방식: <%= request.getMethod() %></h3>
	<h3>7. 요청정보의 URI: <%= request.getRequestURI()%></h3>
	<h3>8. 요청정보의 컨텍스트 경로: <%= request.getContextPath() %></h3>
	<h3>9. 요청정보의 서버이름: <%= request.getServerName() %></h3>
	<h3>10. 요청정보의 서버포트: <%= request.getServerPort() %></h3>
	
</body>
</html>


























