<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="r memb" class="w com.lec.member.model.Memb" scope="request"/>
<jsp:setProperty name="member" property="*" />
<jsp:setProperty name="member" property="password" value="<%= member.getId() %>"/>
<!-- 프로퍼티에 따른 값 매핑

		프로퍼티이름 				변환방법							기본값
  ------------------- ------------------------- ---------------------------------------
  boolean/Boolean     Boolean.valueOf(String)    		 false
  byte/Byte           Byte.valueOf(String)       		 (byte) 0
  short/Short         Short.valueOf(String)      		 (short) 0
  char/Char           Chracter.valueOf(String)    		 (char)0
  int/Integer         Integer.valueOf(String)         		0
  long/Long           Long.valueOf(String)            		0l
  double/Double       Double.valueOf(String)          		0.0
  float/Float         Float.valueOf(String)           		0.0f
  
 < jsp:setProperty name="member" property="age" value="100" />
  
  -->

<!DOCTYPE html>
<html>
<head>
	<title>1/5 join page</title>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<body>
		
	<div class="container">
		<h3>"request객체의 getParameter()메서드"</h3>
		Id : <%= request.getParameter("id") %> <Br>
		이름 :<%= request.getParameter("name") %> <Br>
		이메일: <%= request.getParameter("email") %> <Br>
		<hr>		
		
		<h3>회원가입성공</h3>
		<h3>자바빈 객체의 프로퍼티(Member필드)</h3>
		<table class="table table-dark table-hover">
			<tr>
				<td>아이디</td>
				<td><jsp:getProperty name="member" property="id" /></td>
				<td>비밀번호</td>
				<td><jsp:getProperty name="member" property="password" /></td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td><jsp:getProperty name="member" property="name" /></td>
				<td>이메일</td>
				<td><jsp:getProperty name="member" property="email" /></td>
			</tr>
		
		</table>
	</div>
		
</body>
</html>