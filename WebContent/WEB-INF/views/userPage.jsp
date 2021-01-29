<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pizzaOrderForm.userData.UserData" %>
<%@ page import="java.sql.*" %>
<%
UserData Data=(UserData)session.getAttribute("user");
String item="";
int quantity=0;
String date="";

try{
request.setCharacterEncoding("UTF-8");
%>
<%@ include file="../../include/DBcon.jsp" %>
<%

String sql = "SELECT * FROM SasaUserTable WHERE user_id = ?";
PreparedStatement pstmt = connect.prepareStatement(sql);

pstmt.setString(1, Data.id);
ResultSet rs = pstmt.executeQuery();

String sql2 = "SELECT * FROM SasaOrderHistory WHERE order_user = ?";
PreparedStatement pstmt2 = connect.prepareStatement(sql2);

pstmt2.setString(1, Data.id);
ResultSet rs2 = pstmt2.executeQuery();

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
	href="<%=request.getContextPath()%>/css/acc.css">

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
		</div>
	</nav>
	<div class="m-3">
		<h1 class="border-bottom border-primary text-center">ユーザー情報</h1>
	</div>
<%
if(rs.next()){
	String lastname=rs.getString("user_lastname");
    String firstname=rs.getString("user_firstname");
    String login_mail=rs.getString("user_mail");
    String contact_mail=rs.getString("contact_mail");
    String postcode=rs.getString("post_code");
    String address=rs.getString("address");
%>
<div class="mx-auto frame">
		<div class="form-group row">
			<label class="col-form-label col-sm-4 text-sm-right text-xs-left">ログインメールアドレス：</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" value="<%=login_mail %>" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-form-label col-sm-4 text-sm-right text-xs-left">姓：</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" value="<%=lastname %>" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-form-label col-sm-4 text-sm-right text-xs-left">名：</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" value="<%=firstname %>" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-form-label col-sm-4 text-sm-right text-xs-left">連絡先メールアドレス：</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" value="<%=contact_mail %>" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-form-label col-sm-4 text-sm-right text-xs-left">郵便番号：</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" value="<%=postcode %>" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-form-label col-sm-4 text-sm-right text-xs-left">住所：</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" value="<%=address %>" readonly>
			</div>
		</div>
		<%
		if(rs2.next()){
			item=rs2.getString("order_item");
			quantity=rs2.getInt("order_quantity");
			date=rs2.getString("order_date");
		%>
		<div class="form-group">
		<div class="accbox mx-auto" style="width: 100%;">
			<label for="history" class="text-center" title="注文履歴">
				<img src="<%=request.getContextPath()%>/img/history-black-18dp.svg"
				height="24" style="padding:0;">
			</label>
			<input type="checkbox" id="history" class="cssacc">
			<div class="accshow">
				<table cellspacing="0" cellpadding="5">
				<tr bgcolor="#696969">
					<th><font color="#FFFFFF">商品名</font></th>
					<th><font color="#FFFFFF">注文数</font></th>
					<th><font color="#FFFFFF">注文日</font></th>
				</tr>
				<tr>
					<td><%=item %></td>
					<td><%=quantity %></td>
					<td><%=date %></td>
				</tr>
				<%while (rs2.next()) {
					item=rs2.getString("order_item");
					quantity=rs2.getInt("order_quantity");
					date=rs2.getString("order_date");
				%>
				<tr>
					<td><%=item %></td>
					<td><%=quantity %></td>
					<td><%=date %></td>
				</tr>
				<%} %>
				</table>
				<form name="del" method="post" action="<%=request.getContextPath()%>/deleteOrderHistory">
					<a href="javascript:del.submit()">削除</a>
				</form>
			</div>
		</div>
		</div>
		<%} %>
</div>



<%
}
}catch(Exception e){
%>
	<div style="margin-top:60px;">
	<p>データ取得失敗</p>
	</div>
<%
}
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
</body>
</html>