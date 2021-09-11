
<%@page import="com.produkte.dao.DataBase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action</title>
</head>
<body>

	<center>

		<%
		DataBase db = new DataBase();
	
		String action = request.getParameter("action");
		String userId = request.getParameter("userids");
		String itemname = request.getParameter("fever");
		String products = request.getParameter("products");
		
		if(action.equals("delete")){
			// delete the fever record
			db.deleteForever(userId);
	%>
		<h3>Products Record Deleted</h3>
		<%			
		}else{
			
	%>
		<h3>UPDATE PRODUCT</h3>
		<form action="update.jsp" method="get">
			<input type="text" name="txtproducts" value="<%=itemname%>">
			<input type="hidden" name="txtid" value="<%=userId%>">
			<input type="submit" value="UPDATE PRODUCTS">
		</form>
		<%			// update the fever record
		}
	%>
	</center>

</body>
</html>