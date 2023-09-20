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
<title>View Single Job</title>
<link rel="icon" href="pics/logo.png" type="image/x-icon">
<%@include file="AllComponent/allCss.jsp"%>   <!--add CSS file -->
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="AllComponent/navbar.jsp"%>   <!--add navbar -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<%
				int id = Integer.parseInt(request.getParameter("id"));
				JobDao dao = new JobDao(ConnectionProvider.getConnection());
				Job j = dao.getJobById(id);
				%>
				<div class="card mt-5">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-3x"></i>
						</div><br>
						<h3><%=j.getTittle()%></h3><br>
						<pre><%=j.getDescription()%></pre>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control from-control-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>

							<div class="form-group col-md-3">
								<input type="text" class="form-control from-control-sm"
									value="Category: <%=j.getCategory()%>" readonly>
							</div>
						</div>
						<h6 class="text-danger">
							Publish Date:
							<%=j.getPdate().toString()%></h6>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>