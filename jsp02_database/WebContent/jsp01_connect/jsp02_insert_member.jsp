<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	boolean isConn = true;
	
	String drv = "jdbc:mariadb://localhost:3306/lec_jsp";
	String usr = "root";
	String pwd = "12345";
	String sql = "insert into member values(?,?,?,?)";
	
	try {
		conn = DriverManager.getConnection(drv, usr, pwd);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		pstmt.executeUpdate();
	} catch(Exception e) {
		isConn = false;
		out.println("<h3 class=bg-danger>DB접속실패!!!</h3>");
	} finally {
		try {
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch(Exception e) {
			// dummy
		}
	}
%>
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
	<div class="container" align="center">
		<c:choose>
			<c:when test="<%= isConn %>">
				<h3>회원등록이 성공적으로 등록되었습니다!</h3>	
				아이디   : <b>${ param.id }</b> = <%= id %><br>
				비밀번호 : <b>${ param.password }</b> = <%= pw %> <br>
				이름     : <b>${ param.name }</b> = <%= name %> <br>
				이메일   : <b>${ param.email }</b> = <%= email %> <br>
			</c:when>
			<c:otherwise>
				<h3 class="bg-danger">회원등록이 실패했습니다!!</h3>
			</c:otherwise>
		</c:choose>
		<form action="jsp02_insert_form.jsp">
			<input type="submit" class="btn btn-info" value="돌아가기"/>
			<a href="" class="btn btn-info ml-sm-2">회원목록</a>
		</form>
	</div>


</body>
</html>