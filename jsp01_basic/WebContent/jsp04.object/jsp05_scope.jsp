<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- 1/5

 A. JSP의 영역(scope)
	
	웹 애플리케이션은 4가지 영역으로 구분된다.
	
	1. page
	
		하나의 JSP 페이지마다 사용되는 영역이다. page영역은 한번의 클라이언트 요청에 대해서 하나의 JSP페이지를 영역으로 한다. 
		웹브라우저의 요청이 들어오면 JSP페이지를 실행하는데 이때 JSP페이지를 실행하는 범위가 page영역이다. 
		이영역은 pageContext객체의 영역이다. 
		
	2. request
	
		하나의 http 요청을 처리할때 사용되는 영역이다. request영역은 웹브라우저의 요청과 관련이 있다. 
		웹브라우저의 주소창에 url을 입력하거나 링크를 클릭해서 페이지를 이동할때 웹브라우저가 웹서버에 전송하는 요청이
		하나의 request 영역이다.
		
		이 영역은 웹브라우저가 요청할 때마다 새로운 request영역이 생성된다. page영역은 jsp의 한개의 페이지 영역만
		포함되는데 비해 request영역은 하나의 요청을 처리하는데 사용되는 모든 jsp페이지를 포함한다. 
		이 영역은 request객체의 영역이다.
		
	3. session
		
		하나의 웹브라우저와 관련된 영역으로서 session영역은 웹브라우저와 관련된 영역이다.
		세션이 생성되면 하나의 웹브라우저와 관련된 모든 요청은 하나의 session영역에 포함되며 이영역은 session객체의 영역이다.
	
	
	4. application
		
		하나의 웹애플리케이션과 관련된 영역으로 application영역은 웹애플리케이션과 관련된 전체 영역을 의미하고
		application객체가 사용하는 영역이다.

 B. JSP 기본객체의 속성(attribute)
 
 	4개의 기본객체는 각각의 속성을 갖는데 각 기본 객체가 존재하는 동안 기본객체의 속성을 사용할 수가 있다.
 	JSP기본객체 속성은 jsp사이에서 정보를 교환하거나 공유하기 위한 목적으로 사용된다. 
 	속성은 key와 value값의 형태를 갖는데 4개의 기본객체는 서로 다른 이름을 갖는 속성을 여러 개 포함할 수가 있다.
 	
 	JSP기본객체 속성관련 메서드
 	
 	1. setAttribute(String name, Object value) : 각각의 해당영역에 속성값을 저장
 	2. getAttribute(String name) : 각 영역의 속성값을 읽기, 없을 경우 null을 리턴
 	3. removeAttribute(String name) : 각 영역의 속성을 삭제 
 	4. getAttributeNames() : 각 영역의 모든 속성목록을 Enumeration으로 리턴
 							(pageContext 개체는 제외)
	
  -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	out.println("<h3>" + id + "</h3><br>");
	out.println("<h3>" + pw + "</h3><br>");
	out.println("<hr>");

	out.println("<h3>" + application.getAttribute("id") + "</h3><br>");
	out.println("<h3>" + application.getAttribute("pw") + "</h3><br>");
	out.println("<hr>");

	application.setAttribute("id", "sohyang");
	application.setAttribute("pw", "abcde");

	out.println("<h3>" + application.getAttribute("id") + "</h3><br>");
	out.println("<h3>" + application.getAttribute("pw") + "</h3><br>");
	out.println("<hr>");

	application.removeAttribute("id");
	application.removeAttribute("pw");

	out.println("<h3>" + application.getAttribute("id") + "</h3><br>");
	out.println("<h3>" + application.getAttribute("pw") + "</h3><br>");
	out.println("<hr>");
	%>
</body>
</html>