<%@page import="com.produkte.dao.DataBase"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product</title>
</head>
<body>

	<center>

	<%
		String itemname = request.getParameter("txtproducts") ;
		String productId = request.getParameter("txtid");
	
	 	DataBase db = new DataBase();
		db.updateProducts(itemname, productId);
	
	%>
	
	<h3>Product Updated</h3><br>
	<h3><a href='viewproducts.jsp'>View all Product RECORDS</a></h3> 
	
	</center>


</body>
</html>