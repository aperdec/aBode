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
	<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/style.css">	
	
<style>
#con {
	background-color: #EDEEFF;
}

table{
	border: #D1D0CE solid 1px;
}

#constructionPersonnel{
    height: auto;
    font-size: 16px;
    padding: 12px;
    line-height: 28px;
    border-radius: 8px;
}
#assignLbl{
    height: auto;
    font-size: 16px;
    padding: 16px;
    line-height: 28px;
    border-radius: 8px;
}
</style>

<title>Tarion Report Selection</title>
</head>
<body>
	<legend><h2>Report Selection</h2></legend>
	
	<div style="margin: 2%;">
		<c:url value="/selectReport" var="url" />
		<form name="form" class="form-horizontal" method="post" action="${url}">
		<fieldset>
		<div class="jumbotron" id="legendCon" style="background-color:#EDEEFF">

		<div class="form-group">
			
			<label for="constructionPersonnel" class="col-lg-2 pull-left control-label" id="assignLbl">Assign
				To</label>
			<div class="col-lg-9" >
				<select class="form-control" id="constructionPersonnel"
					name="constructionPersonnel">
					<optgroup label="">
						<option>Pre-Delivery Inspection Report</option>
					</optgroup>
					<optgroup label="">
						<option>Other...</option>
					</optgroup>
				</select>
				</div>
				
			</div>
			<div class="form-group">
			<input type="hidden" name="homeEnrollmentNumber" value="" /> 
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="col-lg-8 col-lg-offset-10">
			<c:url value="/pdiReport" var="pdiReport" />
			<a href="${pdiReport}" id="btnXlg" class="pull-left btn btn-success">Next</a>
			</div>
		</div>

		

	</div>
			</fieldset>
			</form>
			
	</div>

	
	

</body>
</html>