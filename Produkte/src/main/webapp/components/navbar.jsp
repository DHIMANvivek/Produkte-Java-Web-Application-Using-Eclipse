<%@page import="com.produkte.model.Products"%>
<%@page import="com.produkte.model.UserId"%>
<%@page import="com.important.css.User"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
User user = (User) session.getAttribute("active-user");

%>

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


<nav class="navbar navbar-expand-lg navbar-light custom-bg">

	<div class="container-fluid">
		<a class="navbar-brand" href="register.jsp"><h3>
				<i>Produkte</i>
			</h3></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">


				

				<li class="nav-item active ml-2" data-toggle="modal"
					data-target=".aboutusmodal">
					<div class="nav-link">
						<b>About us</b>
					</div>
				</li>

				<li class="nav-item active ml-2" data-toggle="modal"
					data-target=".contactusmodal">
					<div class="nav-link">
						<b>Contact us</b>
					</div>
				</li>

			</ul>

		

			<%
			if (user != null) {
			%>

			<ul class="navbar-nav ml-auto">

				<%
				if (user.getUserType().equals("normal")) {
				%>

				<%
				}
				%>

				<li class="nav-item active">
					<div class="nav-link" data-toggle="modal"
						data-target="#showprofilemodal">
						<b><%=user.getUserName()%></b>
					</div>
				</li>

				<li class="nav-item active">
					<div class="nav-link" data-toggle="modal"
						data-target=".changepasswordmodal">
						<b>change password</b>
					</div>
				</li>
				<li class="nav-item active"><a class="nav-link"
					href="register.jsp"><b>Register</b></a></li>

				<li class="nav-item active"><a class="nav-link"
					href="login.jsp"><b>Login</b></a></li>
				<li class="nav-item active" data-toggle="modal"
					data-target=".logout-modal"><a class="nav-link" href="#"><b>Logout</b></a>
				</li>
			</ul>

			<%
			}

			else {
			%>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active">
					<div class="nav-link" data-toggle="modal"
						data-target=".forgetpasswordmodal">
						<b>Forget password</b>
					</div>
				</li>

				<li class="nav-item active"><a class="nav-link"
					href="register.jsp"><b>Register</b></a></li>

				<li class="nav-item active"><a class="nav-link"
					href="login.jsp"><b>Login</b></a></li>
			</ul>

			<%
			}
			%>

		</div>
	</div>
</nav>

<!-- show profile modal -->

<div class="modal fade" id="showprofilemodal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLongTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header custom-bg text-white text-center">
				<h5 class="modal-title" id="exampleModalLongTitle">MY PROFILE</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>

					<div class="container text-center">
						<img style="max-width: 200px" class="img-fluid rounded-circle"
							src="userProfilePic/<%if (user != null) {%><%=user.getUserPic()%><%}%>"
							alt="users_pic">
					</div>

					<div class="form-row mt-3">
						<div class="form-group col-md-4">
							<label for="inputEmail4">Name</label> <input type="text"
								class="form-control" id="inputEmail4"
								value="<%if (user != null) {%><%=user.getUserName()%><%}%>"
								readonly>
						</div>
						<div class="form-group col-md-4">
							<label for="inputPassword4">Email</label> <input type="email"
								class="form-control" id="inputPassword4"
								value="<%if (user != null) {%><%=user.getUserEmail()%><%}%>"
								readonly>
						</div>
						<div class="form-group col-md-4">
							<label for="txtuserid">Phone</label> <input type="text"
								class="form-control" id="txtuserid"
								value="<%if (user != null) {%><%=user.getUserPhone()%><%}%>"
								readonly>
						</div>
					</div>
					<div class="form-group">
						<label for="inputAddress">Address</label>
						<textarea class="form-control" id="inputAddress"
							placeholder="1234 Main St" rows="3" readonly>
							<%
							if (user != null) {
							%><%=user.getUserAddress()%>
							<%
							}
							%>
						</textarea>
					</div>

					<div class="container text-center">
						<button type="button" class="btn custom-bg text-light"
							data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!--  -->

<!-- show my cart modal -->

<div class="modal fade" id="showmycartmodal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header custom-bg text-white text-center">
				<h5 class="modal-title" id="exampleModalLongTitle">MY CART</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<%

			%>

		</div>

	</div>
</div>
</div>

<!--  -->



<!-- Logout modal -->

<div class="modal fade logout-modal" tabindex="-1" role="dialog"
	aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header custom-bg text-white text-center">
				<h5 class="modal-title" id="exampleModalLongTitle">Log Out</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<h5>Do you want to logout?</h5>

				<div class="text-center">
					<a href="LoginServlet"><button type="button"
							class="btn custom-bg text-white">Yes</button></a>
					<button type="button" class="btn btn-secondary ml-5"
						data-dismiss="modal">No</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- *********** -->

<!-- About us modal -->

<div class="modal fade aboutusmodal" tabindex="-1" role="dialog"
	aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header custom-bg text-white text-center">
				<h5 class="modal-title" id="exampleModalLongTitle">About Us</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container">
					<p style="font-size: 20px;">
						<b> An Produkte webApp, by definition, is a web application that
							allows you to save and retrieve tangible goods, digital products or
							services online by adding it manually. <br>
						<br> Development of this web application is still under construction but we promise to make
						it more advance.
						<BR><BR>
						<b>-VIVEK DHIMAN</b>
						</b>
					</p>
				</div>
			</div>
			<div class="modal-footer">
				<div class="text-center">
					<button type="button" class="btn custom-bg text-white"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ********** -->

<!-- Contact us modal -->

<div class="modal fade contactusmodal" tabindex="-1" role="dialog"
	aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header custom-bg text-white text-center">
				<h5 class="modal-title" id="exampleModalLongTitle">Contact Us</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container text-center">
					<p style="font-size: 23px;">
						<b> <img src="images/phonee.png" style="width: 27px;"
							alt="img">+91 6283415102 / +91 8283036601<br> <img
							src="images/emaill.png" style="width: 29px;" alt="img">vivekdhiman.developer@gmail.com
						</b>
					</p>
				</div>
			</div>
			<div class="modal-footer">
				<div class="text-center">
					<button type="button" class="btn custom-bg text-white"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ********** -->

<!-- change password modal -->

<div class="modal fade changepasswordmodal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header custom-bg text-white text-center">
				<h5 class="modal-title" id="exampleModalLongTitle">Change
					Password</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="LoginServlet" method="post">
					<input type="hidden" name="action" value="changePassword">

					<div class="form">


						<div class="form-group">
							<label for="inputPassword4">Password</label> <input
								type="password" class="form-control" id="pass" name="pass">
						</div>
						<div class="form-group">
							<label for="inputPassword4">Confirm Password</label> <input
								type="password" class="form-control" id="cpass" name="cpass">
						</div>
					</div>

					<div class="container text-center">

						<input type="submit" class="btn custom-bg text-light"
							value="Change">
						<button type="button" class="btn custom-bg text-light ml-5"
							data-dismiss="modal">Close</button>

					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<!--  -->

<!-- forget password modal -->

<div class="modal fade forgetpasswordmodal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header custom-bg text-white text-center">
				<h5 class="modal-title" id="exampleModalLongTitle">Forget
					Password</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="LoginServlet" method="post">
					<input type="hidden" name="action" value="forgetPassword">

					<div class="form">

						<div class="form-group ">
							<label for="inputPassword4">Email</label> <input type="email"
								class="form-control" id="email" name="email">
						</div>
						<div class="form-group ">
							<label for="inputPassword4">Phone</label> <input type="text"
								class="form-control" id="phone" name="phone">
						</div>
						<div class="form-group">
							<label for="inputPassword4">Password</label> <input
								type="password" class="form-control" id="pass" name="pass">
						</div>
						<div class="form-group">
							<label for="inputPassword4">Confirm Password</label> <input
								type="password" class="form-control" id="cpass" name="cpass">
						</div>
					</div>

					<div class="container text-center">

						<input type="submit" class="btn custom-bg text-light"
							value="Change">
						<button type="button" class="btn custom-bg text-light ml-5"
							data-dismiss="modal">Close</button>

					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<!--  -->

