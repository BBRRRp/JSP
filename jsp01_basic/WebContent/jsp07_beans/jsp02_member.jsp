<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" scope="request" class="com.lec.member.model.Member"/>

<div class="container">
	<h1> 로그인(자바빈 사용하기)</h1>
	<h3> id : <%= member.getId() %></h3>
	<h3> pw : <%= member.getPassword() %></h3>
	<h3>name : <%= member.getName() %></h3>
	<hr>
	<h4 class="bg-primary text-white"> 로그인에 성공했습니다.</h4>
	
</div>
