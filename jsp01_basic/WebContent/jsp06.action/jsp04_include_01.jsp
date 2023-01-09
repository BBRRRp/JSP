<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 1/5 jsp include 액션태그 -1

	include 디렉티브를 통해 다른 jsp 파일에서 데이터를 읽어올 수 있다. 
	이 경우 일반 JSP파일과 구분하기 위해 통상적으로 확장자를 'jspf'로 사용한다.
	파일 확장자를 .jsp로도 사용할 수 있지만 jspf는 jsp Fragment
	즉, jsp파일의 소스코드조각을 의미한다.

	페이지 디렉티브에서 컨텐츠타입을 지정하고 있는데 
	이 것을 포함하는 파일일지라도 컨텐츠 타입에 알맞게 지정해야만 올바른 결과를 출력할 수 있다.
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
	<%! int number = 1000; %>
	<%@ include file="jsp04_include_01.jspf" %>
	<h3>jsp04_include_01.jsp의 변수 값 = <%= number %></h3>
	<h3>jsp04_include_01.jspf에서 가져온 변수 값 = <%= user_name %></h3>

</body>
</html>