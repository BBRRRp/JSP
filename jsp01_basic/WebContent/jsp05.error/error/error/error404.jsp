<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!-- isErrorPage = "true"로 지정된 페이지는 exception 내장객체를 사용할 수 있다.-->
<!-- 1/5 
	** 서버에서 응답되는 상태코드
	
	200 : 요청이 정상적으로 성공
	307 : 임시로 페이지를 리다이렉트로 처리
	400 : 클라이언트가 잘못된 요청을 했다는 상태코드
	401 : 접근이 허용되지 않은 페이지에 접근했다는 의미
	404 : 요청한 페이지가 없다는 경우
	405 : 요청한 메서드(get, post, head 등의 전송방식)를 허용하지 않음
	500 : 서버 내부에서 에러가 발생한 상태코드
	503 : 서버가 서비스를 제공하지 못할 경우
	
	http 응답코드는 ' http://goo.gl/D9th8N '에서 확인가능
	
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
	<p class="bg-danger text-white">요청하신 페이지를 찾지 못했습니다! 올바른 주소를 입력하세요!!</p>
	
</body>
</html>