<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link type="text/css" rel="stylesheet"
	href="https://cdn.firebase.com/libs/firebaseui/3.1.1/firebaseui.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/top-page.css">
</head>

<body>
	<div class="container-fluid frame">
		<div class="row d-flex align-items-center content">
			<div class="text-center col-12">
				<h1>ユーザー登録</h1>
				<div id="firebaseui-auth-container"></div>
				<div id="user-name"></div>
				<div id="message"></div>
				<div id="loader">Loading...</div>
				<div style="height:30px;"></div>
				<form method="post" id="logoutform" action="<%=request.getContextPath()%>/Logout">
					<button id="logout" class="col-sm-3 d-none btn btn-primary">登録を中止</button>
				</form>
				<form class="" id="user_form" action="<%=request.getContextPath() %>/Insert"
				method="post" novalidate>
					<input type="hidden" id="user_id" name="user_id">
					<input type="hidden" id="user_name" name="user_name">
					<input type="hidden" id="user_mail" name="user_mail">
					<div style="height:30px;"></div>
						<button type="submit" class="col-sm-3 btn btn-primary btn_submit d-none"
							id="btn_submit" name="btn_submit">登録</button>
				</form>
			</div>
		</div>
	</div>

	<script src="https://www.gstatic.com/firebasejs/8.2.1/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.2.1/firebase-auth.js"></script>
	<script
		src="https://cdn.firebase.com/libs/firebaseui/3.1.1/firebaseui.js"></script>
	<script src="<%=request.getContextPath() %>/js/firebase.js"></script>
	<script src="<%=request.getContextPath() %>/js/Register.js"></script>

</body>
</html>