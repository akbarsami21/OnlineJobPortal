<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<style>
.bg-custom {
	background: #01579b;
}

.navbar .nav-item .nav-link {
	font-size: 20px;
	color: white;
}

.navbar .nav-item:hover .nav-link {
	background: white;
	color: black;
	border-radius: 10px;
}
</style>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

	<%-- <c:if test="${userobj.role eq 'user'}">
		<a class="navbar-brand" href="userProfile.jsp">JobPortal</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	</c:if>
	<c:if test="${userobj.role eq 'admin'}">
		<a class="navbar-brand" href="admin.jsp"><i
			class="fa-solid fa-star-half-stroke"></i>JobPortal</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	</c:if>--%>


     <!--java code -->
	<c:if test="${userobj.role ne 'user' && userobj.role ne 'admin'}">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-star-half-stroke"></i>JobPortal</a>
	</c:if>

	 

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><c:if
					test="${userobj.role ne 'user' && userobj.role ne 'admin'}">
					<a class="nav-link" href="index.jsp"><i
						class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a>
				</c:if> <c:if test="${userobj.role eq 'user'}">
					<a class="nav-link" href="userProfile.jsp"><i
						class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span>
					</a>
					<li class="nav-item"><a class="nav-link" href="addNotes.jsp"><i
							class="fa-solid fa-circle-plus"></i> Add Notes</a></li>

					<li class="nav-item"><a class="nav-link" href="viewNotes.jsp"><i
							class="fa-solid fa-eye"></i> View Notes</a></li>
					<li class="nav-item"><a class="nav-link"
						href="userChngPass.jsp"><i class="fa-solid fa-lock"></i>
							Change Password</a></li>
                  
                  
                  
                  
                   <!--admin navbar -->
				</c:if> <c:if test="${userobj.role eq 'admin'}">
					<a class="nav-link" href="admin.jsp"><i
						class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span>
					</a>
				</c:if></li>


             
			<c:if test="${userobj.role eq 'admin'}">
				<li class="nav-item"><a class="nav-link" href="addJob.jsp"><i
						class="fa-solid fa-circle-plus"></i> Post Job</a></li>

				<li class="nav-item"><a class="nav-link" href="viewJob.jsp"><i
						class="fa-solid fa-eye"></i> View Job</a></li>

				<li class="nav-item"><a class="nav-link"
					href="adminChngPass.jsp"><i class="fa-solid fa-lock"></i>
						Change Password</a></li>

			</c:if>
			
			
			

		</ul>
		
		
		<!--admin information java code -->
		<form class="form-inline my-2 my-lg-0">
			<c:if test="${userobj.role eq 'admin'}">
				<a href="#" class="btn btn-light mr-1" data-toggle="modal"
					data-target="#exampleModal1"><i class="fa fa-user-circle"
					aria-hidden="true"></i> Admin</a>

				<a href="Adminlogout" class="btn btn-light"><i
					class="fa fa-sign-in-alt" aria-hidden="true"></i> LogOut</a>

			</c:if>
			
			
             <!--user information java code -->
			<c:if test="${userobj.role eq 'user'}">
				<a href="#" class="btn btn-light mr-1" data-toggle="modal"
					data-target="#exampleModal"><i class="fa fa-user-circle"
					aria-hidden="true"></i> ${userobj.name}</a>

				<a href="logout" class="btn btn-light"><i
					class="fa fa-sign-in-alt" aria-hidden="true"></i> LogOut</a>

			</c:if>

			<c:if test="${empty userobj}">
				<div>
					<a href="adminSignup.jsp" class="btn btn-light"><i
						class="fa fa-user-plus" aria-hidden="true"></i> Admin SignUp</a> <a
						href="adminLogin.jsp" class="btn btn-light mr-1"><i
						class="fa fa-user-circle" aria-hidden="true"></i> Admin LogIn</a>
				</div>
			</c:if>



		</form>
	</div>
</nav>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<div class="text-center text-primary">
							<img src="pics/${userobj.pic}" class="img-fluid"
								style="border-radius: 52%; max-width: 150px;"><br> <br>
						</div>
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">Name</th>
									<td>${userobj.name}</td>
								</tr>
								<tr>
									<th scope="row">Qualification</th>
									<td>${userobj.qualification}</td>
								</tr>
								<tr>
									<th scope="row">Address</th>
									<td>${userobj.address}</td>
								</tr>
								<tr>
									<th scope="row">Email</th>
									<td>${userobj.email}</td>
								</tr>
								<tr>
									<th scope="row">Date Of Birth</th>
									<td>${userobj.dob}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="editProfile.jsp" class="btn btn-primary">Edit</a>
			</div>
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<div class="text-center text-primary">
							<img src="pics/${userobj.pic}" class="img-fluid"
								style="border-radius: 52%; max-width: 150px;"><br> <br>
						</div>
						<table class="table">
							<tbody>

								<tr>
									<th scope="row">Admin ID</th>
									<td>${userobj.adminId}</td>
								</tr>


								<tr>
									<th scope="row">Name</th>
									<td>${userobj.name}</td>
								</tr>

								<tr>
									<th scope="row">Address</th>
									<td>${userobj.address}</td>
								</tr>
								<tr>
									<th scope="row">Email</th>
									<td>${userobj.email}</td>
								</tr>
								<tr>
									<th scope="row">Date Of Birth</th>
									<td>${userobj.dob}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>


		</div>
	</div>
</div>



