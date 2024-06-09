<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function updatevalidate() {

		let customerid = $("#customerid").val().trim();
		let ifsccode = $("#ifsccode").val().trim();
		let customername = $("#customername").val().trim();
		let accountnum = $("#accountnum").val().trim();
		let branchname = $("#branchname").val().trim();
		let address = $("#address").val().trim();
		let pannum = $("#pannum").val().trim();
		let aadharnum = $("#aadharnum").val().trim();
		let password = $("#password").val().trim();
		let status = $(".bankstatus:checked").val();

		console.log(customername);
		console.log(accountnum);
		console.log(branchname);
		console.log(address);
		console.log(pannum);
		console.log(aadharnum);
		console.log(password);
		console.log(status);

		let customererror = $("#customererror");
		let accountnumerror = $("#accountnumerror");
		let brancherror = $("#brancherror");
		let addresserror = $("#addresserror");
		let panerror = $("#panerror");
		let aadharnumerror = $("#aadharnumerror");
		let passworderror = $("#passworderror");
		let statuserror = $("#statuserror");

		customererror.css('display', 'none');
		accountnumerror.css('display', 'none');
		brancherror.css('display', 'none');
		addresserror.css('display', 'none');
		panerror.css('display', 'none');
		aadharnumerror.css('display', 'none');
		passworderror.css('display', 'none');
		statuserror.css('display', 'none');

		let isValid = true;

		if (customername.length < 1) {
			customererror.css('display', 'inline');
			isValid = false;
		}

		if (accountnum.length < 1) {
			accountnumerror.css('display', 'inline');
			isValid = false;
		}

		if (branchname.length < 1) {
			brancherror.css('display', 'inline');
			isValid = false;
		}

		if (address.length < 1) {
			addresserror.css('display', 'inline');
			isValid = false;
		}

		if (pannum.length < 1) {
			panerror.css('display', 'inline');
			isValid = false;
		}

		if (aadharnum.length < 1) {
			aadharnumerror.css('display', 'inline');
			isValid = false;
		}

		if (password.length < 1) {
			passworderror.css('display', 'inline');
			isValid = false;
		}

		if (!status) {
			statuserror.css('display', 'inline');
			isValid = false;
		}

		if (isValid) {
			$.ajax({
				type : "POST",
				data : "customername=" + customername + "&accountnum="
						+ accountnum + "&branchname=" + branchname
						+ "&address=" + address + "&pannum=" + pannum
						+ "&aadharnum=" + aadharnum + "&password=" + password
						+ "&status=" + status + "&customerid=" + customerid
						+ "&ifsccode=" + ifsccode,

				url : "updateuser",
				success : function(response) {
					$("#registerpage").html(response);
					let message = $("#msg1").val();

					alert("update status: " + message);
				}
			});
		}

		return false;

	}

	function validateregister() {
		let customername = $("#customername").val().trim();
		let accountnum = $("#accountnum").val().trim();
		let branchname = $("#branchname").val().trim();
		let address = $("#address").val().trim();
		let pannum = $("#pannum").val().trim();
		let aadharnum = $("#aadharnum").val().trim();
		let password = $("#password").val().trim();
		let status = $(".bankstatus:checked").val();

		let ifsccode = $("#ifsccode").val().trim();
		console.log(customername);
		console.log(accountnum);
		console.log(branchname);
		console.log(address);
		console.log(pannum);
		console.log(aadharnum);
		console.log(password);
		console.log(status);

		let ifscerror = $("#ifscerror");
		let customererror = $("#customererror");
		let accountnumerror = $("#accountnumerror");
		let brancherror = $("#brancherror");
		let addresserror = $("#addresserror");
		let panerror = $("#panerror");
		let aadharnumerror = $("#aadharnumerror");
		let passworderror = $("#passworderror");
		let statuserror = $("#statuserror");

		ifscerror.css('display', 'none');

		customererror.css('display', 'none');
		accountnumerror.css('display', 'none');
		brancherror.css('display', 'none');
		addresserror.css('display', 'none');
		panerror.css('display', 'none');
		aadharnumerror.css('display', 'none');
		passworderror.css('display', 'none');
		statuserror.css('display', 'none');

		let isValid = true;

		if (customername.length < 1) {
			customererror.css('display', 'inline');
			isValid = false;
		}

		if (accountnum.length < 1) {
			accountnumerror.css('display', 'inline');
			isValid = false;
		}
		if (ifsccode.length < 1) {
			ifscerror.css('display', 'inline');
			isValid = false;
		}

		if (branchname.length < 1) {
			brancherror.css('display', 'inline');
			isValid = false;
		}

		if (address.length < 1) {
			addresserror.css('display', 'inline');
			isValid = false;
		}

		if (pannum.length < 1) {
			panerror.css('display', 'inline');
			isValid = false;
		}

		if (aadharnum.length < 1) {
			aadharnumerror.css('display', 'inline');
			isValid = false;
		}

		if (password.length < 1) {
			passworderror.css('display', 'inline');
			isValid = false;
		}

		if (!status) {
			statuserror.css('display', 'inline');
			isValid = false;
		}

		if (isValid) {
			$.ajax({
				type : "POST",
				data : "customername=" + customername + "&accountnum="
						+ accountnum + "&branchname=" + branchname
						+ "&address=" + address + "&pannum=" + pannum
						+ "&aadharnum=" + aadharnum + "&password=" + password
						+ "&status=" + status + "&ifsccode=" + ifsccode,
				url : "insertuser",
				success : function(response) {
					$("#registerpage").html(response);
					let message = $("#msg").val();

					alert("Insert status: " + message);
				}
			});
		}

		return false;
	}

	function restrictNonNumericInput(event) {
		const charCode = event.charCode;
		const value = event.target.value;

		// Allow numeric characters (0-9)
		if (charCode >= 48 && charCode <= 57) {
			return true;
		}

		// Prevent non-numeric input
		event.preventDefault();
		return false;
	}

	function restrictToAlphabets(event) {
		const charCode = event.charCode;

		if ((charCode >= 65 && charCode <= 90)
				|| (charCode >= 97 && charCode <= 122)
				|| (charCode >= 48 && charCode <= 57)) {
			return true;
		}

		// Prevent non-alphabetic input
		event.preventDefault();
		return false;
	}

	function beforepage() {
		console.log("before page----");

		$.ajax({
			type : "POST",
			data : "",
			url : "adminpage",
			success : function(response) {
				$("#registerpage").html(response);

			}
		});

	}

	function backtologin() {
		$.ajax({
			type : "POST",
			data : " ",
			url : "login",
			success : function(response) {
				$("#registerpage").html(response);

			}
		});

	}
	
	
	
	
	
	function csvfiledownload() {
	    $.ajax({
	        type: "GET",
	        url: "csvfiledownload",
	        xhrFields: {
                responseType: 'blob' 
            },
            success: function(data, status, xhr) {
              
                var link = document.createElement('a');
                var blob = new Blob([data], { type: 'text/csv' });
                var url = window.URL.createObjectURL(blob);

               
                link.href = url;
                link.download = 'userimport.csv';

                
                document.body.appendChild(link);

                
                link.click();

                
                document.body.removeChild(link);
            },
            error: function(xhr, status, error) {
                console.error('Download failed:', status, error);
            }
        });
	    
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		    function uploadcsv() {
		        var fileInput = document.getElementById('csvFiles');
		        var files = fileInput.files;
		        if (files.length === 0) {
		            alert("Please select at least one file.");
		            return;
		        }

		        var formData = new FormData();
		        for (var i = 0; i < files.length; i++) {
		            var file = files[i];
		           
		            if (!file.name.endsWith(".csv")) {
		                alert("Please upload only CSV files.");
		                return;
		            }
		            if (file.size > 5 * 1024 * 1024) {
		                alert("File size should not exceed 5MB.");
		                return;
		            }
		            formData.append('files', file);
		        }

		        $.ajax({
		            type: "POST",
		            url: "uploadcsv",
		            data: formData,
		            processData: false,
		            contentType: false,
		            success: function(response) {
		                $("#registerpage").html(response);
		            }
		           
		        });
		    }

	
</script>
<style>
body {
	background-color: skyblue;
	font-family: "Times New Roman", Times, serif;
}

.registercontainer {
	background-color: white;
	padding: 12px;
	border: 5px solid grey;
	border-radius: 10px;
	margin-top: 20px;
	margin-top: 20px;
}

.error {
	text-align: center;
	color: red;
}

.buttonl {
	display: inline-block;
	padding: 5px 12px;
	font-size: 12px;
	color: white;
	background-color: #5000ff;
	text-align: center;
	text-decoration: none;
	border-radius: 5px;
	margin: 20px;
}
</style>
</head>
<body>
	<div>
		<div id="registerpage">

			<button type="button" onclick="beforepage()"
				class="btn btn-danger m-3">Back</button>
			<a class="float-end buttonl" onclick="backtologin()">LogOut</a>

			<div>
				<input type="hidden" value="${message1}" id="msg1">

			</div>
			<div class="container d-flex justify-content-center">
				<div class="registercontainer col-md-6">
					<h1 class="text-center text-secondary">
						<i class="fa fa-bank" style="font-size: 48px; color: red"></i>Welcome
						To Sweden Bank
					</h1>
					<form>
						<div class="mt-4 form-group row">
							<label class="col-md-3 col-form-label" for="customerid">Customer
								Id:</label>
							<div class="col-md-9">

								<c:choose>
									<c:when test="${editstatus=='N'}">
										<input type="text" class="form-control" id="customerid"
											value="${customerid}" readonly>
									</c:when>
									<c:when test="${editstatus=='E'}">
										<input type="text" class="form-control" id="customerid"
											value="${editcustomer.custid}" readonly>
									</c:when>
								</c:choose>

							</div>

						</div>

						<div class="mt-4 form-group row">
							<label class="col-md-3 col-form-label" for="customername">Customer
								Name:<span style="color: red;">*</span>
							</label>
							<div class="col-md-9">
								<c:choose>
									<c:when test="${editstatus=='N'}">
										<input type="text" class="form-control" id="customername">
									</c:when>
									<c:when test="${editstatus=='E'}">
										<input type="text" class="form-control" id="customername"
											value="${editcustomer.name}" readonly>
									</c:when>
								</c:choose>

							</div>
							<span style="display: none;" class="error" id="customererror">Please
								enter valid CustomerName*</span>
						</div>




						<!-- ifsc code new -->


						<div class="mt-4 form-group row">
							<label class="col-md-3 col-form-label" for="ifsccode">IFSC
								Code:<span style="color: red;">*</span>
							</label>
							<div class="col-md-9">
								<c:choose>
									<c:when test="${editstatus=='N'}">
										<input type="text" class="form-control" id="ifsccode">
									</c:when>
									<c:when test="${editstatus=='E'}">
										<input type="text" class="form-control" id="ifsccode"
											value="${editcustomer.ifsccode}" readonly>
									</c:when>
								</c:choose>

							</div>
							<span style="display: none;" class="error" id="ifscerror">Please
								enter valid IFSC Code*</span>
						</div>









						<div class="mt-4 form-group row">
							<label class="col-md-3 col-form-label" for="accountnum">Account
								Number:<span style="color: red;">*</span>
							</label>
							<div class="col-md-9">
								<c:choose>
									<c:when test="${editstatus=='N'}">
										<input type="text" class="form-control" id="accountnum"
											name="numberInput" pattern="[0-9]*" inputmode="numeric"
											title="Only numbers are allowed"
											onkeypress="restrictNonNumericInput(event)">
									</c:when>
									<c:when test="${editstatus=='E'}">
										<input type="text" class="form-control"
											value="${editcustomer.acno}" id="accountnum"
											name="numberInput" pattern="[0-9]*" inputmode="numeric"
											title="Only numbers are allowed"
											onkeypress="restrictNonNumericInput(event)" readonly>
									</c:when>
								</c:choose>

							</div>
							<span style="display: none;" class="error" id="accountnumerror">Please
								enter valid Account Number*</span>
						</div>



						<div class="mt-4 form-group row">
							<label class="col-md-3 col-form-label" for="branchname">Branch:<span
								style="color: red;">*</span></label>
							<div class="col-md-9">
								<select id="branchname" class="form-control">
									<optgroup label="Select Branch">
										<option value="${editcustomer.branch}">${editcustomer.branch}</option>
										<option value="chennai">Chennai</option>
										<option value="bangalore">Bangalore</option>
										<option value="mumbai">Mumbai</option>
										<option value="delhi">Delhi</option>
									</optgroup>

								</select>
							</div>
							<span style="display: none;" class="error" id="brancherror">Please
								Select valid Branch*</span>
						</div>













						<div class="mt-4 form-group row">
							<label class="col-md-3 col-form-label" for="address">Address:<span
								style="color: red;">*</span></label>
							<div class="col-md-9">
								<c:choose>
									<c:when test="${editstatus=='N'}">
										<textarea name="comments" rows="7" cols="20"
											class="form-control" id="address"></textarea>
									</c:when>
									<c:when test="${editstatus=='E'}">
										<textarea name="comments" rows="7" cols="20"
											class="form-control" id="address">
<c:out value="${editcustomer.address}" /></textarea>
									</c:when>
								</c:choose>
							</div>
							<span style="display: none;" class="error" id="addresserror">Please
								enter valid Address*</span>
						</div>




















						<div>
							<input type="hidden" value="${message}" id="msg">

						</div>
						<div class="mt-4 form-group row">
							<label class="col-md-3 col-form-label" for="pannum">Pan
								Number:<span style="color: red;">*</span>
							</label>
							<div class="col-md-9">
								<c:choose>
									<c:when test="${editstatus=='N'}">
										<input type="text" id="pannum" name="pannum"
											class="form-control"
											title="Only alphabets or numbers are allowed"
											onkeypress="restrictToAlphabets(event)">
									</c:when>
									<c:when test="${editstatus=='E'}">
										<input type="text" id="pannum" value="${editcustomer.panno}"
											name="pannum" class="form-control"
											title="Only alphabets or numbers are allowed"
											onkeypress="restrictToAlphabets(event)">
									</c:when>
								</c:choose>
							</div>
							<span style="display: none;" class="error" id="panerror">Please
								enter valid Pan Number*</span>
						</div>


						<div class="mt-4 form-group row">
							<label class="col-md-3 col-form-label" for="aadharnum">Aadhar
								Number:<span style="color: red;">*</span>
							</label>
							<div class="col-md-9">
								<c:choose>
									<c:when test="${editstatus=='N'}">
										<input type="text" class="form-control" id="aadharnum"
											name="aadharnum" pattern="[0-9]*" inputmode="numeric"
											title="Only numbers are allowed"
											onkeypress="restrictNonNumericInput(event)">
									</c:when>
									<c:when test="${editstatus=='E'}">
										<input type="text" class="form-control"
											value="${editcustomer.aadharno}" id="aadharnum"
											name="aadharnum" pattern="[0-9]*" inputmode="numeric"
											title="Only numbers are allowed"
											onkeypress="restrictNonNumericInput(event)">
									</c:when>
								</c:choose>
							</div>
							<span style="display: none;" class="error" id="aadharnumerror">Please
								enter valid Aadhar Number*</span>
						</div>

						<div class="mt-4 form-group row">
							<label class="col-md-3 col-form-label" for="password">Password:<span
								style="color: red;">*</span></label>
							<div class="col-md-9">
								<c:choose>
									<c:when test="${editstatus=='N'}">
										<input type="text" class="form-control" id="password">
									</c:when>
									<c:when test="${editstatus=='E'}">
										<input type="text" class="form-control" id="password"
											value="${editcustomer.password}">
									</c:when>
								</c:choose>
							</div>
							<span style="display: none;" class="error" id="passworderror">Please
								enter valid Password*</span>
						</div>



						<div class="mt-4 form-group row">
							<label class="col-md-3 col-form-label" for="status">Status:<span
								style="color: red;">*</span></label>
							<div class="col-md-9">
								<c:choose>
									<c:when test="${editstatus=='N'}">
										<input type="radio" class="form-check-input bankstatus"
											id="status" name="bankstatus" value="active" checked>Active
<input type="radio" class="form-check-input bankstatus" id="status"
											name="bankstatus" value="inactive">Inactive
</c:when>
									<c:when test="${editstatus=='E'}">
										<c:choose>
											<c:when test="${editcustomer.status=='active'}">
												<input type="radio" class="form-check-input bankstatus"
													id="status" name="bankstatus" value="active" checked>Active
<input type="radio" class="form-check-input bankstatus" id="status"
													name="bankstatus" value="inactive">Inactive
</c:when>
											<c:when test="${editcustomer.status=='inactive'}">
												<input type="radio" class="form-check-input bankstatus"
													id="status" name="bankstatus" value="active">Active
<input type="radio" class="form-check-input bankstatus" id="status"
													name="bankstatus" value="inactive" checked>Inactive
</c:when>
										</c:choose>
									</c:when>
								</c:choose>



							</div>
							<span style="display: none;" class="error" id="statuserror">Please
								Select valid Status*</span>
						</div>






						<div class="mt-5 d-flex justify-content-center">
							<c:choose>
								<c:when test="${editstatus=='N'}">
									<button type="button" onclick="validateregister()"
										class="btn btn-primary m-3">Register</button>
									<button type="reset" class="btn btn-primary m-3">Reset</button>


									<input type="file" id="csvFiles" class="btn btn-primary m-3"
										multiple />
									<button type="button" class="btn btn-primary m-3"
										onclick="uploadcsv()">Upload CSV</button>
										
										<button type="button" class="btn btn-primary m-3"
										onclick="csvfiledownload()">Download CSV</button>





								</c:when>

								<c:when test="${editstatus=='E'}">
									<button type="button" onclick="updatevalidate()"
										class="btn btn-primary m-3">Update</button>

								</c:when>
							</c:choose>
						</div>




					</form>
				</div>


			</div>

		</div>
	</div>

</body>
</html>