<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="icon" href="pics/logo.png" type="image/x-icon">
<%@include file="AllComponent/allCss.jsp"%>  <!--add CSS file -->
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
</style>
</head>
<body>
<c:if test="${userobj.role ne 'admin' }">
 <c:redirect url="adminLogin.jsp"></c:redirect>
</c:if>
	<%@include file="AllComponent/navbar.jsp"%>   <!--add navbar -->

	<div class="container-fluid back-img">
		<div
			class="text-center d-flex flex-column justify-content-center align-items-center">
			<h1 class="text-dark pt-5"
				style="font-size: 65px; font-weight: bold;">
				<i class="fa fa-book" aria-hidden="true"></i> Online Job Portal
			</h1>
		</div>
	</div>
	<%@include file="AllComponent/footer.jsp"%> <!--add footer -->
</body>
</html>