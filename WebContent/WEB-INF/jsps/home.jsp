<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
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
	crossorigin="anonymous">
	
</script>

<style>

/*
Extra Large Button CSS
*/
.btn-xl {
	padding: 28px 38px;
	font-size: 22px;
	border-radius: 8px;
	text-align: center;
	margin: 20px;
	border: 2px solid black;
}



</style>
<title>aBode</title>
</head>
<body>
	<div class="container">
	
		<div class="row row-centered">

			<h1 class="text-center">Welcome to aBode Software</h1>

			<c:url value="/displayUnitInfo" var="displayUnitInmformation" />
			
		</div>

		<div class="row">
			<div class="col-sm-2 text-center"></div>
			<a href="${displayUnitInmformation}"
				class="col-sm-4 btn-xl btn-default">Fill out PDI</a> <a
				href="${Placeholder}" class="col-sm-4 btn-xl btn-default">Build
				Inspection</a>

		</div>

		<div class="row">
			<div class="col-sm-2 text-center"></div>
			<a href="${Placeholder}" class="col-sm-4 btn-xl btn-default btn-xl">View
				Work Orders</a> <a href="${Placeholder}"
				class="col-sm-4 btn-xl btn-default btn-xl">Generate Report</a>

		</div>

		<div class="row">
			<div class="col-sm-2 text-center"></div>
			<a href="${Placeholder}" class="col-sm-4 btn-xl btn-default btn-xl">Form
				Status</a> <a href="${Placeholder}"
				class="col-sm-4 btn-xl btn-default btn-xl">Confirm Repairs</a>

		</div>

	</div>

	<br />

</body>
</html>
