<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 1/4  
		
	Servelet/JSP는 웹애플리케이션이 사전에 정해놓은 규칙에 따라 특정폴더의 구조를 준수하도록 강제화하고 있다.
	이 구조를 모른다면 제대로 동작하는 프로그램을 개발할 수 없게 된다.
	
	Servelet/JSP의 기본폴더 구조는
	
	웹애플리케이션 > root (jsp01_basic/WebContent)
		> WEB-INF : 웹애플리케이션의 설정정보가 위치한다. 대표적인 설정정보로는 'web.xml'파일이다.
		> WEB-INF/classes : 웹애플리케이션에서 사용하는 java의 class파일이 위치하는 폴더
		> WEB-INF/lib : 웹애플리케이션에서 사용하는 라이브러리파일이 위치하는 폴더(예: ojdbc6.jar)
		> WEB-INF/user폴더 : 사용자 폴더 css, js, jsp, html 등 사용자가 사용하는 파일이 위치하는 폴더
	
	A. 컨텍스트 경로
	
	 request 객체에서 컨텍스트(context)의 기본경로(path)는 request.getContextPath()메서드로 확인할 수 있다. 
		
	B. 웹애플리케이션의 배포(deploy) :https://yyman.tistory.com/1407
	
	 개발된 웹애플리케이션을 WAS(Web Application Server)에 배포하는 방법은 2가지가 있다. 
	
	 	a. 개발된 프로그램 폴더 그대로 파일을 WAS에 복사
		b. war파일 형식으로 압축해서 배포하는 방법
			...jdk의 jar.exe명령어를 사용해서 war파일을 생성
			...실행방법: c:\jar.exe cvf jsp01_basic.war *	
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
	<h1>웹 컨텍스트 경로 = <%= request.getContextPath() %></h1>
	<!-- http://localhost:8088/jsp01_basic/jsp03.process/jsp02_contextpath.jsp -->
</body>
</html>