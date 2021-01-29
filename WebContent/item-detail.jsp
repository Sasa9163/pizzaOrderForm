<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ include file="include/DBcon.jsp" %>

<%
request.setCharacterEncoding("UTF-8");
String code=request.getParameter("code");

String sqlStr = "SELECT * FROM SasaItemTable WHERE item_code ="+code+";";
PreparedStatement st = connect.prepareStatement(sqlStr);
ResultSet result = st.executeQuery();
String item_name="";
int item_price=0;
int stock=0;
if(result.next()){
item_name=result.getString("item_name");
item_price=result.getInt("item_price");
stock=result.getInt("stock_quantity");
}

	connect.close();
	st.close();
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
	href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/form-validation.css">
<title>アーネストピザ | <%=item_name %></title>
</head>
<body>
<div class="container">
	<nav class="navbar navbar-defauld fixed-top bg-dark">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand">アーネストピザ</a>
			</div>
			<div>
				<a href="<%=request.getContextPath()%>/shoppingCart.jsp">カート</a>
			</div>
		</div>
	</nav>

	<form class="mx-auto padding-form" id="order_form1" autocomplete="off" action="<%=request.getContextPath() %>/ShoppingCartServlet"
		method="post" novalidate>
        <div class="col-sm-6 float-left">
                <img src="<%=request.getContextPath() %>/img/img<%=code %>.jpg">
        </div>
		<div class="col-sm-6 float-right for_mb_margin60">
            <p class="col-form-label form-control display-border-none item-name"><%=item_name %></p>
            <input type="hidden" name="item" value="<%=code%>">
            <p class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            <p class="price">￥<%=item_price %></p>
            <p>残り<%=stock %>点</p>
			<div class="form-group row">
                <label class="col-form-label" for="quantity">個数:</label>
				<select class="form-control col-sm-3 for_mb_margin30" id="quantity" name="quantity" required <%if(stock==0){%>disabled<%} %>>
	    			<%for(int i=1;i<=stock;i++){%>
	    			<option value="<%=i%>"><%=i %></option>
					<%} %>
	    		</select>
                <div class="col-sm-1"></div>
				<button type="submit" data-index="1" class="col-sm-6 btn btn-primary btn_submit" name="btn_submit" <%if(stock==0){%>disabled<%} %>>カートに追加</button>
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

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath() %>/js/form-validation.js"></script>
</body>
</html>