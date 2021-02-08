<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pizzaOrderForm.servlet.*"%>
<%@ page import="pizzaOrderForm.itemInfo.*"%>
<%@ page import="java.sql.*" %>

<%@ include file="include/DBcon.jsp" %>

<%

String sqlStr = "SELECT * FROM SasaItemTable";
PreparedStatement st = connect.prepareStatement(sqlStr);
ResultSet result = st.executeQuery();
%>
<%
	int count=0;
%>

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
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/for-index.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/form-validation.css">
<title>注文フォーム</title>
</head>
<body>
<div class="container">
	<nav class="navbar navbar-defauld fixed-top bg-dark" style="padding:0 1em;">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand">アーネストピザ</a>
			</div>
			<a href="<%=request.getContextPath()%>/shoppingCart.jsp">カート</a>
			<div class="float-right">
				<div id="firebaseui-auth-container"></div>
  				<div id="loader">Loading...</div>
  				<form method="post" id="link" action="<%=request.getContextPath()%>/MyPage">
  					<div id="user-name"></div>
  				</form>
  				<form method="post" id="logoutform" action="<%=request.getContextPath()%>/Logout">
  					<button id="logout" class="d-none">ログアウト</button>
  				</form>
  				<form class="" id="user_form" action="<%=request.getContextPath()%>/Login" method="post"
					novalidate>
					<input type="hidden" id="user_id" name="user_id">
					<input type="hidden" id="user_name" name="user_name">
					<input type="hidden" id="user_mail" name="user_mail">
				</form>
  			</div>
		</div>
	</nav>
	<div class="m-3">
		<h1 class="border-bottom border-primary text-center">注文フォーム</h1>
	</div>
	<form class="mx-auto column-header">
		<div class="form-group row">
			<div class="col-sm-1"></div>
			<div class="col-sm-4"><strong>商品名</strong></div>
			<div class="col-sm-3"><strong>個数</strong></div>
		</div>
	</form>
<%
	while (result.next()) {
		String item_name=result.getString("item_name");
	    int item_code=result.getInt("item_code");
	    int stock=result.getInt("stock_quantity");
	    count++;
%>
	<form class="mx-auto needs-validation order_form" id="order_form<%=count %>" autocomplete="off" action="javascript:void(0);"
		method="post" novalidate>
		<div class="form-group row">
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
				<div class="col-form-label form-control display-border-none">
					<a href="<%=request.getContextPath() %>/item-detail?code=<%=item_code %>"><%=item_name %></a>
				</div>
				<input type="hidden" name="item" value="<%=item_code %>">
				<p>在庫数：<%=stock %></p>
			</div>
			<div class="col-sm-3">
				<select class="form-control" name="quantity" required <%if(stock==0){%>disabled<%} %>>
	    			<option value="">選択</option>
	    			<%for(int i=1;i<=stock;i++){%>
	    			<option value="<%=i%>"><%=i %></option>
					<%} %>
	    		</select>
				<div class="invalid-feedback">無効な個数です</div>
			</div>
			<div class="col-sm-1">
				<label class="col-form-label text-left">個</label>
			</div>
			<div class="col-sm-3">
				<button type="submit" data-index="<%=count %>" class="btn btn-primary btn_submit" name="btn_submit" <%if(stock==0){%>disabled<%} %>>カートに追加</button>
			</div>
		</div>
	</form>
<%
	}
%>
<%
	connect.close();
	st.close();
%>


	<footer class="footer bg-dark fixed-bottom">
		<div class="container-fluid d-flex h-100">
			<p class="footer_text ml-3 row align-items-center">東京都千代田区大手町
				2-6-1 朝日生命大手町ビル2F</p>
		</div>
	</footer>
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
