<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pizzaOrderForm.itemInfo.*"%>

<%@ page import="java.util.List"%>
<%@ page import="pizzaOrderForm.cart.Cart"%>
<%@ page import="pizzaOrderForm.orderer.Orderer" %>

<%
	Orderer o=(Orderer) session.getAttribute("orderer_data");
	String name = o.getName();
	String address = o.getAddress();
	String date = (String) session.getAttribute("date");
	List<Cart> fromSession = (List<Cart>) session.getAttribute("list");
	Cart result=new Cart();
	int i=0;
	int count=fromSession.size();
	int total=0;
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>注文完了</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/checkout/">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<link href="<%=request.getContextPath()%>/css/form-validation.css"
	rel="stylesheet">
</head>
<body class="bg-light">
	<div class="container">
		<nav class="navbar navbar-defauld fixed-top bg-dark">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand">アーネストピザ</a>
				</div>
			</div>
		</nav>
		<div class="m-3">
			<h1 class="border-bottom border-primary text-center">以下の注文を承りました。</h1>
		</div>
		<div class="row">
			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">Your cart</span> <span
						class="badge badge-secondary badge-pill"><%=count %></span>
				</h4>
				<ul class="list-group mb-3">
					<%for(i=0;i<count;i++){ %>
					<%result=fromSession.get(i);%>
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0"><%=result.item%></h6>
							<small class="text-muted"><%=result.price%>×<%=result.quantity%></small>
						</div> <span class="text-muted"><%=result.total %></span>
					</li>
					<% total=total+result.total; %>
					<%} %>
					<%session.removeAttribute("list"); %>
					<li class="list-group-item d-flex justify-content-between"><span>合計額（円）</span>
						<strong><%=total %></strong></li>
				</ul>
				<ul class="list-group mb-3">
					<li class="list-group-item d-flex justify-content-between"><span>支払額</span>
						<%double tax_included=total*1.1; %> <strong><%=(int)tax_included %></strong>円
					</li>
				</ul>

			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">送付先</h4>
				<form>
					<div class="mb-3">
						<label for="name">名前</label> <input type="text"
							class="form-control" id="name" value=<%=name %> readonly required>
					</div>

					<div class="mb-3">
						<label for="address">住所</label> <input type="text"
							class="form-control" id="address" value=<%=address %> readonly
							required>
					</div>
					<div class="mb-3">
						<label for="date">配達日</label> <input type="date"
							class="form-control" id="date" name="date" max="3000-12-31"
							value=<%=date %> readonly required>
					</div>
					<hr class="mb-4">
				</form>
			</div>
		</div>
		<footer class="footer bg-dark fixed-bottom">
			<div class="container-fluid d-flex h-100">
				<p class="footer_text ml-3 row align-items-center">東京都千代田区大手町
					2-6-1 朝日生命大手町ビル2F</p>
			</div>
		</footer>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
	<script src="form-validation.js"></script>
</body>
</html>
