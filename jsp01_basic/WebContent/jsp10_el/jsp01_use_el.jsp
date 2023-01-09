<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 1/7

	** 표현언어(Expression Language, EL)
	
	표현언어는 다른 형태의 스크립트 언어로서 스크립트 요소 중의 하나이다. 
	표현언어는 표현식보다 간결하고 코딩하기 편하기 때문에 많이 사용한다.
	
	EL은 JSTL(JSP Standard Tag Library)규약에 나오는 내용으로서 JSP2.0부터 EL이 JSP에 포함되었고
	EL은 값을 표현하는데 사용하는 언어로서 JSP의 스크립트 요소를 보완하는 역할을 한다. 
	
	** EL 제공하는 기능
	
	1. JPS 4가지 기본객체(application, session, request, page)가 제공하는 영역의 속성
	2. 수치연산, 관계연산, 논리연산자를 제공
	3. JAVA클래스의  method호출 가능
	4. cookie, 기본객체의 속성 등 JSP를 위한 표현언어의 기본객체를 제공
	5. 람다식을 사용한 함수의 정의와 실행(EL 3.0)
	6. Stream API를 통한 컬렉션
	7. 정적 메서드 실행가능(EL 3.0)
	
	A. EL의 구성
	
		EL은 ${ expression }의 형태로 사용할 수 있다. EL은 JSP의 스크립트 요소(스크립트릿, 표현식, 선언부)를 제외한
		나머지 부분에서 사용할 수 있다. JSP 2.1버전부터는 $ {expr}형식과 # {expr}형식의 구문을 지원하고 있는데
		차이점은 EL의 값을 언제 생성하느냐에 차이가 있다. $ {expr}은 구문을 분석할때 곧바로 값을 계산하지만 # {expr}은
		실제로 값이 사용될 때 계산이 된다. 
	
	B. EL의 데이터 타입
		
		1. Boolean : 논리타입
		2. 정수 : EL에서 사용되는 정수타입은 java.lang.long타입이다.
		3. 실수 : EL에서 사용되는 실수타입은 java.lang.Double타입이다.
		4. 문자열 : EL에서 문자열은 대부분 사용할 수 있지만 작은 따옴표, 큰 따옴표, \ 문자들은 이스케이프문자로 사용
		5. null
	
	C. EL의 기본객체
	
		1. pageContext: JSP의 page 내장객체와 동일
		2. pageScope : pageContext객체에 저장된 속성의 Map<속성, 값> 객체
		3. requestScope: request 객체에 저장된 속성의 Map<속성, 값> 객체
		4. sessionScope: session 객체에 저장된 속성의 Map<속성, 값> 객체
		5. applicationScope : application 객체에 저장된 속성의 Map<속성, 값> 객체
		6. param : request.getParameter()와 동일, 요청 파라미터의 Map<속성, 값> 객체
		7. paramValues : request.getParameterValues()와 동일, 요청 파라미터의 Map<속성, 값> 객체
		8. header : request.getHeader()와 동일, 요청 파라미터의 Map<속성, 값> 객체
		9. headerValues : request.getHeaderValues()와 동일, 요청 파라미터의 Map<속성, 값> 객체
	   10. cookie : <cookie이름, cookie>의 객체, request.getCookies()메서드와 동일
	   11. initParam : 초기화 파라미터<이름, 값>의 Map객체, application.getInitParameter()와 동일
		
	D. 객체의 사용
	
		EL언어는 객체에 저장된 값에 접근할때 dot연산자(.) of 대괄호[]를 사용한다. <표현>.<표현> 또는 
		<표현>[표현]형식으로 접근하는데 접근과정은 아래와 같은 순서로 변환된다.
		
		1. <표현>을 <값>의 형태로 변환
		2. <값1>이 null일 경우 null값을 리턴
		3. <값>이 null이 아닐 경우 <표현2>의 <값2>를 반환
		4. <값2>이 Map, List, Array일 경우 
		
			a. Map일 경우 : <값1>.containsKey(<값>)이 false면 null을 리턴하고 true일 경우 <값1>.get(<값2>)
			b. List, Array일 경우 : <값2>가 정수값인지 여부를 검사(정수가 아니면 에러발생)후 <값1>.get(<값2>)
				또는 Arrays.get(<값1>, <값2>)의 결과를 리턴
		
		5. <값1>이 다른 객체일 경우 <값2>를 문자열로 리턴
		 
	E. EL 연산자
	
		1. 수치연산자 : +, -, *, /, %
		
			Java와 차이점
			$ { "10" + 1 }의 결과는 11 (자바는 101)
		<!-- 	$ { "일" + 1 }의 결과는 에러발생(자바는 일1) -->
			${ null +1 }의 결과는 1(자바는 에러발생)
		
		2. 비교연산자 : ==, !=, <, >, <=, >=
		3. 논리연산자 : &&, ||, !
		<!-- 4. empty연산자 : empty < 값 >의 형태로 사용 -->
		5. 삼항연산자 : 수식 ? true : false
		6. 세미콜론 : (;)
			
			${ 1+1; 10+10}의 결과는 20만 출력 즉, ${ A; B}의 결과는 최종 결과 B만 출력
			${ var = 10}의 결과는 10이 출력.
	
-->

<%
	request.setAttribute("name", "소향");
%>
<!-- 1/6  -->
<h2>표현식</h2>
<h3> request의 name : <%= request.getAttribute("name") %></h3>
<h3>이름: ${ request.getAttribute("name") } 값을 가져오지 못함(EL안에는 request객체를 사용하지 못함)</h3>
<h3> request의 param(addr) : <%= request.getParameter("addr") %></h3>
<hr>

<h2>표현언어(EL)</h2>
<!--  <% //<h3>이름: $ {requestScope.name} -> 표현 언어(Expression Language, EL) </h3>%> -->
<h3>request URI = ${ pageContext.request.requestURI }</h3> <br>
