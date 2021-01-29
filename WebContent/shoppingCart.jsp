<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pizzaOrderForm.cart.*"%>

<%@ page import="java.util.List"%>
<%@ page import="pizzaOrderForm.cart.Cart"%>
<%

	List<Cart> fromSession = (List<Cart>) session.getAttribute("list");
	Cart result=new Cart();
	int i=0;
	int total=0;

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
<title>カート画面</title>
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
		<h1 class="border-bottom border-primary text-center">カートの中身</h1>
	</div>
	<div class="mx-auto frame">

	<%if(fromSession == null){%>
		<div class="row my-3" style="height:6rem;">
			<div class="align-self-center mx-auto">カートに何も入っていません</div>
			<div class="align-self-center mx-auto"><a href="<%=request.getContextPath() %>/index.jsp" >注文画面へ戻る</a></div>
		</div>
	<%}else{%>
		<%int count=fromSession.size(); %>
		<div class="row">
    		<div class="col-md-10 mb-10 mx-auto">
      			<h4 class="d-flex justify-content-between align-items-center mb-3">
        			<span class="text-muted">Your cart</span>
        			<span class="badge badge-secondary badge-pill"><%=count %></span>
      			</h4>
      		<ul class="list-group mb-3">
      	<%for(i=0;i<count;i++){ %>
		<%result=fromSession.get(i);%>
        	<li class="list-group-item d-flex justify-content-between lh-condensed">
          		<div>
            		<h6 class="my-0"><%=result.item%></h6>
            		<small class="text-muted"><%=result.price%>×<%=result.quantity%></small>
          		</div>
          		<span class="text-muted"><%=result.total %></span>
        	</li>
        <% total=total+result.total; %>
        <%} %>
        	<li class="list-group-item d-flex justify-content-between">
          		<span>合計額（円）</span>
          		<strong><%=total %></strong>
        	</li>
      		</ul>
      		<ul class="list-group mb-3">
        		<li class="list-group-item d-flex justify-content-between">
            		<span>支払額</span>
            <%double tax_included=total*1.1; %>
            		<strong><%=(int)tax_included %></strong>円
        		</li>
      		</ul>
      		</div>
		</div>
		<form class="mx-auto" action="<%=request.getContextPath()%>/recipientDataServlet" method="post" >
			<div class="row my-3">
				<div class="mx-auto">
					<button class="btn btn-primary" name="btn_submit">注文</button>
				</div>
			</div>
		</form>
		<div class="row">
			<div class="mx-auto"><a href="<%=request.getContextPath() %>/index.jsp" >注文を続ける</a></div>
		</div>
    <%}%>
	</div>

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
</body>
</html>