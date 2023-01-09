<%@page import="com.lec.board.vo.BoardBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<h3>게시글 댓글달기</h3>
			<p>게시판 글쓰기 페이지 입니다. 댓글을 작성해 주세요</p>
		</div>
<form action="boardReply.bo" method="post" class="form-group">
			<input type="hidden" name="page" value="<%=curPage%>"/>
			<input type="hidden" name="board_num" value="<%=board.getBoard_num()%>"/>
			<input type="hidden" name="board_re_ref" value="<%=board.getBoard_re_ref()%>"/>
			<input type="hidden" name="board_re_lev" value="<%=board.getBoard_re_lev()%>"/>
			<input type="hidden" name="board_re_seq" value="<%=board.getBoard_re_seq()%>"/>

			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-user"></i></span></div>
				<input type="text" class="form-control" name="board_name" id="board_name" required placeholder="board writer...""/>
			</div>
				
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-key"></i></span></div>
				<input type="password" class="form-control" name="board_pass" id="board_pass" required placeholder="password..."/>
			</div>	
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-clipboard"></i></span></div>
				<input type="text" class="form-control" name="board_subject" id="board_subject" required placeholder="board subject..."/>
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-comment-dots"></i></span></div>
				<textarea class="form-control" name="board_content" id="board_content" rows="15" cols="40" required
					placeholder="board content..."></textarea>
			</div>	
			
			<div class="form-group mt-md-5">
				<input type="submit" class="btn btn-success float-right login-btn ml-sm-2" value="댓글쓰기"/>
				<input type="reset" class="btn btn-success float-right login-btn" value="새로고침"/>
			</div>
		</form>
	</div>
</body>
</html>


