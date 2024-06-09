<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>

<html lang="en">
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
	function validate() {
		let accno = $("#accno").val().trim();
		let ifsccode = $("#ifsccode").val().trim();
		let reciname = $("#reciname").val().trim();
		let amount = $("#amount").val().trim();

		console.log(accno);
		console.log(ifsccode);
		console.log(reciname);
		console.log(amount);

		let accnoerror = $("#accnoerror");
		let ifscerror = $("#ifscerror");
		let nameerror = $("#nameerror");
		let transfererror = $("#transfererror");

		accnoerror.css('display', 'none');
		ifscerror.css('display', 'none');
		nameerror.css('display', 'none');
		transfererror.css('display', 'none');

		isValid = true;

		if (accno.length < 1) {
			accnoerror.css('display', 'inline');
			isValid = false;
		}
		if (ifsccode.length < 1) {
			ifscerror.css('display', 'inline');
			isValid = false;
		}
		if (reciname.length < 1) {
			nameerror.css('display', 'inline');
			isValid = false;
		}
		if (amount.length < 1) {
			transfererror.css('display', 'inline');
			isValid = false;
		}
		if (isValid == true) {

			$.ajax({
				type : "POST",
				data : "accno=" + accno + "&ifsccode=" + ifsccode
						+ "&reciname=" + reciname + "&amount=" + amount,
				url : "reciepienttransfer",
				success : function(response) {
					$("#userpage").html(response);
					let message = $("#msg1").val();

					alert("Transfer status: " + message);
				}
			});

		}

		return false;

	}

	function backtologin() {
		$.ajax({
			type : "POST",
			url : "login",
			success : function(response) {
				$("#userpage").html(response);

			}
		});

	}

	function custtransvalidation() {
		let startdate = $("#startdate").val();
		let enddate = $("#enddate").val();

		if (startdate.trim() === "") {
			alert("please provide From date");
			return false;
		}
		if (enddate.trim() === "") {
			alert("please provide To date");
			return false;
		}

		let startDateObj = new Date(startdate);
		let endDateObj = new Date(enddate);

		if (startDateObj >= endDateObj) {
			alert("End date should be after start date.");
			return false;
		}

		if (startdate != null && startdate != undefined && enddate != null
				&& enddate != undefined) {

			$.ajax({
				type : "POST",
				url : "custrans",
				data : "startdate=" + startdate + "&enddate=" + enddate,
				success : function(response) {
					$("#transactioncust").html(jQuery(response).find("#transactioncust").html());

				}
			});
		} else {
			alert("please provide valid dates");
		}

		return false;

	}

	function accountinfo() {
		$.ajax({
			type : "POST",
			url : "accountinfo",
			success : function(response) {
				$("#userpage").html(response);

			}
		});

	}

	function checkbalance() {

		$.ajax({
			type : "POST",
			url : "checkbalance",
			success : function(response) {
				$("#userpage").html(response);

			}
		});

	}

	function transfermoney() {
		$.ajax({
			type : "POST",
			url : "transfermoney",
			success : function(response) {
				$("#userpage").html(response);

			}
		});

	}

	function todaytrans() {
		$.ajax({
			type : "POST",
			url : "todaytrans",
			success : function(response) {
				$("#userpage").html(response);

			}
		});

	}

	function oneweek() {
		$.ajax({
			type : "POST",
			url : "oneweektrans",
			success : function(response) {
				$("#userpage").html(response);

			}
		});

	}

	function thisweek() {
		$.ajax({
			type : "POST",
			url : "thisweektrans",
			success : function(response) {
				$("#userpage").html(response);

			}
		});

	}

	function onemonth() {
		$.ajax({
			type : "POST",
			url : "onemonthtrans",
			success : function(response) {
				$("#userpage").html(response);

			}
		});

	}
	function thismonth() {
		$.ajax({
			type : "POST",
			url : "thismonthtrans",
			success : function(response) {
				$("#userpage").html(response);

			}
		});

	}

	function customdetails() {
		$.ajax({
			type : "POST",
			url : "customdetailstrans",
			success : function(response) {
				$("#userpage").html(response);

			}
		});

	}

	function transactiondetails() {
		$.ajax({
			type : "POST",
			url : "transactiondetails",
			success : function(response) {
				$("#userpage").html(response);

			}
		});

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
</script>
<style>
body {
	background: white;
}

.nav {
	cursor: pointer;
}

.nav-link.active {
	background-color: #b2babb;
	border-radius: 10px;
}

.acountinfo {
	background-color: #884ea0;
	padding: 12px;
	border-radius: 10px;
	margin-top: 20px;
	margin-top: 20px;
	color: white;
}

.transact {
	background-color: #884ea0;
	margin-top: 20px;
	margin-bottom: 20px;
	color: white;
	border-radius: 10px;
}

.error {
	text-align: center;
	color: white;
}

.buttonl {
	display: inline-block;
	padding: 8px 17px;
	font-size: 16px;
	color: white;
	background-color: red;
	text-align: center;
	text-decoration: none;
	border-radius: 5px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div>
		<div id="userpage">
			<div class="container">
				<button type="button" onclick="backtologin()"
					class="btn btn-secondary float-end m-3">LogOut</button>
				<!--   <a href="" class="float-end buttonl" onclick="backtologin()">LogOut</a> -->
				<div class="row" id="upperpart">
					<div class="d-flex justify-content-between align-items-center">
						<h1 class="text-center text-secondary">Welcome To Sweden Bank</h1>

					</div>
					<div>
						<input type="hidden" value="${msg}" id="msg1">

					</div>
					<div>
						<input type="hidden" value="${message}" id="msg">

					</div>
					<h1 class="mt-3 text-center text-primary">
						Hi
						<c:out value="${user.name}" default="No message available" />
						[
						<c:out value="${user.custid}" default="No message available" />
						]
					</h1>
					<nav
						class="navbar navbar-expand-sm bg-primary navbar-dark mt-3 nav">
						<div class="container-fluid">
							<ul class="navbar-nav d-flex justify-content-around w-100">
								<li class="nav-item mx-3"><c:if
										test="${userstatus=='accountinformation'}">
										<a class="nav-link active" onclick="accountinfo()"> <i
											class="fa fa-info-circle"></i> Account Information
										</a>
									</c:if> <c:if test="${userstatus!='accountinformation'}">
										<a class="nav-link" style="color: white;"
											onclick="accountinfo()"> <i class="fa fa-info-circle"></i>
											Account Information
										</a>
									</c:if></li>
								<li class="nav-item mx-3"><c:if
										test="${userstatus=='accountbalance'}">

										<a class="nav-link active" onclick="checkbalance()"> <i
											class="fa fa-money"></i> Bank Balance
										</a>
									</c:if> <c:if test="${userstatus!='accountbalance'}">

										<a class="nav-link" style="color: white;"
											onclick="checkbalance()"> <i class="fa fa-money"></i>
											Bank Balance
										</a>
									</c:if></li>
								<li class="nav-item mx-3"><c:if
										test="${userstatus=='moneytransfer'}">
										<a class="nav-link active" onclick="transfermoney()"> <i
											class="fa fa-exchange"></i> Money Transfer
										</a>
									</c:if> <c:if test="${userstatus!='moneytransfer'}">
										<a class="nav-link" style="color: white;"
											onclick="transfermoney()"> <i class="fa fa-exchange"></i>
											Money Transfer
										</a>
									</c:if></li>
								<li class="nav-item mx-3"><c:if
										test="${userstatus=='transactionhistory'}">

										<a class="nav-link active" onclick="todaytrans()"> <i
											class="fa fa-list-alt"></i> Transaction Details
										</a>

									</c:if> <c:if test="${userstatus!='transactionhistory'}">

										<a class="nav-link" style="color: white;"
											onclick="todaytrans()"> <i class="fa fa-list-alt"></i>


											Transaction Details
										</a>

									</c:if></li>
							</ul>
						</div>
					</nav>
				</div>
				<div class="mt-3">
					<div class="row" id="lowerpart">

						<c:if test="${userstatus=='accountinformation'}">
							<div class="container d-flex justify-content-center">
								<div class="acountinfo col-md-6">
									<h1 class="text-center ">Account Information</h1>
									<form>
										<div class="mt-4 form-group row">
											<label class="col-md-3 col-form-label" for="customername">Customer
												Name:</label>
											<div class="col-md-6">
												<input type="text" class="form-control" value="${user.name}"
													id="customername" readonly>
											</div>
										</div>


										<div class="mt-4 form-group row">
											<label class="col-md-3 col-form-label" for="accno">Account
												Number:</label>
											<div class="col-md-6">
												<input type="text" class="form-control" value="${user.acno}"
													id="accno" readonly>
											</div>

										</div>

										<div class="mt-4 form-group row">
											<label class="col-md-3 col-form-label" for="aadharno">Aadhar
												Number:</label>
											<div class="col-md-6">
												<input type="text" class="form-control"
													value="${user.aadharno}" id="aadharno" readonly>
											</div>

										</div>

										<div class="mt-4 form-group row">
											<label class="col-md-3 col-form-label" for="panno">Pan
												Number:</label>
											<div class="col-md-6">
												<input type="text" class="form-control"
													value="${user.panno}" id="panno" readonly>
											</div>

										</div>


										<div class="mt-4 form-group row">
											<label class="col-md-3 col-form-label" for="branch">Branch:</label>
											<div class="col-md-6">
												<input type="text" class="form-control"
													value="${user.branch}" id="branch" readonly>
											</div>

										</div>

									</form>


								</div>


							</div>


						</c:if>







						<c:if test="${userstatus=='accountbalance'}">
							<div class="container d-flex justify-content-center">
								<div class="acountinfo col-md-6">
									<h1 class="text-center ">Balance Information</h1>
									<form>
										<div class="mt-4 form-group row">
											<label class="col-md-3 col-form-label" for="currentbal">Current
												Balance:</label>
											<div class="col-md-6">
												<input type="text" class="form-control"
													value="${user.accbalance}" id="currentbal" readonly>
											</div>
										</div>

									</form>


								</div>


							</div>


						</c:if>









						<c:if test="${userstatus=='moneytransfer'}">
							<div class="container ">
								<div class="container d-flex justify-content-center">
									<div class="acountinfo col-md-6">
										<h1 class="text-center ">Money Transfer</h1>
										<form>
											<div class="mt-4 form-group row">
												<label class="col-md-3 col-form-label" for="accno">Recipient
													Account Number:</label>
												<div class="col-md-6">
													<input type="text" class="form-control" id="accno"
														name="numberInput" pattern="[0-9]*" inputmode="numeric"
														title="Only numbers are allowed"
														onkeypress="restrictNonNumericInput(event)">
												</div>
												<span style="display: none;" class="error" id="accnoerror">Please
													enter Recipient Account Number*</span>
											</div>


											<div class="mt-4 form-group row">
												<label class="col-md-3 col-form-label" for="ifsccode">IFSC
													code:</label>
												<div class="col-md-6">
													<input type="text" class="form-control" id="ifsccode">
												</div>
												<span style="display: none;" class="error" id="ifscerror">Please
													enter valid IFSC cod*</span>
											</div>

											<div class="mt-4 form-group row">
												<label class="col-md-3 col-form-label" for="reciname">Recipient
													Name:</label>
												<div class="col-md-6">
													<input type="text" class="form-control" id="reciname">
												</div>
												<span style="display: none;" class="error" id="nameerror">Please
													enter valid Recipient Name*</span>
											</div>
											<div>
												<input type="hidden" value="${msg}" id="msg">

											</div>
											<div class="mt-4 form-group row">
												<label class="col-md-3 col-form-label" for="amount">Amount
													To Transfer:</label>
												<div class="col-md-6">
													<input type="text" class="form-control" id="amount"
														name="amountInput" pattern="[0-9]*" inputmode="numeric"
														title="Only numbers are allowed"
														onkeypress="restrictNonNumericInput(event)">
												</div>
												<span style="display: none;" class="error"
													id="transfererror">Please enter valid Amount*</span>
											</div>



											<div class="mt-5 d-flex justify-content-center">
												<button type="button" onclick="validate()"
													class="btn btn-primary me-3">Transfer</button>
												<button type="reset" class="btn btn-primary ">Reset</button>
											</div>


										</form>


									</div>
								</div>
								<div class="container d-flex justify-content-center">

									<div class="mt-4  col-md-7">
										<h1 class="text-center text-dark">Customer Details</h1>
										<table class="table table-hover" id="dataTable">
											<thead>
												<tr>
													<th>S.No</th>
													<th>Customer_AccountNo</th>
													<th>Customer_Name</th>
													<th>IFSC_Code</th>
												</tr>
											</thead>

											<tbody>

												<c:forEach items="${listofuser}" var="customer"
													varStatus="custindex">
													<tr>
														<td>${custindex.index+1}</td>
														<td>${customer.acno}</td>
														<td>${customer.name}</td>
														<td>${customer.ifsccode}</td>

													</tr>
												</c:forEach>





											</tbody>




										</table>



									</div>
								</div>














							</div>


						</c:if>


						<c:if test="${userstatus=='transactionhistory'}">

							<!-- 							<div class="container mt-4 transact col-md-6"> -->
							<!-- 								<h1 class="text-center ">Transaction Details</h1> -->
							<!-- 								<table class="table table-hover" id="dataTable"> -->
							<!-- 									<thead> -->
							<!-- 										<tr> -->
							<!-- 											<th>S.No</th> -->
							<!-- 											<th>Name</th> -->
							<!-- 											<th>Transaction Date and Time</th> -->
							<!-- 											<th>Debited Amount</th> -->
							<!-- 											<th>Credited Amount</th> -->
							<!-- 										</tr> -->
							<!-- 									</thead> -->

							<!-- 									<tbody> -->
							<%-- 										<c:forEach items="${transactiondetails}" var="transaction" --%>
							<%-- 											varStatus="transindex"> --%>
							<!-- 											<tr> -->
							<%-- 												<td>${transindex.index + 1}</td> --%>
							<%-- 												<td><c:if test="${transaction.recieaccno == user.acno}"> --%>
							<%--                                 ${transaction.user1.name} --%>
							<%--                             </c:if> <c:if --%>
							<%-- 														test="${transaction.recieaccno != user.acno}"> --%>
							<%--                                 ${transaction.reciename}</c:if></td> --%>


							<%-- 												<td>${transaction.transferdatetime}</td> --%>

							<%-- 												<td><c:if test="${transaction.recieaccno != user.acno}"> --%>
							<%--                                 ${transaction.recieamount} --%>
							<%--                             </c:if></td> --%>
							<%-- 												<td><c:if test="${transaction.recieaccno == user.acno}"> --%>
							<%--                                 ${transaction.recieamount} --%>
							<%--                             </c:if></td> --%>
							<!-- 											</tr> -->
							<%-- 										</c:forEach> --%>

							<!-- 									</tbody> -->
							<!-- 								</table> -->
							<!-- 							</div> -->



							<div class="container">
								<div class="row" style="width: 92%">
									<nav
										class="navbar navbar-expand-sm bg-danger navbar-dark mt-3 nav"
										style="margin-left: 11px;">
										<div class="container-fluid">
											<ul class="navbar-nav d-flex justify-content-around w-100">
												<li class="nav-item mx-3"><c:if
														test="${whichtrans=='todaytrans'}">

														<a class="nav-link active" style="color: white;"
															onclick="todaytrans()"> <i class="fa fa-calendar"></i>
															Today
														</a>
													</c:if> <c:if test="${whichtrans!='todaytrans'}">

														<a class="nav-link" style="color: white;"
															onclick="todaytrans()"> <i class="fa fa-calendar"></i>
															Today
														</a>
													</c:if></li>
												<li class="nav-item mx-3"><c:if
														test="${whichtrans=='lastoneweekseventrans'}">

														<a class="nav-link active" style="color: white;"
															onclick="oneweek()"> <i class="fa fa-calendar-o"></i>One
															Week
														</a>
													</c:if> <c:if test="${whichtrans!='lastoneweekseventrans'}">

														<a class="nav-link" style="color: white;"
															onclick="oneweek()"> <i class="fa fa-calendar-o"></i>One
															Week
														</a>
													</c:if></li>
												<li class="nav-item mx-3"><c:if
														test="${whichtrans=='thisweektrans'}">
														<a class="nav-link active" style="color: white;"
															onclick="thisweek()"><i class="fa fa-exchange"></i>This
															Week </a>
													</c:if> <c:if test="${whichtrans!='thisweektrans'}">
														<a class="nav-link" style="color: white;"
															onclick="thisweek()"><i class="fa fa-exchange"></i>This
															Week </a>
													</c:if></li>
												<li class="nav-item mx-3"><c:if
														test="${whichtrans=='onemonthtrans'}">
														<a class="nav-link active" style="color: white;"
															onclick="onemonth()"><i class="fa fa-calendar"></i>One
															Month </a>
													</c:if> <c:if test="${whichtrans!='onemonthtrans'}">
														<a class="nav-link" style="color: white;"
															onclick="onemonth()"><i class="fa fa-calendar"></i>One
															Month </a>
													</c:if></li>
												<li class="nav-item mx-3"><c:if
														test="${whichtrans=='thismonthtrans'}">

														<a class="nav-link active" style="color: white;"
															onclick="thismonth()"> <i class="fa fa-calendar"></i>This
															Month
														</a>
													</c:if> <c:if test="${whichtrans!='thismonthtrans'}">

														<a class="nav-link" style="color: white;"
															onclick="thismonth()"> <i class="fa fa-calendar"></i>This
															Month
														</a>
													</c:if></li>
												<li class="nav-item mx-3"><c:if
														test="${whichtrans=='customtrans'}">
														<a class="nav-link active" style="color: white;"
															onclick="customdetails()"> <i class="fa fa-cogs"></i>Customize
														</a>
													</c:if> <c:if test="${whichtrans!='customtrans'}">
														<a class="nav-link" style="color: white;"
															onclick="customdetails()"> <i class="fa fa-cogs"></i>Customize
														</a>
													</c:if></li>
											</ul>
										</div>
									</nav>

								</div>
								


								<c:if test="${whichtrans=='todaytrans'}">
									<div class="container mt-4  d-flex justify-content-center">
										<div class="transact col-md-6 ">
											<h1 class="text-center ">Today Transaction Details</h1>
											<table class="table table-hover" id="dataTable">
												<thead>
													<tr>
														<th>S.No</th>
														<th>Name</th>
														<th>Transaction Date and Time</th>
														<th>Debited Amount</th>
														<th>Credited Amount</th>
													</tr>
												</thead>

												<tbody>
													<c:forEach items="${todaytranslist}" var="transaction"
														varStatus="transindex">
														<tr>
															<td>${transindex.index + 1}</td>
															<td><c:if
																	test="${transaction.recieaccno == user.acno}">
${transaction.user1.name}
</c:if> <c:if test="${transaction.recieaccno != user.acno}"> 
${transaction.reciename}</c:if></td>


															<td>${transaction.transferdatetime}</td>

															<td><c:if
																	test="${transaction.recieaccno != user.acno}"> 
${transaction.recieamount} 
</c:if></td>
															<td><c:if
																	test="${transaction.recieaccno == user.acno}"> 
${transaction.recieamount} 
</c:if></td>
														</tr>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>


								</c:if>







								<c:if test="${whichtrans=='lastoneweekseventrans'}">
									<div class="container mt-4  d-flex justify-content-center">
										<div class="transact col-md-6 ">
											<h1 class="text-center ">One Week Transaction Details</h1>
											<table class="table table-hover" id="dataTable">
												<thead>
													<tr>
														<th>S.No</th>
														<th>Name</th>
														<th>Transaction Date and Time</th>
														<th>Debited Amount</th>
														<th>Credited Amount</th>
													</tr>
												</thead>

												<tbody>
													<c:forEach items="${listoflastseventrans}"
														var="transaction" varStatus="transindex">
														<tr>
															<td>${transindex.index + 1}</td>
															<td><c:if
																	test="${transaction.recieaccno == user.acno}">
${transaction.user1.name}
</c:if> <c:if test="${transaction.recieaccno != user.acno}"> 
${transaction.reciename}</c:if></td>


															<td>${transaction.transferdatetime}</td>

															<td><c:if
																	test="${transaction.recieaccno != user.acno}"> 
${transaction.recieamount} 
</c:if></td>
															<td><c:if
																	test="${transaction.recieaccno == user.acno}"> 
${transaction.recieamount} 
</c:if></td>
														</tr>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>


								</c:if>
















								<c:if test="${whichtrans=='thisweektrans'}">
									<div class="container mt-4  d-flex justify-content-center">
										<div class="transact col-md-6 ">
											<h1 class="text-center ">This Week Transaction Details</h1>
											<table class="table table-hover" id="dataTable">
												<thead>
													<tr>
														<th>S.No</th>
														<th>Name</th>
														<th>Transaction Date and Time</th>
														<th>Debited Amount</th>
														<th>Credited Amount</th>
													</tr>
												</thead>

												<tbody>
													<c:forEach items="${listofthistrans}" var="transaction"
														varStatus="transindex">
														<tr>
															<td>${transindex.index + 1}</td>
															<td><c:if
																	test="${transaction.recieaccno == user.acno}">
${transaction.user1.name}
</c:if> <c:if test="${transaction.recieaccno != user.acno}"> 
${transaction.reciename}</c:if></td>


															<td>${transaction.transferdatetime}</td>

															<td><c:if
																	test="${transaction.recieaccno != user.acno}"> 
${transaction.recieamount} 
</c:if></td>
															<td><c:if
																	test="${transaction.recieaccno == user.acno}"> 
${transaction.recieamount} 
</c:if></td>
														</tr>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>


								</c:if>






								<c:if test="${whichtrans=='thismonthtrans'}">
									<div class="container mt-4  d-flex justify-content-center">
										<div class="transact col-md-6 ">
											<h1 class="text-center ">This Month Transaction Details</h1>
											<table class="table table-hover" id="dataTable">
												<thead>
													<tr>
														<th>S.No</th>
														<th>Name</th>
														<th>Transaction Date and Time</th>
														<th>Debited Amount</th>
														<th>Credited Amount</th>
													</tr>
												</thead>

												<tbody>
													<c:forEach items="${listofthismonthtrans}"
														var="transaction" varStatus="transindex">
														<tr>
															<td>${transindex.index + 1}</td>
															<td><c:if
																	test="${transaction.recieaccno == user.acno}">
${transaction.user1.name}
</c:if> <c:if test="${transaction.recieaccno != user.acno}"> 
${transaction.reciename}</c:if></td>


															<td>${transaction.transferdatetime}</td>

															<td><c:if
																	test="${transaction.recieaccno != user.acno}"> 
${transaction.recieamount} 
</c:if></td>
															<td><c:if
																	test="${transaction.recieaccno == user.acno}"> 
${transaction.recieamount} 
</c:if></td>
														</tr>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>


								</c:if>





								<c:if test="${whichtrans=='onemonthtrans'}">
									<div class="container mt-4  d-flex justify-content-center">
										<div class="transact col-md-6 ">
											<h1 class="text-center ">One Month Transaction Details</h1>
											<table class="table table-hover" id="dataTable">
												<thead>
													<tr>
														<th>S.No</th>
														<th>Name</th>
														<th>Transaction Date and Time</th>
														<th>Debited Amount</th>
														<th>Credited Amount</th>
													</tr>
												</thead>

												<tbody>
													<c:forEach items="${listofonemonthtrans}" var="transaction"
														varStatus="transindex">
														<tr>
															<td>${transindex.index + 1}</td>
															<td><c:if
																	test="${transaction.recieaccno == user.acno}">
${transaction.user1.name}
</c:if> <c:if test="${transaction.recieaccno != user.acno}"> 
${transaction.reciename}</c:if></td>


															<td>${transaction.transferdatetime}</td>

															<td><c:if
																	test="${transaction.recieaccno != user.acno}"> 
${transaction.recieamount} 
</c:if></td>
															<td><c:if
																	test="${transaction.recieaccno == user.acno}"> 
${transaction.recieamount} 
</c:if></td>
														</tr>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>


								</c:if>








								<c:if test="${whichtrans=='customtrans'}">
									<form>
										<div class="row mt-4 form-group" style="width: 93%;">

											<label class="form-label col-md-2" for="startdate">From
												Date</label>
											<div class="col-md-3">
												<input type="date" class="form-control" id="startdate">
											</div>



											<label class="form-label col-md-2" for="enddate">To
												Date</label>
											<div class="col-md-3">
												<input type="date" class="form-control" id="enddate">

											</div>
											<div class="col-md-2">
												<a onclick="custtransvalidation()" class="buttonl">Submit</a>

											</div>

										</div>

									</form>
									
									
									<div id="transactioncust">
									<c:if test="${tabledet=='cutomizetabledetails'}">
										<div class="container mt-4  d-flex justify-content-center">
											<div class="transact col-md-6 ">
												<h1 class="text-center ">Customize Transaction Details</h1>
												<table class="table table-hover" id="dataTable">
													<thead>
														<tr>
															<th>S.No</th>
															<th>Name</th>
															<th>Transaction Date and Time</th>
															<th>Debited Amount</th>
															<th>Credited Amount</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${listofcusttrans}" var="transaction"
															varStatus="transindex">
															<tr>
																<td>${transindex.index + 1}</td>
																<td><c:if
																		test="${transaction.recieaccno == user.acno}">
${transaction.user1.name}
</c:if> <c:if test="${transaction.recieaccno != user.acno}"> 
${transaction.reciename}</c:if></td>


																<td>${transaction.transferdatetime}</td>

																<td><c:if
																		test="${transaction.recieaccno != user.acno}"> 
${transaction.recieamount} 
</c:if></td>
																<td><c:if
																		test="${transaction.recieaccno == user.acno}"> 
${transaction.recieamount} 
</c:if></td>
															</tr>
														</c:forEach>

													</tbody>
												</table>
											</div>
										</div>


									</c:if>
</div>
								</c:if>



							</div>

						</c:if>
					</div>

				</div>
			</div>



		</div>



	</div>



</body>
</html>