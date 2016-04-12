<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
	
<title>Unit Information</title>
</head>
<body>
	
	<p style="font-size:160%;">aBode</p>
	<label for="venBuildInfo" class="col-lg-1 control-label">Vendor/Builder and Home Address Information</label>
					
					<div class="col-lg-10">
						<input path="venBuildInfo" name="txtVenBuildInfo" class="form-control" id="venBuildInfo"
							placeholder="Enter Home Enrollment Number" required="required" type="text" />
	
					</div>
					
	<div id="error"></div>
	
	<div style="margin: 2%">
	<c:url value ="/register" var="url" />
		<form name="form" method="post" action="${url}" class="form-horizontal" onsubmit="return verify()">
			<fieldset>
			
				<legend>Unit Information</legend>
				<div class = "row">
				<div class="form-group col-xs-6">
				
				<label for="dateOfPosession" class="col-lg-1 control-label">Date of Posession</label>
					
					<div class="col-lg-10">
						<input path="dateOfPosession" name="dateOfPosession" class="form-control" id="dateOfPosession"
							placeholder="DD/MM/YYYY" required="required" type="text" />
	
					</div>
				</div>
								
				<div class="form-group col-xs-5">
				
					<div class="col-lg-10">
						<input path="dateOfPosession" name="dateOfPosession" class="form-control" id="dateOfPosession"
							placeholder="" required="required" type="text" />
					</div>

				</div>
				</div>
				<div class="form-group col-xs-5">
					<label for="inputPassword" class="col-lg-1 control-label">Password</label>
					<div class="col-lg-10">
						<input path="password" class="form-control" id="inputPassword"
							placeholder="Password" required="required" name="password" type="password"/>
					</div>
				
					<label for="inputRePassword" class="col-lg-1 control-label">Re-enter Password</label>
					<div class="col-lg-10">
						<input path="verifyPassword" class="form-control" id="inputRePassword"
							placeholder="Re-enter Password" required="required" name="verifyPassword" type="password" />
					</div>
				</div>
				
				</div>
				<br />
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

				<input type="submit" value="Create Account!" class="btn btn-primary " onclick="verify()"
					style="margin-left: 8.33333333333%" />
					
			</fieldset>
		</form>
	</div>
</body>
</html>