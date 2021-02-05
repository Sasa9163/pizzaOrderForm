<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pizzaOrderForm.itemInfo.*"%>

<%@ page import="java.util.List"%>
<%@ page import="pizzaOrderForm.cart.Cart"%>
<%@ page import="pizzaOrderForm.orderer.Orderer" %>
<%@ page import="pizzaOrderForm.userData.UserData" %>
<%@ page import="java.sql.*" %>

<%
	UserData result=(UserData)session.getAttribute("user");
	String msg = "登録が完了しました";
%>

<%
try{
request.setCharacterEncoding("UTF-8");
%>

<%@ include file="../../include/DBcon.jsp" %>

<%

String sqlStr = "INSERT INTO SasaUserTable VALUES (\""+result.id+"\",\""+result.lastname+"\",\""+result.firstname+"\",\""+result.mail+"\")";
Statement stmt = connect.createStatement();
int num = stmt.executeUpdate(sqlStr);
connect.close();
stmt.close();
}catch(Exception e){
	msg="このGoogleアカウントは登録済みです";
}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>注文確認画面</title>

<link type="text/css" rel="stylesheet" href="https://cdn.firebase.com/libs/firebaseui/3.1.1/firebaseui.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
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
			<div id="firebaseui-auth-container"></div>
  				<div id="loader">Loading...</div>
  				<div id="user-name"></div>
  				<form method="post" id="logoutform" action="<%=request.getContextPath()%>/Logout">
  					<button id="logout" class="d-none">ログアウト</button>
  				</form>
		</nav>
		<div style="margin-top:60px;"><%=msg %></div>
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

	<script src="https://www.gstatic.com/firebasejs/8.2.1/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.2.1/firebase-auth.js"></script>
	<script src="https://cdn.firebase.com/libs/firebaseui/3.1.1/firebaseui.js"></script>
	<script src="<%=request.getContextPath() %>/js/firebase.js"></script>
	<script src="<%=request.getContextPath() %>/js/displayName.js"></script>
</body>
</html>
