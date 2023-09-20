<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<link rel="icon" href="pics/logo.png" type="image/x-icon">
<%@include file="AllComponent/allCss.jsp"%>   <!--add CSS file -->
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@ include file="AllComponent/navbar.jsp"%><br>  <!--add navbar -->
	<div class="container-fluid ">
		<div class="row p-4 ">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Edit Profile</h5>
						</div>
						
						<!--form start -->
						<form action="updateProfile" method="post">
							<input type="hidden" name="id" value="${userobj.id }">
							<div class="form-group">
								<label>Name</label> <input type="text" required="required"
									class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="name"
									value="${userobj.name}">
							</div>

							<div class="form-group">
								<label>Qualification</label> <input type="text"
									required="required" class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="qualification"
									value="${userobj.qualification }">
							</div>

							<div class="form-group">
								<label>Address</label> <input type="text" required="required"
									class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="address"
									value="${userobj.address }">
							</div>


							<div class="form-group">
								<label>Email</label> <input type="email" required="required"
									class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="email"
									value="${userobj.email }">
							</div>

							<div class="form-group">
								<label>Date Of Birth</label> <input type="date"
									required="required" class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="dob" value="${userobj.dob }">
							</div>



							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Update</button>
						</form>
						
						<!--form end -->
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 50px;">
		<%@include file="AllComponent/footer.jsp"%>  <!--add footer -->
	</div>

</body>
</html>