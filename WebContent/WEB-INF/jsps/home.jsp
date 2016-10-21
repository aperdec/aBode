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
	padding: 34px 40px;
	font-size: 25px;
	border-radius: 8px;
	text-align: center;
	margin: 20px;
	border: 2px solid black;
	color:inherit;
	background-color: #EDEEFF;
}
.btn-xl:hover {
	background-color: #9394AA;
	text-decoration: none;
	color: black;
}

</style>
<title>aBode</title>
</head>
<body>
	<div class="container">
	
		<div class="row row-centered">

			<h1 class="text-center">Welcome to aBode Software</h1>

			<c:url value="/displayUnitInfo" var="displayUnitInformation" />
			<c:url value="/selectReport" var="selectReport" />
			<c:url value="/workOrderHome" var="workOrderHome" />
			<c:url value="/help" var="help" />
			<c:url value="/buildInspection" var="buildInspection" />
			

		</div>

		<div class="row">
			<div class="col-sm-2 text-center"></div>
			<a href="${displayUnitInformation}"	class="col-sm-4 btn-xl btn-inverse">Fill out PDI</a>
			<a href="${buildInspection}" class="col-sm-4 btn-xl btn-inverse">Build	Inspection</a>

		</div>

		<div class="row">
			<div class="col-sm-2 text-center"></div>
			<a href="${workOrderHome}" class="col-sm-4 btn-xl btn-inverse btn-xl">View Work Orders</a>
			<a href="${selectReport}" class="col-sm-4 btn-xl btn-inverse btn-xl">Generate Report</a>

		</div>

		<div class="row">
			<div class="col-sm-2 text-center"></div>
			<a href="${help}" class="col-sm-4 btn-xl btn-inverse btn-xl">Help</a>
			<a href="${Placeholder}" class="col-sm-4 btn-xl btn-inverse btn-xl">Confirm Repairs</a>

		</div>

	</div>

	<br />

</body>
</html>
