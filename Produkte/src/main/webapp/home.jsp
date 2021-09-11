<%@page import="com.produkte.dao.DataBase"%>
<%@page import="com.produkte.model.Products"%>
<%@page import="com.produkte.model.UserId"%>
<%@ include file="components/common_cs_js.jsp"%>
<%@ include file="components/navbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<body style="background-color: #fefbd8 ">
<meta charset="UTF-8">
<title>Welcome</title>
</head>
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
	background-color: #fefbd8;
}
</style>
<body>
	<br>
	<br>

	<h1 style="color: blue;"><center>↓ Enter Your Products Here ↓</center></h1>

	
	<%--<
	UserId user = (UserId) session.getAttribute("keyUser");
		%>--%>

	<center>

<style>
.button {
  background-color: #00ff00; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}

.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
}

.button3 {
  background-color: white; 
  color: black; 
  border: 2px solid #f44336;
}

.button4 {
  background-color: white;
  color: black;
  border: 2px solid #e7e7e7;
}

.button5 {
  background-color: white;
  color: black;
  border: 2px solid #555555;
}
</style>
		
		<a href="viewproducts.jsp"><p style="color: red;"><h3>"View All Saved Items".</p></h3></a> <br> <br>

		<form action="addproducts.jsp" method="get">
			<div class="form-group">
				<label for="item">Items</label> 
				<br><input type="text"
					 placeholder="Enter Item" id="email"
					name="txtItem">
			</div>
			<div class="form-group">
				<label for="number">Quantity</label> 
				<br><input type="number"
					 placeholder="Enter Quantity" id="Quantity"
					name="txtQuantity">
			</div>
			<div class="form-group">
				<label for="number">Price</label> 
				<br><input type="number" 
					 placeholder="Enter Price" id="Price"
					name="txtPrice">
			</div>



			<br> 
			
			<button type="submit" class="button"><h9 style="color: 	black;"><center>Submit</center></h9></button>
		</form>

		<br>

		<table>
		</table>

	</center>

</body>
</html>