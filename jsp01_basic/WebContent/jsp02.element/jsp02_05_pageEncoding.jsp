<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8" %>
<!-- 1/3
	 ** JSP 페이지의 인코딩과 pageEncording 속성
	 
	 JSP파일에서 문자셋을 잘못 지정한 경우 응답결과 페이지의 문자들이 깨져서 출력된다.
	 tomcat과 같은 컨테이너(웹서버)는 JSP를 분석하는 과정(*.java 파일생성/ 클래스 파일을 만드는과정)에서 
	 어떤 인코딩을 이용해서 코드를 작성했는지를 검사하고 그 결과를 선택한 캐릭터셋을 이용해서 JSP페이지의 문자를 
	 읽어오게 된다. 웹컨테이너가 JSP페이지를 읽을 때 사용할 문자셋을 결정하는과정은 아래와 같다.
	 
	 1. 파일이 BOM으로 시작하지 않을 경우
	 	
	 	a. 기본 인코딩을 이용해서 파일을 처음부터 읽고 page디렉티브의 pageEncoding 속성을 검색
	 	b. pageEncoding 값을 가지고 있을 경우에는, 파일을 읽을때 해당 속성값을 문자셋으로 사용 
	 	c. pageEncoding 값을 가지고 있지 않을 경우 contentType의 charset 속성 값을 사용
	 	d. 상기 모두 해당하지 않았을 경우에는 'ISO-8859-1' 문자셋을 사용
	 	
	 2. 파일이 BOM으로 시작할 경우(63쪽)
	 
	 	a. BOM을 이용해서 결정된 인코딩을 이용해서 파일을 읽고 page 디렉티브의 pageEncoding속성을 검색
	 	b. 만약, pageEncoding속성 값과 BOM을 이용해서 결정된 인코디잉 다를 경우에는 에러가 발생
	 
	 3. 1 or 2번 과정을 통해서 결정된 문자셋으로 JSP소스코드를 읽는다.


  -->
	현재시간 : <%= new java.util.Date() %>

