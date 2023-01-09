<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page buffer="none" autoFlush="true" %>
<!DOCTYPE html>
<!-- 1/4
	
A. JSP 처리과정(p.99 참고)
		
	1. JSP에 서블릿이 없는 경우
	
		a. index.jsp 파일로부터 자바코드파일(Servlet)을 생성(Index_jsp.java)
		b. Index_jsp.java파일을 컴파일해서 서블릿클래스 파일을 생성(Index_jsp.class)
		c. 서블릿에 웹브라우저의 요청을 전송(클라이언트의 request(파라미터값 포함)를 전송) 
		d. 서블릿의 처리결과를 웹서버에서 클라이언트에게 응답(response)결과를 생성
		e. response객체를 클라이언트(웹브라우저)에 전달
			
	2. JSP에 서블릿이 있는 경우(※ 서블릿이 있다. = 코드타입이 있다)
		
		a. 서블릿에 웹브라우저의 요청을 전송(클라이언트의 request(파라미터값 포함)를 전송) 
		b. 서블릿의 처리결과를 웹서버에서 클라이언트에게 응답(response)결과를 생성
		c. response객체를 클라이언트(웹브라우저)에 전달		
		
B. 출력버퍼와 응답
	
	JSP페이지는 응답결과를 곧바로 웹브라우저에 전송하는 것이 아니라 일단 버퍼(Buffer)에 임시로 저장해두었다가
	버퍼가 꽉 차면 한번에 웹브라우저로 전송한다.
	 
	이렇게 버퍼를 이용하는 장점은		
		a. 데이터의 전송성능의 향상
		b. JSP실행도중에 buffer를 비우고 새로운 내용 저장가능
		c. buffer가 다 차기 전까지 응답헤더정보 변경 가능 
	
C. 플러쉬(Flush)

	버퍼가 다 차있을 때 버퍼에 쌓인 데이터를 실제로 전송해야 하는데
	flush란 buffer에 데이터가 다 차지 않았을 경우 데이터를 전송한 후에 버퍼를 비우는 것을 말한다.
	
	JSP에서 page디렉티브에 autoFlush속성이 있다. 이 속성이 true이면 버퍼가 다 차있을 경우
	버퍼의 데이터를 전송하고 flush를 하고 버퍼가 다 찼을 경우 exception을 발생시키고 작업을 중단시킨다.
	
	autoFlush속성 이외에 buffer속성에는 사용할 buffer의 크기를 지정할 수 있다. 만약, 속성을 none으로 
	지정한다면 JSP가 출력하는 내용을 즉시 웹브라우저에 전송하기 때문에 제약사항이 있다. 

	제약사항
	
	a. < jsp:forward>기능을 사용할 수 없다. 
	
  -->

<html>
<head>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<body>
<%
	for(int i = 0; i<1000; i++) {
%>
	1234567890
<%		
	}
%>
</body>
</html>