<%@page import="com.produkte.dao.DataBase"%>
<%@page import="com.produkte.model.Products"%>
<%@page import="com.produkte.model.UserId"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
</head>
<body>
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


	<%
	UserId user = (UserId) session.getAttribute("keyUser");
	%>

	<center>
		<h4>Thankyou :)</h4>



		<%
		Products product = new Products();
		product.itemId = user.userId;

		product.items = request.getParameter("txtItem");
		product.quantity = request.getParameter("txtQuantity");
		product.price = request.getParameter("txtPrice");

		DataBase db = new DataBase();
		db.logFever(product);
		%>

		<p>
			Your Item has been Saved In Database In Id :
			<%=product.itemId%></p>
		<br>
		<br>
		<br> <a href="viewproducts.jsp"><p style="color: red;">
			<h3>
				"View All Saved Items".
				</p>
			</h3></a> <br> <br>

	</center>


</body>
</html>