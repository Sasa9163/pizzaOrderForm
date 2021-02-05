<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link type="text/css" rel="stylesheet" href="https://cdn.firebase.com/libs/firebaseui/3.1.1/firebaseui.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/top-page.css">
<title>注文フォーム</title>
</head>
<body>
<div class="container-fluid frame">
	<div class="row d-flex align-items-center content">
		<div class="text-center col-12">
		<h1>ログイン</h1>
		<p>ログインして買い物を続ける</p>
		<div id="firebaseui-auth-container"></div>
  		<div id="loader">Loading...</div>
  		<form method="post" id="link" action="<%=request.getContextPath()%>/MyPage">
  			<div id="user-name"></div>
 		</form>
 		<form method="post" id="logoutform" action="<%=request.getContextPath()%>/Logout">
  			<button id="logout" class="d-none">ログアウト</button>
  		</form>
  		<form class="" id="user_form" action="<%=request.getContextPath()%>/LoginToRecipientServlet" method="post"
			novalidate>
			<input type="hidden" id="user_id" name="user_id">
			<input type="hidden" id="user_name" name="user_name">
			<input type="hidden" id="user_mail" name="user_mail">
		</form>
		</div>
	</div>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/js/form-validation.js"></script>

	<script src="<%=request.getContextPath()%>/js/form_post.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script src="https://www.gstatic.com/firebasejs/8.2.1/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.2.1/firebase-auth.js"></script>
	<script src="https://cdn.firebase.com/libs/firebaseui/3.1.1/firebaseui.js"></script>
	<script src="<%=request.getContextPath() %>/js/firebase.js"></script>

	<%
		String login_sta = (String) session.getAttribute("login");
		if (login_sta == "OK") {
	%>
		<script src="<%=request.getContextPath() %>/js/displayName.js"></script>
	<%
	} else {
	%>
		<script src="<%=request.getContextPath() %>/js/uiControl.js"></script>
	<%
	}
	%>
</body>
</html>
