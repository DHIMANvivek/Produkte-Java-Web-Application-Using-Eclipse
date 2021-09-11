package com.produkte.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.produkte.dao.DataBase;
import com.produkte.model.UserId;

@WebServlet("/User")
public class authServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public authServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserId admin = new UserId();

		admin.userId = request.getParameter("txtuserid");

		System.out.println("ADMIN:" + admin);

		DataBase db = new DataBase();
		db.fetch(admin);

		response.setContentType("text/html");

		PrintWriter writer = response.getWriter();

		String html = "";
		if (true) {
			HttpSession session = request.getSession();
			session.setAttribute("keyUser", admin);

			html = "<html><body  style=\"background-color: #fefbd8\"><center>THANK YOU " +"<br><br>Your ID Is Saved With Us</br></br>"+"<br><h3>Your ID:</h3></b>"+admin.userId+ "<br><br><b><h2>Success</h2></b></br></br>"
					+ "<a href='register.jsp'><h1><b>Add Products</b></h1></a>" + "<html><body><center>";
		}

		writer.println(html);
	}

}
