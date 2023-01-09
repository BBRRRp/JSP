<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<table class="table table-dark table-hover">
		<tr>
			<td> 제품번호 </td>
			<td> xxx-yyyy-zzzzz</td>
		</tr>
	
		<tr>
			<td>가격</td>
			<td>150,000원</td>
		</tr>
	</table>
	<!-- jsp03_param_02.jsp?status=B s-->
	<jsp:include page="jsp03_param_02.jsp" flush="false">
		<jsp:param name="status" value= "A"/>
	</jsp:include>
	</div>

</body>
</html>