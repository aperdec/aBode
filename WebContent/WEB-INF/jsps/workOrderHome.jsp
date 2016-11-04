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

<link rel="stylesheet" type="text/css" href="css/style.css">

<style>
.list-group-item{
	margin:1%;
}
</style>
	
<title>aBode</title>
</head>
<body>
	
	<div id="legendCon">
	<legend><h2>Work Order Selection</h2></legend>
		<div class="list-group">
		    <h4>Sort By:</h4>
			<c:url value="/displayBuildingProjects" var="projectUrl" />
			<a href="${projectUrl}" class="list-group-item" id="btnHovering"> Projects </a>
			<c:url value="/displayConstructionPersonnel" var="builderUrl" />
			<a href="${builderUrl}" class="list-group-item" id="btnHovering"> Contractors </a>
		</div>
		<div class="form-group">
			        <c:url value="/" var="home" />
					<a href="${home}" class="pull-left btn btn-default" id="btnXlg" style="margin-left:1%;">Finish</a>
		<br />
		<br />
		<br />
		<br />
		
		<legend> </legend>
		</div>
	</div>

</body>
</html>