<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 1/7
	** JSTL(JSP Standard Tag Lib)
	 
	JSP는 스크립트릿과 표현식 등의 스크립트코드와 html 등의 코드를 뒤섞어서 사용하기 때문에
	JSP코드는 가독성이 떨어지고 코딩하기가 매우 복잡해 개발하기가 편하지 않았다.
	JSP는 새로운 tag를 포함한 표준라이브러리 형태로 제공하여 보다 쉽고 가독성을 높여 코딩할 수 있도록 제공하는데
	JSP페이지에서 많이 사용되는 논리적인 판단(if), 반복처리(for), 포맷처리 등을 쉽게 할 수 있도록 표준으로 만들어서
	라이브러리 형태로 제공하는것이 JSTL이다.
	
	jstl-???-???.jar 파일을 다운로드 받아서 WEB-INF\lib에 저장해야 jstl을 사용할 수 있다. 
	https://mvnrepository.com/dptj 'jstl'을 검색 후 최신버전 다운 및 설치
	
	A. JSTL이 제공하는 Tag Library
	
	 라이브러리	           주요 기능 			 	 접두어 		관련 URI
	------------  -------------------------------   --------  ---------------------------------------	
	 	core 		변수지원, 흐름처리, URL처리		  	c     	http://java.sun.com/jsp/jstl/core
		XML         XML코어, 흐름제어, 변환처리   		x 		http://java.sun.com/jsp/jstl/xml
		국제화      지역, 메시지/숫자/날짜형식   	   fmt 		http://java.sun.com/jsp/jstl/fmf
  		DB          SQL,  메시지 형식	 			   sql 		http://java.sun.com/jsp/jstl/sql
  		함수		컬렉션처리, String 처리			   fn      http://java.sun.com/jsp/jstl/fn
  	
  	B. core 태그
  	
   	  기능			태그								설명
  ------------ ---------------   -----------------------------------------------------------------
	변수지원		set            JSP페이지에서 사용할 변수를 선언
					remove         설정변수를 삭제

	흐름제어		if      	   조건에 따라 흐름을 제어
					choose 		   다중조건을 처리
					forEach 	   컬렉션이나 Map의 각 항목을 처리할 때 사용
					forTokens      구분자로 분리된 문자열(토큰)을 처리

	URL처리			import  	   URL에 해당되는 resource를 로딩
					redirect 	   지정된 경로로 redirect를 실행	
					url 		   url을 재작성
					
	기타태그		catch 		   exception처리
					out     	   JspWriter에 내용을 출력
	
	C. 국제화태그
	
	국제화 태그는 특정지역에 따라 알맞는 메시지를 출력해야할때 사용한다.
	예를 들면 한글 브라우저로 접속하면 한글메시지로 출력하고 영문 브라우저로 접속하면 영문메시지로 출력해야할
	경우 국제화 태그를 사용한다.
	
		기능			 태그							설명
	------------    ----------------   ------------------------------------------------------------------				
	  Locale  		  setLocale	  	    지역(Locale)을 설정
	  				requestEncoding    	요청 파라미터의 문자셋의 인코딩을 지정
	  				
	  Message 			bundle			사용할 번들을 지정
	  					message 		지역에 맞는 메시지를 출력	
						setBundle 		리소스 번들을 로딩 후 특정 변수를 저장
						
	  format		formatNumber		숫자형식을 지정	
					formatDate 			날짜형식을 지정
					parseDate 			문자열로 된 날짜를 Date객체로 파싱
					parseNumber 		문자열로 된 숫자를 Number객체로 파싱
					setTimeZone 		시간대 정보를 특정변수에 저장
					timeZone 			시간대를 저장

	1. Locale 지정태그
	
		<fmt.setLocale> : 국제화 태그를 사용할 locale을 지정
		<fmt.requestEncoding> : 요청파라미터의 문자셋의 인코딩을 지정
		
		웹브라우저는 Accept-Language 헤더를 사용하여 수용 가능한 언어 목록을 전송하는데 
		JSTL국제화 태그들은 이 헤더의 값을 이용해서 언어별로 알맞은 처리를 하게 된다.
		예를 들어 메시지를 출력해주는 message태그는 Accept-Language의 값이 'ko'인 경우 한글메시지를 우선적으로 처리하고
		'en'인 경우 영문메시지를 우선적으로 처리한다. 
		
	2. Resource Bundle
		
		메시지 태그에서 사용할 리소스 번들 파일을 작성할때 메시지 번들 파일은 classpath에 위치해야 하기 때문에 
		WEB-INF\classes폴더나 'WEB-INF\lib'에 포함된 jar파일에 포함시켜야 한다. 
		리소스번들 파일은 기본적으로 java.util.Properties클래스를 사용해서 읽어오기 때문에 
		번들파일의 확장자는 .properties이다. 
		
		리소스번들파일에서 중요한 점은 리소스번들파일의 이름을 정해진 규칙에 의거하여 작성해야 한다.
	<!-- 	예를들어 "번들이름_국가.properties"의 형식으로 작성해야 하고 국가코드는 생략할 수 있다. 
	
	3. 메시지 태그
		
		<fmt:bundle> : 태그 body에서 사용할 리소스 번들을 지정
		<fmt:message> : 메시지를 출력
		<fmt:setBundle> : 특정메시지를 사용할 번들을 지정
	
	D. 포매팅태그
		
		a. 숫자출력과 파싱 : <fmt:formatNumber>, <fmt:parseNumber>
		b. 날짜출려과 파싱 : <fmt:formatDate>, <fmt:parseDate>
		c. 시간대 설정 : <fmt:setTimeZone>, <fmt:timeZone>
			
  -->-->
 
<%
	if(true) {
%>
		${ "참입니다!" }<br>
<%
	} else {
%>
		${ "거짓입니다." }<br> 
<%
	}
%>	

<x:if test ="true" >
	${ "참입니다!"}<br>
</x:if>