<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User user1 = (User) session.getAttribute("userobj");
if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("succMsg", "Please Log In First!!!");
}
%>
<%@page import="com.ojp.db.*"%>
<%@page import="com.ojp.dao.*"%>
<%@page import="com.ojp.entites.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="img/logo.png" type="image/x-icon">
<style>
body {
	background: url("img/jbp_bg1.jpg");
	width: 100%;
	height: 95vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<link rel="icon" href="pics/logo.png" type="image/x-icon">
<%@include file="AllComponent/allCss.jsp"%>   <!--add CSS file -->
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%>  <!--add navbar -->
	<div class="container-fluid ">

		<h1 class="text-center mt-4"
			style="text-decoration: underline; font-weight: bold; font-style: italic;">
			Add Your Notes</h1>
		<br>
		<div class="container ">
			<div class="row">
				<div class="col-md-12">


                     <!--form start -->
					<form action="AddNotesServlet" method="post">
						<div class="form-group">
							<%
							User us = (User) session.getAttribute("userobj");
							if (us != null) {
							%>
							<input type="hidden" value=<%=us.getId()%> name="uid">
							<%
							}
							%>


							<label for="exampleInputEmail1">
								<h6>Enter Tittle</h6>
							</label> <input type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="" name="tittle"
								required="required">

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1"><h6>Enter Content</h6></label>
							<textarea rows="9" cols="" class="form-control" name="content"
								required="required"></textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Add Notes</button>
						</div>

					</form>
					<!--form end -->

				</div>
			</div>
		</div>
	</div>
	<br>

	<%@include file="AllComponent/footer.jsp"%> <!--add footer -->
</body>
</html>