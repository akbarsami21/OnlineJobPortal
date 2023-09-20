<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Post Job</title>
<link rel="icon" href="pics/logo.png" type="image/x-icon">
<%@ include file="AllComponent/allCss.jsp"%>   <!--add CSS File -->
</head>
<body style="background-color: #64b5f6;">

     <!--java code -->
	<c:if test="${userobj.role ne 'admin' }">
		<c:redirect url="adminLogin.jsp"></c:redirect>
	</c:if>
	
	
	<%@ include file="AllComponent/navbar.jsp"%><br>  <!--add navbar -->

	<div class="container p-2">
		<div class="row justify-content-center">
			
			<div class="col-md-9">
				
				<div class="card">
					<div class="card-body">
						<div class="text-center text-success">
							<i class="fas fa-user-friends fa-3x"></i>
							<h3>Add Jobs</h3>
							<c:if test="${not empty SuccMsg }">
								<div class="alert alert-success" role="alert">${SuccMsg}</div>
								<c:remove var="SuccMsg" />
							</c:if>
						</div>
						
						
						<!--form start -->
						<form action="addJob" method="post">
							<div class="form-group">
								<label>Title</label> <input type="text" name="tittle" required
									class="form-control">
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label>Location</label> <select name="location"
										class="custom-select" id="inlineFormCustomSelectPref">
										<option selected>Choose...</option>
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
										<option selected>Choose...</option>
										<option value="IT">IT</option>
										<option value="Developer">Developer</option>
										<option value="Banking">Banking</option>
										<option value="Engineer">Engineer</option>
										<option value="Teacher">Teacher</option>
									</select>
								</div>

								<div class="form-group col-md-4">
									<label>Status</label> <select name="status"
										class="form-control">
										<option class="Active" value="Active">Active</option>
										<option class="Inactive" value="Inactive">Inactive</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label>Description</label>
								<textarea required rows="6" cols="" name="desc"
									class="form-control"></textarea>
							</div>
							<div class="text-center">
								<button class="btn btn-success">Publish Job</button>
							</div>
						</form>
						<!--form end -->
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<%@include file="AllComponent/footer.jsp"%>  <!--add footer -->

</body>
</html>
