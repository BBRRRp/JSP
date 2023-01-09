<%@page import="com.lec.web.service.WriteMessageService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="message" class="com.lec.web.model.Message">
	<jsp:setProperty name="message" property="*" />
</jsp:useBean>
<%
	/* // DB에 insert로직 */
	WriteMessageService writeService = WriteMessageService.getInstance();
	writeService.write(message);
	
/* 	// redirect하는 방법(1);
	// response.sendRedirect("list.jsp"); 
	// response.sendRedirect("list.jsp?page=${view_data.currentPage}") */
%>
<%-- <!-- redirect하는 방법(2); -->
<jsp:forward page="list.jsp"/> --%>
<!-- <script>
/* 	// redirect하는 방법(3);
	// window.location = "list.jsp";
 */
</script> -->
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
		<h3>메시지등록</h3>
		<p class="bg-success text-white">방명록에 메시지가 성공적으로 등록이 되었습니다.</p><br />
		<a href="list.jsp" class="btn btn-primary">목록보기</a>
		<a href="list.jsp?page=<%= session.getAttribute("page") %>" class="btn btn-primary">목록보기</a>
	</div>
</body>
</html>