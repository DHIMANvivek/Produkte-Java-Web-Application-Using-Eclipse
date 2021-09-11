<%@page import="com.produkte.model.Products"%>
<%@page import="com.produkte.dao.DataBase"%>
<%@page import="com.produkte.model.UserId"%>

<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body style="background-color: #FFFDB8;">
	<!DOCTYPE html>
<html>
<head>
<style>
body {
	background-color: #fefbd8;
}

h1 {
	background-color: #80ced6;
}

span {
	background-color: yellow;
}

div {
	background-color: #d5f4e6;
}
</style>
<style>
div.ex1 {
	border-style: solid;
	border-color: #0000ff;
}

td.ex2 {
	border-style: solid;
	border-color: #ff0000 #0000ff;
}

div.ex3 {
	border-style: solid;
	border-color: #ff0000 #00ff00 #0000ff;
}

div.ex4 {
	border-style: solid;
	border-color: #ff0000 #00ff00 #0000ff rgb(250, 0, 255);
}
</style>

<meta charset="UTF-8">
<title>Products</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>

	<%
	UserId user = (UserId) session.getAttribute("keyUser");
	Products product = new Products();
	user._id = product.itemId;
	DataBase db = new DataBase();
	%>



	<div class="container">
		<br>


		<marquee>
			<h2>Thankyou & Note : We Promise Not To Save Your Data In Our DataBase After You Deleted :)
				:)</h2>
		</marquee>
		<center>
			<h2>Product Records</h2>
		</center>
		<div class="ex3">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Date Time</th>
						<th>items</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					</div>

					<%
					ArrayList<Products> prod = db.fetchProducts(user.userId);
					user._id = product.itemId;
					for (Products pro : prod) {
					%>

					<tr>

						<td class="ex2"><%=pro.dateTimeStamp%></td>
						<td class="ex2"><%=pro.items%></td>
						<td class="ex2"><%=pro.quantity%></td>
						<td class="ex2"><%=pro.price%></td>
						<td class="ex2"><a
							href='action.jsp?action=update&userids=<%=pro._id%>&fever=<%=pro.items%>'>UPDATE</a>
							<a href='action.jsp?action=delete&userids=<%=pro._id%>'>DELETE</a></td>

					</tr>

					<%
					}
					%>

				</tbody>
			</table>
		</div>
</body>
</html>