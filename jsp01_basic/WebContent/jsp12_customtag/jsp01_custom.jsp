<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 1/10 
** 커스텀 태그(Custom Tag)

프로그램을 개발하다보면 JSP액션태그나 JSTL태그만으로 부족할 때가 있는데
이를 지원하기 위해서 새로운 태그를 만들어 사용할 수 있도록 하는 기능을 제공한다. 
사용자가 원하는 목적에 맞게 작성한 태그를 '커스텀 태그'라고 한다. 
	
1. 커스텀 태그의 장점
		
	a. 재사용 : 한번 작성한 커스텀태그는 어떤 JSP컨테이너에서도 사용이 가능하다.
	b. 쉽고 단순한 JSP코드 생성 : 자바코드에 익숙하지 않은 개발자들도 커스텀태그를 사용하면
							 		보다 쉽게 JSP페이지를 작성할 수 있다.
	c. 코드의 가독성 향상 : 커스텀 태그를 사용하면 스크립트 코드를 줄일 수 있기 때문에 JSP페이지의 
							가독성을 높일 수 있다. 				
						
2. 태그파일에서 사용가능한 디렉티브

	a. tag : jsp페이지의 page디렉티브와 동일
	b. taglib: tag파일에서 사용할 tag라이브러리를 정의
	c. include: tag파일에 외부파일을 포함시킬 때 사용
	d. attribute : tag파일을 커스텀태그로 사용할 때 입력받을 속성을 명시
	e. variable : EL변수로 사용할 변수에 대한 정보를 정의
	
3. 태그디렉티브의 속성
	
	a. display-name: tag파일이 사용될 이름을 지정. 기본값을 확장자(.tag)를 제외한 나머지 파일이름
	b. body-content : body 내용의 종류를 정의 empty, tagdependent, scriptless의 세가지 값을 사용할 수 있는데
						기본값은 scriptless
	c. dynamic-attribute : 동적속성을 정의. 속성<key, value>를 저장하는 Map객체를 page범위의 속성에 저장할때 사용할 이름을 정의
	d. description: tag에 대한 설명
	e. import : page디렉티브의 import와 동일
	f. pageEncoding : page디렉티브의 pageEncoding과 동일
	g. isElIgnored: page디렉티브의 isElIgnored 속성과 동일
	h. defferedSyntaxAllowedLiteral : page 디렉티브의 속성과 동일. 
									이 속성의 값이 true일 경우에 ${expr} or ${expr}형식의 값은 문자열로 처리하는 옵션
	i. trimDirectiveWhitespaces: page디렉티브의 속성과 동일
	
4. 태그파일에서 사용가능한 기본(내장)객체

	a. jspContext : JSP페이지의 pageContext가 제공하는 메서드를 그대로 제공, 각 속성과 관련된작업을 처리
	b. request : JSP페이지의 request객체와 동일
	c. response : JSP페이지의 response 객체와 동일
	d. session : JSP페이지 session객체와 동일
	e. application : JSP페이지 application객체와 동일
	f. out : JSP페이지의 out객체와 동일

5. 태그파일의 위치는 WEB-INF/tags 폴더나 그 하위 폴더에 위치한다. 이 폴더에 위치한 파일 중에서
		~.tag, ~.tagx라는 확장자를 가진 파일만 태그파일로 인식한다.
		
		
		
-->