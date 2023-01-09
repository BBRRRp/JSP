<!--1/6  -->
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.product.Product"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="productList" class="com.lec.product.ProductList" scope="session" />

<% ArrayList<Product> listOfProducts = productList.getAllProducts(); %>

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
	
	<%!
		String welcome = "하이미디어 쇼핑몰에 오신것을 환영합니다.";
	%>
		
		<div class="jumbotron">
			<div class="container">
				<h3 class="display-6">
						상품목록
				</h3>
				<%= welcome %>
			</div>
		</div>
		
		<div class="container">
			<div class="row" align="center">
			<%
				for(int i =0; i<listOfProducts.size();i++) {
					Product product = listOfProducts.get(i);
			%>
					<div class="col-md-4">
						<h3><%= product.getPname() %></h3>
						<p><%= product.getDescription() %></p>
						<p><%= product.getUnitPrice() %>원</p>
						<p><a href="./product.jsp?id=<%= product.getProductId()%>" class="btn btn-info" role="button"> 제품정보 &raquo;</a></p>
					</div>
			<%
			
				}
			%>	
			</div>
		</div>	
	
	<%@include file="footer.jsp" %>
</body>
</html>