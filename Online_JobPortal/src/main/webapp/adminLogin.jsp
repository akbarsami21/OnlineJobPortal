<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Login</title>
<link rel="icon" href="pics/logo.png" type="image/x-icon">
<%@include file="AllComponent/allCss.jsp"%>  <!--add CSS file -->
<style>


.red-text {
	color: red;
	font-weight: bold;
}
</style>
</head>
<body style="background-color: #b388ff;">
	<%@include file="AllComponent/navbar.jsp"%>  <!--add navbar -->
	<div class="container-fluid back-img">
		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Admin Log in</h4>
					</div>

					<c:if test="${not empty succMsg }">
						<div class="alert alert-success" role="alert">${succMsg}</div>
						<c:remove var="succMsg" />
					</c:if>


					<div class="card-body">
					
					    <!--form start -->
						<form action="AdminLogIn" method="post">
						<div class="form-group">
								<label>Admin ID</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="adminid">

							</div>

							<div class="form-group">
								<label>Email</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="adminemail">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="adminpassword">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Log in</button>
						</form>
						<!--form end -->
						

					</div>
				</div>

			</div>
		</div>
	</div><br><br><br>
	<%@include file="AllComponent/footer.jsp"%>  <!--add footer --> 
</body>
</html>