<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ojp.db.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"> 
<title>Home</title>
<link rel="icon" href="pics/logo.png" type="image/x-icon">
<%@include file="AllComponent/allCss.jsp"%>   <!--add CSS file -->
<style>
.back-img {
	background: url("img/jbp_bg2.jpg");
	width: 100%;
	height: 78vh;
	background-repeat: no-repeat;
	background-size: cover;
}

.container-fluid.back-img {
	height: 78vh;
}

.text-center {
	height: 100%;
}

.button-container {
	display: flex;
	gap: 10px;
}

.button-container {
	display: inline-block;
	margin-top: 10px;
}
</style>
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%>  <!--add navbar -->

	<div class="container-fluid back-img">
		<div
			class="text-center d-flex flex-column justify-content-center align-items-center">
			<h1 class="text-dark pt-5"
				style="font-size: 65px; font-weight: bold;">
				<i class="fa fa-book" aria-hidden="true"></i> Online Job Portal
			</h1>
			<br>
			
			<!--java code -->
			<c:if test="${empty userobj}">
				<div class="button-container">
					<a href="signup.jsp" class="btn btn-light mr-1"><i
						class="fa fa-user-plus" aria-hidden="true"></i> User SignUp</a> <a
						href="login.jsp" class="btn btn-light mr-1"><i
						class="fa fa-user-circle" aria-hidden="true"></i> User LogIn</a>
				</div>
			</c:if>

		</div>

	</div>


	<%@include file="AllComponent/footer.jsp"%>  <!--add footer -->
</body>
</html>