<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="com.ojp.db.*"%>
<%@page import="com.ojp.dao.*"%>
<%@page import="com.ojp.entites.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="icon" href="pics/logo.png" type="image/x-icon">
<%@include file="AllComponent/allCss.jsp"%>  <!--add CSS file -->
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="AllComponent/navbar.jsp"%><br>   <!--add navbar -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2 class="text-center text-primary">All Jobs</h2>
				<c:if test="${not empty succMsg }">
					<div class="alert alert-success" role="alert">${succMsg}</div>
					<c:remove var="succMsg" />
				</c:if>

				<div class="card">
					<div class="card-body">
					
					    <!--form start -->
						<form class="form-inline" action="moreView.jsp" method="get">
							<div class="form=group col-md-5 mt-1">
								<h5>Location</h5>
							</div>
							<div class="form-group col-md-4 mt-1">
								<h5>Category</h5>
							</div>

							<div class="form-group col-md-5">
								<select name="loc" class="custom-select"
									id="inlineFormCustomSelectPref">
									<option selected value="lo">Choose...</option>
									<option value="Chittagong">Chittagong</option>
									<option value="Dhaka">Dhaka</option>
									<option value="Cumilla">Cumilla</option>
									<option value="Rajshahi">Rajshahi</option>
									<option value="Dinajpur">Dinajpur</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<select name="cat" class="custom-select"
									id="inlineFormCustomSelectPref">
									<option selected value="ca">Choose...</option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>
							<div class="text-center">
								<button class="btn btn-success">Search</button>
							</div>
						</form>
						<!--form end -->
						
						
					</div>
				</div>
				<%
				JobDao dao = new JobDao(ConnectionProvider.getConnection());
				List<Job> list = dao.getAllJobsForUser();
				for (Job j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-3x"></i>
						</div><br>
						<h3><%=j.getTittle()%></h3>
						<%
						if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
						%>
						<p><%=j.getDescription()%></p>
						<%
						} else {
						%>
						<p><%=j.getDescription().substring(0, 250)%>...
						</p>
						<%
						}
						%>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>" readonly>

							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory()%>" readonly>

							</div>
						</div>
						<h6 class="text-danger">
							Publish Date:
							<%=j.getPdate().toString()%></h6>
						<br>
						<div class="text-center">

							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">View More</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>



</body>
</html>