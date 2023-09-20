<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
<link rel="icon" href="pics/logo.png" type="image/x-icon">
<%@include file="AllComponent/allCss.jsp"%>  <!--add CSS file -->
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${empty userobj}">
		<c:redirect url="adminLogin.jsp"></c:redirect>
	</c:if>
	<%@ include file="AllComponent/navbar.jsp"%><br>  <!--add navbar -->
	<div class="container-fluid ">
		<div class="row p-4 ">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa-solid fa-lock fa-3x"></i>
							<h5>Change Password</h5>
						</div>
						<br>
						<c:if test="${not empty succMsg }">
							<div class="alert alert-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" />
						</c:if>
						
						
						<!--form start -->
						<form action="adminChangePass" method="post">
							<input type="hidden" name="id" value="${userobj.id }">
							<div class="form-group">
								<label>Old Password</label> <input type="password"
									required="required" class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="">
							</div>

							<div class="form-group">
								<label>New Password</label> <input type="password"
									required="required" class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="">
							</div>

							<div class="form-group">
								<label>Confirm Password</label> <input type="password"
									required="required" class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="password">
							</div>


							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Change
								Password</button>
						</form>
						<!--form end -->
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 50px;">
		<%@include file="AllComponent/footer.jsp"%> <!--add footer -->
	</div>

</body>
</html>