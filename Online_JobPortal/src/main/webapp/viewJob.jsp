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
<title>View Job</title>
<link rel="icon" href="pics/logo.png" type="image/x-icon">
<%@include file="AllComponent/allCss.jsp"%>  <!--add CSS file -->
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${userobj.role ne 'admin' }">
		<c:redirect url="adminLogin.jsp"></c:redirect>
	</c:if>

	<%@include file="AllComponent/navbar.jsp"%>  <!--add navbar -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<br>
				<h2 class="text-center text-primary">All Jobs</h2><br>
				<c:if test="${not empty SuccMsg }">
					<div class="alert alert-success" role="alert">${SuccMsg}</div>
					<c:remove var="SuccMsg" />
				</c:if>
				<div class="card mt-2">
				
				
				
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
						</form><br>
						<!--form end -->
				
				
				
				</div>
				<%
				JobDao dao = new JobDao(ConnectionProvider.getConnection());
				List<Job> list = dao.getAllJobs();
				for (Job j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-3x"></i>
						</div><br>
						

						<h3><%=j.getTittle()%></h3><br>
						<pre><%=j.getDescription()%></pre>

						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory()%>" readonly>
							</div>

							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Status: <%=j.getStatus()%>" readonly>
							</div>
						</div>
						<h6 class="text-success">
							Publish Date:
							<%=j.getPdate()%></h6>
						<br>

						<div class="text-center">
							<a href="editJob.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">Edit</a> <a
								href="delete?id=<%=j.getId()%>"
								class="btn btn-sm bg-danger text-white">Delete</a>
						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>
		</div>
	</div>
<body>

</body>
</html>