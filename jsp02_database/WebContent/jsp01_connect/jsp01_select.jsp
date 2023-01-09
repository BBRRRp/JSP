<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
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
		<h3>회원정보</h3>
		<%
			Class.forName("org.mariadb.jdbc.Driver");
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try {
				String drv = "jdbc:mariadb://localhost:3306/lec_jsp";
				String usr = "root";
				String pwd = "12345";
				String sql = "select * from member where id='" + id + "'";
				
				conn = DriverManager.getConnection(drv, usr, pwd);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				if(rs.next()) {
		%>
					<table class="table table-dark table-hover">
						<tr>
							<td width="20%">아이디</td>
							<td><%= id %></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><%= rs.getString("password") %></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><%= rs.getString("name") %></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><%= rs.getString("email") %></td>
						</tr>
					</table>
		<%		} else {
		%>		 
				<h3><%= id %> 를 찾지 못했습니다!!</h3>
		<%
		       }
			} catch(Exception e) {
		%>
				DB접속실패 : <%= e.getMessage() %>
				
		<%	} finally {
				try {
					if(rs != null) rs.close();
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
				} catch(Exception e) {
					// dummy
				}
			}
		%>
		<a href="jsp02_insert_form.jsp" class="btn btn-info">회원등록하기</a>
	</div>	
</body>
</html>