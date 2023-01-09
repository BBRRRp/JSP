<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1/3_ JSP 페이지의 구성요소</title>
</head>
<body>
<!--  1/3
	** JSP 페이지의 구성요소
	
	1. 디렉티브(Directive)
		디렉티브는 JSP에 대한 설정 정보를 저장할 때 사용한다.
		선언방법은 "<@ 디렉티브이름 속성 = "값" ... 속성= "값" %>의 형태로 선언한다.
		JSP가 제공하는 디렉티브는
		
		a. page : JSP페이지에 대한 정보를 제공. jsp가 생성하는 문서타입, 버퍼크기, 에러페이지 등
				  JSP페이지에서 필요한 기본정보를 제공
		b. taglib : JSP에서 사용될 tag라이브러리를 지정
		c. include : JSP페이지의 특정영역으로 다른 JSP페이지를 로딩
					(예: 헤더, 푸터 처럼 고정적인 페이지를 공통으로 사용되는 페이지를 로딩)

	2. 스크립트(Script) 
	
		JSP에서 jsp파일을 동적으로 생성하기 위해 사용되는 것으로, 스크립트 요소를 사용하면 사용자가 
		JSP페이지에 입력한 정보를 DB에 저장할 수도 있고, DB에서 데이터를 읽어서 출력할 수도 있다. 
		
		스크립트를 자바가 제공하는 다양한 기능들을 사용할 수 있다. 
		JSP를 스크립트 언사용하면어라고 부르는데, 그 이유가 이러한 스크립트 코드를 제공하기 때문이다.
		 
		JSP의 스크립트 요소는 
		a. 표현식 < %= %> : 지정된 변수나 메서드의 결과값을 출력한다. 
		b. 스크립트릿< % %>: 자바 코드를 실행한다.
		c. 선언부 < %! %> : 자바의 변수나 메서드를 선언한다.
	
	3. 기본객체(Implicit Object)
		
		JSP는 웹애플리케이션 프로그래밍을 하는데 필요한 기능을 제공해주는 기본 객체를 제공한다.
		이 기본 객체는 application, session, page, request, response 등 기본으로 제공되는 객체를 말한다.
		이러한 객체들은 각각의 객체마다 고유한 속성 또는 기능을 제공하는데 요청된 파라미터를 읽기응답 결과를 설정하기,
		세션정보의 처리 등 웹애플리케이션에서 필요한 기능을 제공한다.
	
		a. request : 웹브라우저가 웹서버에 요청하는 정보를 전달
		b. response : 웹서버에 요청된 결과를 응답하는 정보를 전달
		c. out : DOM을 출력
		d. session/application/page
		
	4. 표현언어(Expression Language, EL)
	5. 정적인 데이터
	6. 표준액션태그(Action Tag)
	7. 커스텀태크(Custom Tag)
	8. 표준라이브러리(JSTL)
	
  -->

</body>
</html>