<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>

function edituser(regid)
{
	
	console.log("inside edituser----");
	console.log(regid);
	$.ajax({
		type:"POST",
	    data:"regid="+regid,
	    url:"edituser",
		success:function(response){
			 $("#adminportal").html(response);
			
		}
	});
	
	
	
	
}

function beforepage()
{
	console.log("before page----");
	
    $.ajax({
        type: "POST",
        data: "",
        url: "adminpage",
        success: function(response) {
            $("#adminportal").html(response);
           
        }
    });
	
	
	}
function backtologin()
{
	$.ajax({
		type : "POST",
		data : " ",
		url : "login",
		success : function(response) {
			$("#adminportal").html(response);
			
		}
	});
	
	
}


function csvdownload() {
    $.ajax({
        type: "GET",
        url: "csvdownload",
        xhrFields: {
            responseType: 'blob' // Ensure the response is treated as binary data (Blob)
        },
        success: function(response, status, xhr) {
            // Extract filename from the Content-Disposition header
            var filename = "";
            var disposition = xhr.getResponseHeader('Content-Disposition');
            if (disposition && disposition.indexOf('attachment') !== -1) {
                var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
                var matches = filenameRegex.exec(disposition);
                if (matches != null && matches[1]) {
                    filename = matches[1].replace(/['"]/g, '');
                }
            }

            // Create a link element and trigger a download
            var link = document.createElement('a');
            var url = window.URL.createObjectURL(response);
            link.href = url;
            link.download = filename || 'download.csv';
            document.body.appendChild(link);
            link.click();
            setTimeout(function() {
                document.body.removeChild(link);
                window.URL.revokeObjectURL(url);
            }, 100); // Clean up
        },
        error: function(xhr, status, error) {
            console.error("Failed to download file: ", error);
        }
    });
}


function exceldownload() {
    $.ajax({
        type: "GET",
        url: "downloadExcel", // Replace with the correct URL
        xhrFields: {
            responseType: 'blob' // Important for handling binary data
        },
        success: function (response, status, xhr) {
            var filename = "data.xlsx"; // Default filename
            var disposition = xhr.getResponseHeader('Content-Disposition');

            if (disposition && disposition.indexOf('attachment') !== -1) {
                var matches = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/.exec(disposition);
                if (matches != null && matches[1]) {
                    filename = matches[1].replace(/['"]/g, '');
                }
            }

            var blob = new Blob([response], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
            var link = document.createElement('a');
            link.href = window.URL.createObjectURL(blob);
            link.download = filename;
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        },
        error: function (error) {
            // Handle any errors here
            console.error("Error downloading Excel file:", error);
        }
    });
}



</script>

<style>
body {
	font-family: "Times New Roman", Times, serif;
	font-size: 14px;
	/* background-image: url("image/adminpo.jpg"); */
	/*     background-size: cover; */
	/*     background-repeat: no-repeat; */
	background: #ADD8E6;
	color: black;
}

.buttonl {
	display: inline-block;
	padding: 5px 10px;
	font-size: 10px;
	color: white;
	background-color: grey;
	text-align: center;
	text-decoration: none;
	border-radius: 5px;
	margin:10px;
}
</style>


</head>
<body>
	<div>
		<div id="adminportal">
			<div class="container">
<div>
				<input type="hidden" value="${message1}" id="msg1">

			</div>
				<h1 class="text-dark text-center" style="font-size: 40px;">Welcome
					To Admin Portal</h1>
				<button type="button" onclick="beforepage()"
					class="btn btn-secondary m-3">Back</button>
				<a class="float-end buttonl" onclick="backtologin()">LogOut</a>
				
				<a class="float-end buttonl" onclick="csvdownload()">CSV</a>
				<a class="float-end buttonl" onclick="exceldownload()">Excel</a>

				<div class="row mt-4 ">
					<div class="form-group">
						<label class="col-md-2 col-form-label text-dark"
							style="font-size: 14px;" for="totalcust">Total Customers:</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="totalcust"
								value="${totalcust}" readonly>
						</div>
						<label class="col-md-2 col-form-label text-dark"
							style="font-size: 14px;" for="totalactivecust">Total
							Active Customers:</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="totalactivecust"
								value="${noofactive}" readonly>
						</div>
						<label class="col-md-2 col-form-label text-dark"
							style="font-size: 14px;" for="totalinactivecust">Total
							Inactive Customers:</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="totalinactivecust"
								value="${noofinactive}" readonly>
						</div>

					</div>
					<div class="form-group">
						<label class="col-md-2 col-form-label text-dark" for="totalsaving"
							style="font-size: 14px;">Total Customer Savings:</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="totalsaving"
								value="${totalcustsav}" readonly>
						</div>
						<label class="col-md-2 col-form-label text-dark" for="totalsaving"
							style="font-size: 14px;">Total Active Customer Savings:</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="totalsaving"
								value="${activbalance}" readonly>
						</div>
						<label class="col-md-2 col-form-label text-dark" for="totalsaving"
							style="font-size: 14px;">Total Inactive Customer Savings:</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="totalsaving"
								value="${inactivbalance}" readonly>
						</div>

					</div>
				</div>




			</div>
			<div class="container mt-4  col-md-13">
				<h1 class="text-center text-dark">Customer Details</h1>
				<table class="table table-hover" id="dataTable">
					<thead>
						<tr>
							<th>S.No</th>
							<th>Customer_Id</th>
							<th>Customer_Name</th>
							<th>Account Number</th>
							<th>Pan Number</th>
							<th>Password</th>
							<th>Account Balance</th>
							<th>Branch</th>
							<th>Address</th>
							<th>Aadhar_No</th>
							<th>IFSC_Code</th>
							<th>Status</th>
							<th>Edit</th>

						</tr>
					</thead>

					<tbody>

						<c:forEach items="${customerdetails}" var="customer"
							varStatus="custindex">
							<tr>
								<td>${custindex.index+1}</td>
								<td>${customer.custid}</td>
								<td>${customer.name}</td>
								<td>${customer.acno}</td>
								<td>${customer.panno}</td>
								<td>${customer.password}</td>
								<td>${customer.accbalance}</td>
								<td>${customer.branch}</td>
								<td>${customer.address}</td>
								<td>${customer.aadharno}</td>
								<td>${customer.ifsccode}</td>

								<td>${customer.status}</td>
								<td><i class="fa fa-edit"
									style="font-size: 20px; color: blue"
									onclick="edituser(${customer.custid});"></i></td>
							</tr>
						</c:forEach>





					</tbody>




				</table>



			</div>

		</div>

	</div>
</body>
</html>