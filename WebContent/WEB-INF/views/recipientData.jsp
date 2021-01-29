<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pizzaOrderForm.cart.*"%>
<%@ page import="pizzaOrderForm.userData.*" %>
<%
	String flag=(String)session.getAttribute("login");
	UserData auto=new UserData();
	auto.lastname="";
	auto.firstname="";
	auto.contact_mail="";
	auto.post_code="";
	auto.address="";
	if(flag=="OK"){
		auto=(UserData)session.getAttribute("user");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/form-validation.css">
<title>送付先入力</title>
</head>
<body>
	<div class="container">
	<nav class="navbar navbar-defauld fixed-top bg-dark">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand">アーネストピザ</a>
			</div>
		</div>
	</nav>
	<div class="m-3">
		<h1 class="border-bottom border-primary text-center">送付先入力</h1>
	</div>
	<form class="mx-auto frame needs-validation" autocomplete="off" action="<%=request.getContextPath()%>/ConfirmationServlet" method="post" novalidate>
		<div class="mx-auto frame">
			<div class="form-group row">
				<label class="col-form-label col-sm-4 text-sm-right text-xs-left">姓</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="lastname" name="lastname" pattern="[^\x22\x27\x2C]*" value="<%=auto.lastname %>" placeholder="例：田中" required>
					<div id="lastname-valid" class="invalid-feedback">未入力または不正な入力です</div>
				</div>
				<label class="col-form-label col-sm-1 text-sm-right text-xs-left">名</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="firstname" name="firstname" pattern="[^\x22\x27\x2C]*" value="<%=auto.firstname %>" placeholder="例：太郎" required>
					<div id="firstname-valid" class="invalid-feedback">未入力または不正な入力です</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="mail" class="col-form-label col-sm-4 text-sm-right text-xs-left">連絡先メールアドレス</label>
				<div class="col-sm-5">
					<input class="form-control" id="mail" name="mail" pattern="[^\x22\x27\x2C]*" value="<%=auto.contact_mail %>" required>
					<div id="mail-valid" class="invalid-feedback">未入力または不正な入力です</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="postcode" class="col-form-label col-sm-4 text-sm-right text-xs-left">郵便番号</label>
				<div class="col-sm-5">
					<input class="form-control" id="postcode" name="postcode" pattern="[^\x22\x27\x2C]*" value="<%=auto.post_code %>" required>
					<div id="postcode-valid" class="invalid-feedback">未入力または不正な入力です</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="address" class="col-form-label col-sm-4 text-sm-right text-xs-left">住所</label>
				<div class="col-sm-5">
					<input class="form-control" id="address" name="address" pattern="[^\x22\x27\x2C]*" value="<%=auto.address %>" required>
					<div id="address-valid" class="invalid-feedback">未入力または不正な入力です</div>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label for="date" class="col-form-label col-sm-4 text-sm-right text-xs-left">配達日</label>
			<div class="col-sm-5">
				<input type="date" class="form-control" id="date" name="date"
					max="3000-12-31" required>
				<div class="invalid-feedback">無効な日付です</div>
			</div>
		</div>
		<div class="row my-3">
			<div class="mx-auto">
				<button type="submit" class="btn btn-primary" name="btn_submit" id="btn_submit">次へ</button>
			</div>
		</div>
	</form>

	<footer class="footer bg-dark fixed-bottom">
		<div class="container-fluid d-flex h-100">
			<p class="footer_text ml-3 row align-items-center">東京都千代田区大手町
				2-6-1 朝日生命大手町ビル2F</p>
		</div>
	</footer>
</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/js/today.js"></script>
	<script src="<%=request.getContextPath()%>/js/form-validation.js"></script>
	<script src="<%=request.getContextPath()%>/js/valid-message.js"></script>
</body>
</html>