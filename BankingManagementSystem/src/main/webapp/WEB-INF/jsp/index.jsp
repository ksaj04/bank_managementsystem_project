<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>

<meta charset="UTF-8">
<title>LogIn Form</title>
<script>

function validatelogin()
{
	let username=$("#username").val().trim();
	let password=$("#password").val().trim();
	console.log(username);
	console.log(password);
	
	let nameerror=$("#nameerror");
	let passworderror=$("#passworderror");
	isValid=true;
	
	nameerror.css('display','none');
	passworderror.css('display','none');
	
	if(username.length<1)
		{
		nameerror.css('display','inline');
		isValid=false;
		}
	if(password.length<1)
		{
		passworderror.css('display','inline');
		isValid=false;
		}
	
	if(isValid==true)
		{
		$.ajax({
			type:"POST",
		    data:"username="+username+"&password="+password,
		    url:"loginaccess",
			success:function(response){
				 $("#loginpage").html(response);
				 let message=$("#msg").val();
				 alert("LogIn Status "+message);
			}
		});
		
		
		}
	return false;
	}
</script>
<style>
body {
	background-image: url("image/bank.jpg");
	background-size: cover;
	background-repeat: no-repeat;
}

.login-container {
	background-color: #3B5998;
	padding: 20px;
	border: 5px solid #ffffff;
	border-radius: 15px;
	margin-top: 30px;
	opacity: 0.9;
}

.text-title {
	color: #343a40;
}

.text-white {
	color: #ffffff;
}

.btn-custom {
	background-color: #007bff;
	color: #ffffff;
}

.btn-custom:hover {
	background-color: #0056b3;
}

.error {
	color: white;
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<div id="loginpage">
			<h1 class="text-center text-title mt-5  text-white">
				<i class='fas fa-comment-dollar'
					style='font-size: 48px; color: white'></i>Welcome To Sweden Bank
			</h1>
			<div class="container float-start">
				<div class="login-container col-md-5">
					<h1 class="text-center text-white">LogIn Portal</h1>
					<form>
						<div class="mt-3 row form-group">
							<label class="col-md-3 col-form-label text-white" for="username">Customer
								Id:</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="username">
							</div>
							<span style="display: none;" class="error" id="nameerror">Please
								enter valid UserName*</span>
						</div>
						<div>
							<input type="hidden" value="${message}" id="msg">

						</div>
						<div class="mt-3 row form-group">
							<label class="col-md-3 col-form-label text-white" for="password">Password:</label>
							<div class="col-md-9">
								<input type="password" class="form-control" id="password">
							</div>
							<span style="display: none;" class="error" id="passworderror">Please
								enter valid Password*</span>
						</div>
						<div class="d-flex justify-content-center mt-3">
							<button type="button" class="btn btn-custom me-2"
								onclick="validatelogin()">LogIn</button>
							<button type="reset" class="btn btn-custom">Reset</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
