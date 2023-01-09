<%@page import="com.lec.board.vo.BoardBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String curPage = (String) request.getAttribute("page");
	BoardBean board = (BoardBean) request.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
		crossorigin="anonymous">    	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
	<style>
  		.login-btn {
  			color: black;
  			background-color: #FFC312;
  			width:100px;
  		}
  		.login-btn:hover {
  			color: black;
  			background-color: white;  		
  		} 
  		.input-group-prepend span{
  			color: black;
  			width:40px;
  			background-color: #FFC312;
  			border: 0 !important;
  		}
  	</style>   
</head>
<body>


	<div class="container" align="center">
		<div class="jumbotron">
			<h3>글상세내용보기</h3>
		</div>
		
		<div class="form-group input-group">
			<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-user"></i></span></div>
			<input type="text" class="form-control" name="board_name" id="board_name" readonly value="${board.getBoard_name()}"/>
		</div>		
		<div class="form-group input-group">
			<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-clipboard"></i></span></div>
			<input type="text" class="form-control" name="board_subject" id="board_subject" readonly value="${board.getBoard_subject()}"/>
		</div>	
		<div class="form-group input-group">
			<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-comment-dots"></i></span></div>
			<textarea class="form-control" name="board_content" id="board_content" rows="15" cols="40" readonly>${board.getBoard_content()}</textarea>
		</div>	
		<c:if test="${board.getBoard_file() != null}">
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-file-alt"></i></span></div>
				<input type="text" class="form-control" name="board_file" id="board_file" readonly value="${board.getBoard_file()}"/>	
			</div>
		</c:if>	
		
		<div class="form-group input-group">
			<a href="boardModifyForm.bo?board_num=<%=board.getBoard_num()%>&page=<%=curPage%>" class="btn btn-success mr-sm-3">수정</a>		
			<a href="boardDeleteForm.bo?board_num=<%=board.getBoard_num()%>&page=<%=curPage%>" class="btn btn-success mr-sm-3">삭제</a>		
			<a href="boardReplyForm.bo?board_num=<%=board.getBoard_num()%>&page=<%=curPage%>" class="btn btn-success mr-sm-3">답변</a>		
			<a href="boardList.bo?page=<%=curPage%>" class="btn btn-success">목록</a>			
		</div>
	</div>
</body>
</html>