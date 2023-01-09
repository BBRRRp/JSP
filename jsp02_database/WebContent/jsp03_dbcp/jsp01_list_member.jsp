<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--1/11
** 커넥션 풀(Connection Pool)
	
	커넥션 풀 기법이란? 데이터베이스와 연결된 커넥션을 사전에 만들어서 Pool 속에 저장해 두고 필요할 때 마다 
	풀에서 꺼내서 사용한 후에 다시 pool에 반환하는 기법을 말한다.
	
** 커넥션풀의 특징은

	1. 사전에 Pool에 Connection이 생성되어 있기 때문에 커넥션을 생성하는데 필요한 연결 시간을 감소시킨다.
	2. Connection을 재사용하기 때문에 생성되는 Connection의 갯수를 일정하게 관리할 수 있다. 
	3. Connection Pool을 사용하게 되면 웹애플리케이션의 성능과 처리량이 향상되기 때문에 웹애플리케이션 대부분이
  		Connection Pool을 기본적으로 사용하고 있다.
	  
**커넥션 풀을 사용하는 방법
	
	1.DBCP관련 jar파일과 JDBC 관련 jar파일 설치

	a. Common DBCP API(commons-dbcp2.???.jar, commons-pool2-??.jar, commons-logging-??.jar)
	b. WEB-INF/lib에 복사
	
2. Connection Pool을 초기화 하기
	
	a. web.xml에 Connection Pool관련 태그 설정하기

3. Connection Pool에서 Connection을 사용하기

	a. jdbc:appache:commons:dbcp:커넥션풀이름
		
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

	<div class="container" align="center">
	
		<h3>회원목록</h3>
		<div class="row">
			<table class="table table-hover">
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th>삭제</th>
				</tr>
				<%
				
					Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;	
					
					try {
						String drv = "jdbc:apache:commons:dbcp:myPoolName";
						conn = DriverManager.getConnection(drv);
						String sql = "select * from member";
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);		
						
						while(rs.next()) {
					%>
						<tr>
							<td><a href="jsp03_update_form.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("id") %></a></td>
							<td><%= rs.getString("password") %></td>
							<td><%= rs.getString("name") %></td>
							<td><%= rs.getString("email") %></td>
							<td><a href="jsp04_delete_form.jsp?id=<%= rs.getString("id") %>" class="btn btn-danger">삭제</a></td>
						</tr>
					<%
						}
					} catch(Exception e) {
						out.println("<h3 class='bg-red text-white'>DB접속실패</h3>" + e.getMessage());
					} finally {
						try {
							if(rs != null) rs.close();
							if(stmt != null) stmt.close();
							if(conn != null) conn.close();
						} catch(Exception e) {
							// dummy
						}
					}					
				%>
			</table>
			
			<a href="jsp02_database/jsp01_connect/jsp02_insert_form.jsp" class="btn btn-primary mt-sm-2">회원등록</a>
		</div>
	
	</div>
	
</body>
</html>
