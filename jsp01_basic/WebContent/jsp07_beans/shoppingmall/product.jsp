<%@page import="com.lec.product.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="productList" class="com.lec.product.ProductList" scope="session" />
<!-- 1/6  -->
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
	<%@include file="menu.jsp" %>
	
		<div class="jumbtron">
			<div class="container">
				<h3 class="display-6">상품상세정보</h3>
			</div>
		</div>
		
		<%
			String id = request.getParameter("id");
			Product product = productList.getProductById(id);
		/* 	//out.println(id);
			//out.println(product.getPname()); */
		%>
		
		<div class="container">
			<div class="row">
				<div class="col-md-6">
				 	<h3><%= product.getPname() %></h3>
				 	<p><%= product.getDescription() %></p>
				 	<p><b>상품코드 : </b> <span class="badge badge-danger"><%= product.getProductId()%></span></p>
					<p><b>제조사 : </b> <%= product.getManufacturer() %></p>
					<p><b>분류 : </b> <%= product.getCategory() %></p>
					<p><b>재고수량 : </b> <%= product.getUnitsInStock() %></p>
					<h4><%= product.getUnitPrice() %>원</h4>
					<p>
						<a href="#" class="btn btn-info">상품주문 </a>
						<a href="./main.jsp" class="btn btn-danger">상품목록</a>
					</p>
				</div>
			</div>
		</div>
	<%@include file="footer.jsp" %>
	
</body>
</html>