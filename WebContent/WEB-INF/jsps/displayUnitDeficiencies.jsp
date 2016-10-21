<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	
<link rel="stylesheet" type="text/css" href="../css/style.css">
	
<style>
#con {
	background-color: #EDEEFF;
	margin: 2%;
	border-radius: 15px;
}

table{
	border: #D1D0CE solid 1px;
}
#titleCon{
	margin: 2%;
}
#nextDbtn{
    padding: 24px 70px;
    font-size: 16px;
    line-height: normal;
    border-radius: 8px;
    }
#btnXlg {
    padding: 24px 34px;
    font-size: 16px;
    line-height: normal;
    border-radius: 8px;
    }
</style>

<title></title>
</head>
<body>
<div id="titleCon"><legend><h2>Pre-Delivery Inspection (Step 2 of 3)</h2></legend></div>
<div class="jumbotron" id="con">
<center><h2>Unit ${unit.unitNum} Deficiency List</h2></center>
	<div style="margin: 2%">
		<div class="list-group">
		<table class="table table-striped">
		  <thead>
		    <tr>
		      <th>#</th>
		      <th>Location</th>
		      <th>Deficiency Type</th>
		      <th>Description</th>
		      <th></th>
		    </tr>
		  </thead>
		  <tbody>
			<c:forEach var="unitDeficiency" items="${unit.deficiencies}">
				<tr>
				<td>${unitDeficiency.id}</td>
				<td>${unitDeficiency.location}</td>
				<td>${unitDeficiency.category}</td> 
				<td>${unitDeficiency.description}</td>
				<td>
				    <c:url value="/deleteDeficiency/${unitDeficiency.id}/${unit.homeEnrollmentNumber}" var="deleteUrl" />
				    <a href="${deleteUrl}" class="btn btn-danger pull-right" style="margin:1%;">Delete</a>
				</td>
				</tr>
			</c:forEach>
			</tbody>
			</table>
		</div>
	</div>
</div>
	<div style="padding: 0% 2%">
		
		<c:url value="/addDeficiency/${unit.homeEnrollmentNumber}" var="addUrl" />
		<br />
		<br />
		<a href="${addUrl}" class="btn btn-primary" id="btnXlg">Add Deficiency</a> 

		<c:url value="/addSignOff/${unit.homeEnrollmentNumber}" var="addSignOff" />
		
		<a href="${addSignOff}" class="pull-right btn btn-success" id="nextDbtn">Next</a>
		<br />
		<br />
				 <br />
				 <br />

		<legend> </legend>
	</div>

</body>
</html>