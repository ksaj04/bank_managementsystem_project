<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	function redirectadmin() {
		let user = $("#user").val();

		if (user.length > 1) {

			$.ajax({
				type : "POST",
				data : "user=" + user,
				url : "usercreation",
				success : function(response) {
					$("#admin").html(response);

				}
			});
		}

		return false;

	}

	function redirectadmin2() {
		let portal = $("#portal").val();

		if (portal.length > 1) {

			$.ajax({
				type : "POST",
				data : "portal=" + portal,
				url : "adminportal",
				success : function(response) {
					$("#admin").html(response);

				}
			});
		}

		return false;

	}
</script>








<style>
body {
	background-image: url("image/admin.jpg");
	height: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.login-containe {
	/*     background-color: #4285F4;  */
	padding: 30px;
	/*     border: 5px solid #ffffff;  */
	border-radius: 15px;
	margin-top: 90px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

button {
	margin: 8px;
}
</style>
</head>
<body>






	<div>
		<div id="admin">
			<h1 class="float-end text-title mt-5  text-white">
				<i class='fas fa-comment-dollar'
					style='font-size: 48px; color: white'></i>Welcome To Sweden Bank
			</h1>
			<div class="container d-flex justify-content-center">
				<div class="login-containe col-md-6">
					<h1 class="text-center text-white">Welcome Admin</h1>

					<button class="btn btn-info" value="usercreation" id="user"
						onclick="redirectadmin()">User Creation</button>
					<button class="btn btn-danger" value="adminportal" id="portal"
						onclick="redirectadmin2()">Admin Portal</button>



				</div>
				<div>
					<input type="hidden" value="${message}" id="msg">

				</div>
			</div>
		</div>
	</div>


</body>
</html>