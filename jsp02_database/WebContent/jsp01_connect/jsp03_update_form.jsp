<!--1/11  -->
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h3>정보수정페이지</h3>
	<div class="container" align="center">
		<form action="jsp03_update_member.jsp" method="post">
			<table class="table-hover">
				<tr>
					<td width="20%">아이디</td>
					<td><input type="text" class="form-control" name="id" size="30"/></td>
				</tr>
				
				<tr>
					<td width="20%">비밀번호</td>
					<td><input type="password" class="form-control" name="password" size="30"/></td>
				</tr>
				
				<tr>
					<td width="20%">이메일</td>
					<td><input type="text" class="form-control" name="email" size="30"/></td>
				</tr>
			
			</table>			
			<input type="submit" class="btn btn-info mt-sm-2" value="변경"/>
		</form>
	</div>

</body>
</html>