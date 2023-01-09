<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>게시판 글쓰기</title>
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
  			width: 50px;
  		}
  		.login-btn:hover {
  			color: black;
  			background-color: white;	
  		}
  		.input-group-prepend span {
  			color: black;
  			backgroundcolor: #FFC312;
  			width: 40px;
  			boarder: 0 !important;
  		}
  		#form-control {
  			width: 80px;
  		}
  		
  	</style>
</head>
<body>
	<div class="container" align="center">
		<div class="jumbotron">
			<h3>게시판 글쓰기</h3>
			<p>게시판 글쓰기 페이지 입니다. 글을 작성해주세요</p>
		</div>

		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">@</span>
			</div>
			<input type="text" class="form-control" placeholder="Username"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>



		<form action="boardWrite.bo" method="post" class="form-group" name="boardform" enctype="multipart/form-data">
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-user"></i></span></div>
				<input type="text" class="form-control" name="board_name" id="board_name" required placeholder="board writer..."/>
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
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-file-alt"></i></span></div>
				<div class="custom-file">
					<label for="board_file" class="custom-file-label" style="text-align:left">파일을 선택하세요...</label>
					<input type="file" class="custom-file-input" name="board_file" id="board_file"/>
				</div>
			</div>
			
			<div class="form-group mt-md-5">
				<input type="reset" class="btn btn-success float-right login-btn ml-sm-2" value="새로고침"/>
				<input type="submit" class="btn btn-success float-right login-btn" value="글등록"/>
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
