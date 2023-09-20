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
<title>Edit Job</title>
<link rel="icon" href="pics/logo.png" type="image/x-icon">
<%@include file="AllComponent/allCss.jsp"%>   <!--add CSS file -->
</head>
<body style="background-color: #64b5f6;">
	<c:if test="${userobj.role ne 'admin' }">
		<c:redirect url="adminLogin.jsp"></c:redirect>
	</c:if>

	<%@include file="AllComponent/navbar.jsp"%><br>  <!--add navbar -->

	<div class="container p-2">
		<div class="col-md offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">

						<i class="fas fa-user-friends fa-3x"></i>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						JobDao dao = new JobDao(ConnectionProvider.getConnection());
						Job j = dao.getJobById(id);
						%>

						<h3>Edit Jobs</h3>

					</div>
					
					
					<!--form start -->
					<form action="updateJob" method="post">
						<input type="hidden" value="<%=j.getId()%>" name="id">
						<div class="form-group">
							<label>Tittle</label><input type="text" name="tittle" required
								class="form-control" value="<%=j.getTittle()%>">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option value="<%=j.getLocation()%>"><%=j.getLocation()%></option>
									<option value="Chittagong">Chittagong</option>
									<option value="Dhaka">Dhaka</option>
									<option value="Cumilla">Cumilla</option>
									<option value="Rajshahi">Rajshahi</option>
									<option value="Dinajpur">Dinajpur</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Category</label> <select name="category"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option value="<%=j.getCategory()%>"><%=j.getCategory()%></option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Status</label> <select name="status" class="form-control">
									<option class="Active" value="<%=j.getStatus()%>"><%=j.getStatus()%></option>
									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>Description</label>
							<textarea required rows="6" cols="" name="desc"
								class="form-control"><%=j.getDescription()%></textarea>
						</div>
						<div class="text-center">
						<button class="btn btn-success" >Update Job</button>
						</div>
					</form>
					<!--form end -->
					
				</div>
			</div>
		</div>
	</div>
	<br><br>

	<%@include file="AllComponent/footer.jsp"%> <!--add footer -->

</body>
</html>