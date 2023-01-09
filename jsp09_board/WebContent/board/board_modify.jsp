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
</head>
<body>

	<div class="container" align="center">
		<div class="jumbotron">
			<h3>게시글 수정 하기</h3>
		</div>
		
		<form action="boardModify.bo" method="post" enctype="multipart/form-data">
			<input type="hidden" name="page" value="<%=curPage%>"/>
			<input type="hidden" name="board_num" value="<%=board.getBoard_num()%>"/>
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-user"></i></span></div>
				<input type="text" class="form-control" name="board_name" id="board_name" readonly value="${board.getBoard_name()}"/>
			</div>				
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-key"></i></span></div>
				<input type="password" class="form-control" name="board_pass" id="board_pass" required/>
			</div>	
					
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="far fa-clipboard"></i></span>
				</div>
				<input class="form-control" type="text" name="board_subject" id="board_subject" value="${board.getBoard_subject()}"/>
			</div>	
						
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-comment-dots"></i></span></div>
				<textarea class="form-control" name="board_content" id="board_content" rows="15" cols="40" required>${board.getBoard_content()}</textarea>
			</div>			
			
			<div class="form-group input-group">
				<c:choose>
					<c:when test="${!empty board.getBoard_file()}">
						<c:set var="choose_file" value="${board.getBoard_file()}"/>
					</c:when>
					<c:otherwise>
						<c:set var="choose_file" value="파일을 선택하세요..."/>
					</c:otherwise>
				</c:choose>
				<div class="form-group input-group">
					<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-file-alt"></i></span></div>
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="board_file" id="board_file"/>
						<label for="board_file" class="custom-file-label" style="text-align:left">${choose_file}</label>
					</div>	
				</div>
			</div>
			<div class="form-group input-group">
				<input type="submit" class="btn btn-success float-right mr-sm-3" value="수정"/>
				<a href="javascript:history.go(-1)" class="btn btn-success float-right">이전</a>			
			</div>		
		</form>
	</div>
	<script>
		$(".custom-file-input").on("change", function() {
			// var fileName = $(this).val(); // 전체파일명
			var fileName = $(this).val().split("\\").pop(); // 파일명
			$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
		})
	</script>	
</body>
</html>