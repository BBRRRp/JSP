<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--1/11 실습테이블 =>나비캣에 작성
	create table itm_master (
     id int(10) primary key,
     name varchar(30)
   );
   
   create table itm_detail (
     id int(10) primary key,
     description varchar(100) 
   );
 -->

<%
 	int id = Integer.parseInt(request.getParameter("id"));
 
 	Connection conn = null;
 	PreparedStatement item_stmt = null;
 	PreparedStatement detail_stmt = null;
 	
	String drv = "jdbc:mariadb://localhost:3306/lec_jsp";
 	String usr = "root";
	String pwd = "12345";

	Throwable force_exception = null;
	
	try {
		conn =  DriverManager.getConnection(drv, usr, pwd);
		conn.setAutoCommit(false);
		
		item_stmt = conn.prepareStatement("insert into itm_master values(?, ?)");
		item_stmt.setInt(1, id);
		item_stmt.setString(2, "품목코드_" + id );
		item_stmt.executeUpdate();
				
		// 강제로 exception
		if(request.getParameter("xxx") != null) {
			throw new Exception("강제로 발생시킨 에러입니다.");
		} 
		
		detail_stmt = conn.prepareStatement("insert into itm_detail values(?, ?)");	
		detail_stmt.setInt(1, id);
		detail_stmt.setString(2, "품목상세설명_" + id);
		detail_stmt.executeUpdate();
			
		conn.commit();
		
	} catch(Throwable e) {
		
		if(conn != null) {
			try { conn.rollback(); } catch(SQLException e1) {}
		}
		
		force_exception = e;
		
	} finally {
		try {
				if(detail_stmt != null) detail_stmt.close();
				if(conn != null) conn.close();
		} catch(Exception e) { 
				//dummy
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
	<% if(force_exception != null) { %>
			 <h3 class="bg-danger text-white"> 상품등록에 실패했습니다.</h3>
			 <%= force_exception.getMessage() %>
	<%  } else { %>
			 <h3 class="bg-primary text-white"> 상품등록이 정상적으로 처리되었습니다. </h3>
	<% } %>
	
</body>
</html>