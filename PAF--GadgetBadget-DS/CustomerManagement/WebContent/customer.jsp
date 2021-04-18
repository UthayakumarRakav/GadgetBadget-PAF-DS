<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.Customer"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/customer.js"></script>
<style>

</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-4">

				<h1>Online Customer Registation</h1>

				<form id="formItem" name="formItem">

					<div class="input-group input-group-sm mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="lblName">Customer Name:
							</span>
						</div>
						<input id="cName" name="cName" type="text"
							class="form-control form-control-sm">
					</div>


					<div class="input-group input-group-sm mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="lblName">Gender: </span>
						</div>
						&nbsp;&nbsp;Male <input type="radio" id="genderm"
							name="gender" value="Male"> &nbsp;&nbsp;Female <input
							type="radio" id="genderf" name="gender" value="Female">
					</div>
					
					<div class="input-group input-group-sm mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="lblName"> phone: </span>
						</div>
						<input id="phone" name="phone" type="text"
							class="form-control form-control-sm">

					</div>



					<div class="input-group input-group-sm mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="lblName">email: </span>
						</div>
						<input id="email" name="email" type="text"
							class="form-control form-control-sm">

					</div>


					<div class="input-group input-group-sm mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="lblName">city: </span>
						</div>
						<input id="age" name="age" type="text"
							class="form-control form-control-sm">

					</div>

						<div class="input-group input-group-sm mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="lblName">region: </span>
							</div>
							<select id="region" name="region">
								<option value="0">--Select region--</option>
								<option value="A">Northern</option>
								<option value="B">Southern</option>
								<option value="C">Eastern</option>
								<option value="D">Western</option>
								<option value="E">Central</option>
								<option value="F">Uva</option>
								<option value="G">Subragamuwa</option>
								
						
							</select>
						</div>


					


					<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
						
						<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
				</form>

				<div id="alertSuccess" class="alert alert-success"></div>

				<div id="alertError" class="alert alert-danger"></div>


			</div>
			<div class='col-12'>
				<div id="divItemsGrid">

					<%
						customer Customer = new customer();
					out.print(Customer.getCustomerDetails());
					%>
				</div>

			</div>
		</div>
	</div>

</body>
</html>