<%@page import="com.lec.board.vo.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.board.vo.PageInfo"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	ArrayList<BoardBean> boardList = (ArrayList<BoardBean>) request.getAttribute("boardList");
	
	int curPage = pageInfo.getPage();
	int totalPage = pageInfo.getTotalPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	
%>
<c:set var="board_list" value="${boardList}"/>
<c:set var="curPage" value="<%=curPage%>"/>
<c:set var="totalPage" value="<%=totalPage%>"/>
<c:set var="startPage" value="<%=startPage%>"/>
<c:set var="endPage" value="<%=endPage%>"/>
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
<%-- 	<h1>el : ${curPage}</h1>
	<h1>xx : <%=curPage%></h1> --%>
	<div class="container" align="center">
		<div class="jumbotron">
			<h3>게시글목록보기</h3>
			<c:if test="${board_list.isEmpty()}">
				<h5><p class="bg-danger text-white">등록된 게시물이 존재하지 않습니다!!</p></h5>
			</c:if>
		</div>
		
		<div class="navbar"><a href="boardWriteForm.bo" class="btn btn-success">글쓰기</a></div>
		
		<table class="table table-light table-hover">
			<tr class="table-dark">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>파일</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="board" items="${board_list}">
				<tr>
					<td>${board.getBoard_num()}</td>
					<td>
					
						<c:if test="${board.getBoard_re_lev() != 0}">
							┗
							<c:forEach var="i" begin="1" end="${board.getBoard_re_lev() * 2}">
								━
							</c:forEach>
							[RE]
						</c:if>	
						<a href="boardDetail.bo?board_num=${board.getBoard_num()}&page=${curPage}">${board.getBoard_subject()}</a>
						<span class="badge badge-success ml-sm-3">${board.getBoard_readcount()}</span>
					</td>
					<td>${board.getBoard_name()}</td>
					<td>${board.getBoard_date()}</td>
					<td>
						<c:if test="${!empty board.getBoard_file()}">
							<a href="/board/board_download.jsp?fn=${board.getBoard_file()}" class="btn btn-success">
								<i class="fas fa-file-download"></i>
							</a>
						</c:if>
					</td>
					<td>
						<a href="boardDeleteForm.bo?board_num=${board.getBoard_num()}&page=${curPage}" class="btn btn-danger">
							<i class="fas fa-trash-alt"></i>
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br />
	<hr />
	
	<!-- pagination -->
	<div class="container">
		<ul class="pagination justify-content-center">
			
			<c:if test="${startPage!=1}">
				<li class="page-item"><a href="boardList.bo?page=1" class="page-link"><i class="fas fa-fast-backward"></i></a></li>
				<li class="page-item"><a href="boardList.bo?page=${startPage-10}" class="page-link"><i class="fas fa-backward"></i></a></li>
			</c:if>
			
 			<c:forEach var="page_num" begin="${startPage}" end="${endPage}">
				<li class="page-item"><a href="boardList.bo?page=${page_num}" class="page-link">${page_num}</a></li>
			</c:forEach>
			
			<c:if test="${endPage < totalPage}">
				<li class="page-item"><a href="boardList.bo?page=${endPage+1}" class="page-link"><i class="fas fa-forward"></i></a></li>
				<li class="page-item"><a href="boardList.bo?page=${totalPage}" class="page-link"><i class="fas fa-fast-forward"></i></a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>
