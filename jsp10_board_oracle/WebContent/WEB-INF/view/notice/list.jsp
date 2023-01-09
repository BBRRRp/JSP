<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<title>List.JSP</title>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<body>	
	<div class="container" align="center">
	<%-- 	<h1>공지 갯수= ${count}</h1> --%>
	<div class="jumbotron">
		<h1 class="text-dark">공지사항</h1>
		<p>공지글 갯수 = ${count}</p>
	</div>
	
		<form action="" class="form-line">
			<div class="input-group">
			<select name="f" id="" class="form-control">
				<option ${(param.f=="title")?"selected":""}value="title">제목</option>
				<option ${(param.f=="writer")?"selected":""} value="writer">작성자</option>
			</select>
			<input type="text" class="form-control col-sm-9 mr-sm-2" placeholder="검색어..." name="q" value="${param.q}"/>
			<button type="submit" class="btn btn-primary col-sm-1">검색</button>
			</div>
		</form>			
		<br />
		
		<table class="table table-border table-striped table-hover">
			<thead class="thead-dark">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="notice" items="${list}" begin="0" end="9" varStatus="st">
					<tr>
						<td>${notice.num}</td>
						<td>${notice.title} <span class="badge badge-pill badge-danger">3</span></td>
						<td>${fn.toLowerCase(notice.writer)}</td>
						<td><fmt:formatDate pattern="yyyy.MM.dd hh:mm" value="${notice.regdate}"/></td>
						<td style="text-align:right"><fmt:formatNumber value="${notice.hit}"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>		
		
		<div class="row align-items-end">
			<div class="col-sm-10"></div>
			<div class="col-sm-2"><span class="badge badge-danger">${(empty param.p) ? 1 : param.p}</span>of 
				${fn:substringBefore(Math.ceil(count/10), '.')} pages</div>
		</div>
		<ul class="pagination justify-content-center">
			
			<c:set var="page" value="${(empty param.p) ? 1: param.p}"/>
			<c:set var="startNum" value="${page-(page-1)%5}"/>
			<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10), '.')}"/>
			
			<c:if test="${startNum>1}">
				<li class="page-item"><a href="?p=${startNum-1}" class="page-link">◀</a></li>
			</c:if>
			
			<c:if test="${lastNum<=1}">
				<li class="page-item disabled"><a href="" class="page-link">◀</a></li>
			</c:if>
			
			<c:forEach var="i" begin="0" end="4">
				<c:if test="${(startNum+i)<=lastNum}">
					<li class="page-item ${(param.p==(startNum+i))?'active':''}">
						<a class="page-link" href="?p=${startNum+i}&f=${param.f}&q=${param.q}">${startNum+i}</a>
					</li>
				</c:if>
			</c:forEach>
			
			<c:if test="${startNum+5<=lastNum}">
				<li class="page-item"><a href="?p=${startNum+5}" class="page-link">▶</a></li>
			</c:if>
			
			<c:if test="${startNum+5>lastNum}">
				<li class="page-item disabled"><a href="" class="page-link">▶</a></li>
			</c:if>
			
		</ul>
	</div>

</body>
</html>