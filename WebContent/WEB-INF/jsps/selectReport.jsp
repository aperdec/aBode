<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
	crossorigin="anonymous"></script>
<style>
#con {
	background-color: #EDEEFF;
}

table{
	border: #D1D0CE solid 1px;
}
</style>
<title>Tarion Report Selection</title>
</head>
<body>
	<div></div>
	<div style="margin: 2%">
		<c:url value="/selectReport" var="url" />
		<form name="form" class="form-horizontal" method="post"
			action="${url}">

			<fieldset>
				<legend>Report Selection</legend>
	</div>

	<div class="jumbotron" id="con">

		<div class="form-group">
		
		
			<label for="constructionPersonnel" class="col-lg-1 control-label">Assign
				To</label>
			<div class="col-lg-10">
				<select class="form-control" id="constructionPersonnel"
					name="constructionPersonnel">
					<option>PDI Report</option>
					<option>Other...</option>
					
				</select>
			</div>
		</div>

		<input type="hidden" name="homeEnrollmentNumber" value="" /> <input
			type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

	

		<c:url value="/pdiReport" var="pdiReport" />
		<a href="${pdiReport}" class="pull-right btn btn-default">Next</a>

	</div>
</body>
</html>