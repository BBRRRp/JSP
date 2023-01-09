<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 1/5 최종 취합 -->
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
	<div class="container">
		<table class="table table-dark table-hover" border="1">
			<tr>
				<td colspan="2"><jsp:include page="/jsp06.action/layout/top.jsp" flush="false"/></td>
			</tr>
		
			<tr height="80%">
				<td width="25%">
					<jsp:include page="/jsp06.action/layout/left.jsp" flush="false"/>
				</td>
				<td><h4>본문글</h4></td>
			</tr>
			
			<tr>
				<td colspan="2"> 
				<jsp:include page="/jsp06.action/layout/bottom.jsp" flush="false"/>
				</td>
			</tr>
	
		</table>
	</div>
</body>
</html>