<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jsp:useBean => Member member = new Member(); -->
<jsp:useBean id="member" scope="request" class="com.lec.member.model.Member"/>

<!-- 
	jsp:useBean 액션태그를 이용한 자바객체 사용하기

 	jsp 페이지의 주된 기능은 데이터를 보여주는 것이다. 게시판의 글목록 보기, 글읽기, 회원 정보등의 데이터를 보여줄때 
	jsp에서는 이런 종류의 데이터를 자바빈(DTO 또는 VO개념)과 같은 클래스에 정보를 저장해서 보여주는 것이 일반적이다. 
	
	이런 기능을 제공하기 위해서 jsp 규약은 jsp에서 빈번하게 사용되는 자바빈 객체를 위한 액션태그를 제공하는데 
	이와 같은 액션태그를 사용하면 자바빈 객체를 생성하거나, 빈의 필드(프로퍼티)를 출력 또는 변경할 수가 있다.
	
	jsp에서는 자바빈 객체를 생성할 수 있도록 jsp:useBean 액션태그 및 
	jsp:setProperty, jsp:getProperty액션 태그를 제공한다.
	
	1. jsp:useBean문법
	
		jsp:useBean id ="자바빈이름" class="자바빈의 클래스명" scope="사용범위"
		
		a. id : jsp 페이지에서 자바빈 객체에 접근할 때 사용하는 이름 (즉, 변수명)
		b. class : 패키지 이름을 포함한 자바빈 클래스를 지정 (즉, DTO(VO))
		c. scope : 자바빈 객체를 저장할 영역을 지정, page, session, application 중
				   하나의 값을 지정, 기본값은 page 
-->


<!DOCTYPE html>
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
		member.setId("hong");
		member.setPassword("12345");
		member.setName("홍길동");
	%>
	
<jsp:forward page = "jsp02_member.jsp" />
</body>
</html>
