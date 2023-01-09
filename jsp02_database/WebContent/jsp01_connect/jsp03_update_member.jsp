<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("pw");
	String email = request.getParameter("email");	
	
	int updateCount = 0;
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	Connection conn = null;
	Statement stmt = null;
	
	try {
		
		String drv = "jdbc:mariadb://localhost:3306/lec_jsp" +
						"useUnicode=true&characterEncoding=utf8";
		String usr = "root";
		String pwd = "12345";
		String sql = "update member set name ='" + name + "' " +
					"where id = '" + id + "'";
		
		conn = DriverManager.getConnection(drv, usr, pwd);
		stmt = conn.createStatement();
		updateCount = stmt.executeUpdate(sql);
		
	} finally {
		if (stmt != null) try { stmt.close(); } catch(Exception e) {}
		if (conn != null) try { conn.close(); } catch(Exception e) {}
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
<h3>정보수정_member</h3>
		<%  if (updateCount > 0) { %>
		<%= id %>의 이름을 <%= name %>(으)로 변경
		<%  } else { %>
		<%= id %> 아이디가 존재하지 않음
		<%  } %>

</body>
</html>