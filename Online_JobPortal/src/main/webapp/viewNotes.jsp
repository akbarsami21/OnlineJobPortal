<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.ojp.db.*"%>
<%@ page import="com.ojp.dao.*"%>
<%@ page import="com.ojp.entites.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
User user3 = (User) session.getAttribute("userobj");
if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("succMsg", "Please Log In First!!!");
}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="img/logo.png" type="image/x-icon">
<style>
.text-p {
	line-height: 0.3;
}

.text-success {
	color: green;
}

.text-primary {
	color: blue;
}

.p-text {
	text-align: justify;
	max-width: 1100px;
	margin: 0 auto;
}

.red-text {
	color: red;
	font-weight: bold;
}
</style>
<meta charset="ISO-8859-1">
<title>View Notes</title>
<link rel="icon" href="pics/logo.png" type="image/x-icon">
<%@ include file="AllComponent/allCss.jsp"%>  <!--add CSS file -->
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="AllComponent/navbar.jsp"%>   <!--add navbar -->
	<%
	String updateMsg = (String) session.getAttribute("update-msg");
	if (updateMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=updateMsg%></div>
	<%
	session.removeAttribute("update-msg");

	}
	%>

	<%
	String wrongMsg = (String) session.getAttribute("wrong-msg");
	if (wrongMsg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=wrongMsg%></div>
	<%
	session.removeAttribute("wrong-msg");

	}
	%>


	<div class="container">
		<h1 class="text-center mt-4 "
			style="text-decoration: underline; font-weight: bold; font-style: italic;">
			All Notes</h1>

		<div class="row">
			<div class="col-md-12">
				<%
				if (user3 != null) {
					NotesDao ob = new NotesDao(ConnectionProvider.getConnection());
					List<Notes> post = ob.getData(user3.getId()); //method
					for (Notes po : post) {
				%>

				<div class="card mt-4 ">
					<img alt="" src="img/notes.png" class="card-img-top mt-3 mx-auto"
						style="max-width: 120px;">

					<div class="card-body p-4">
						<h5 class="card-tittle"><%=po.getTittle()%></h5>
						<p class="p-text"><%=po.getContent()%></p>
						<br>

						<p class="text-p">
							<b class="text-success">Published By&nbsp;&nbsp;&nbsp;&nbsp;:
								<%=user3.getName()%></b> <b class="text-primary"></b>
						</p>

						<p class="text-p">
							<b class="text-success">Published Date: <%=po.getPdate().toString()%></b>
							<b class="text-success"></b>

						</p>
						<br>
						<div class="container text-center mt-2">
							<a href="DeleteNotesServlet?note_id=<%=po.getId()%>"
								class="btn btn-danger">Delete</a> <a
								href="editNotes.jsp?note_id=<%=po.getId()%>"
								class="btn btn-primary">Edit</a>

						</div>
					</div>
					<%
					}
					}
					%>



				</div>
			</div>

		</div>
	</div>

</body>
</html>