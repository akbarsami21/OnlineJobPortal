<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: Sign Up</title>
<link rel="icon" href="pics/logo.png" type="image/x-icon">
<%@include file="AllComponent/allCss.jsp"%>  <!--add CSS file -->

<style>
.back-img {
	background: url("img/jbp_bg1.jpg");
	width: 100%;
	height: 145vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%>  <!--add navbar -->
	<div class="container-fluid back-img">
		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>User Registration Form</h4>
					</div>
					
					<c:if test="${not empty SuccMsg }">
                                <div class="alert alert-success" role="alert">${SuccMsg}</div>
                                <c:remove var="SuccMsg" />
                            </c:if>




					<div class="card-body">
					
					
					     <!--form start -->
						<form action="register" method="post">
							<div class="form-group">
								<label>Name</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="user_name">

							</div>

							<div class="form-group">
								<label>Qualification</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="user_qua">


							</div>
							<div class="form-group">
								<label for="gender">Select Gender</label> <br> <input
									type="radio" id="gender" name="gender" value="male">Male
								<input type="radio" id="gender" name="gender" value="female">FeMale
							</div>
							<div class="form-group">
								<label>Address</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="user_address">

							</div>
							<div class="form-group">
								<label>Email</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="user_email">

							</div>
							<div class="form-group">
								<label for="date_of_birth">Date of Birth</label> <input
									type="date" class="form-control" id="date_of_birth"
									placeholder="YYYY-MM-DD" name="user_dob">
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="user_password">
							</div>
							<div class="form-group">
								<label for="pic">Picture</label> <input type="file"
									class="form-control" id="pic" name="user_pic">
							</div>
							<br>


							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Sign up</button>
						</form>
						<!--form end -->

					</div>
				</div>

			</div>
		</div>
	</div>

	<%@include file="AllComponent/footer.jsp"%>  <!--add footer -->
</body>
</html>