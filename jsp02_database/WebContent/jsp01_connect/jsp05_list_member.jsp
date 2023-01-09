<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h3> member list</h3>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>비번</td>
			<td>이름</td>
			<td>이메일</td>
		</tr>
<%
	Class.forName("org.mariadb.jdbc.Driver");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String drv = "jdbc:mariadb://localhost:3306/lec_jsp";
		String usr = "root";
		String pwd = "12345";
		String sql = "select * from member" ;
		
		conn = DriverManager.getConnection(drv, usr, pwd);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while (rs.next()) {
%>
	<tr>
		<td><%= rs.getString("id") %></td>
		<td><%= rs.getString("name") %></td>
		<td><%= rs.getString("password") %></td>
		<td><%= rs.getString("email") %></td>
	</tr>		
<%		
			}
	} catch(Exception e) {
		 out.println(e.getMessage());
		 e.printStackTrace();
	} finally {
		if (rs != null) try { rs.close(); } catch(Exception e) {}
		if (stmt != null) try { stmt.close(); } catch(Exception e) {}
		
		if (conn != null) try { conn.close(); } catch(Exception e) {}
	}
%>

</table>
</div>		
</body>
</html>