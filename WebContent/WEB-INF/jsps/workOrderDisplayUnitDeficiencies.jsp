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
	padding-right:1%;
    }

    table{
    	border: #D1D0CE solid 1px;
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

<div class="jumbotron" id="con">
<center><h2>${unit.projectName}, Unit ${unit.unitNum}</h2></center>

	<div style="margin: 2%">
	<legend><h3>Deficiency List</h3></legend>
		<div class="list-group">
		<table class="table table-striped table-hover">
		  <thead>
		    <tr>
		      <th>#</th>
		      <th>Location</th>
		      <th>Deficiency Type</th>
		      <th>Notes</th>
		      <th>Assignee</th>
		      <th></th>
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
				<td>${unitDeficiency.constructionPersonnel}</td>
				<td>
				    <c:choose>
	              <c:when test="${deficiency.status}">
		              <c:url value="/workOrderCompleteDeficiency/${deficiency.id}/${deficiency.homeEnrollmentNumber}/${deficiency.constructionPersonnel}" var="completeUrl" />
					    <a href="${completeUrl}" class="btn btn-success pull-right">Complete</a>
	                
	              </c:when>
	              <c:otherwise>
	                <c:url value="/workOrderCompleteDeficiency/${deficiency.id}/${deficiency.homeEnrollmentNumber}/${deficiency.constructionPersonnel}" var="completeUrl" />
					    <a href="${completeUrl}" class="btn btn-warning pull-right">Incompleted</a>
	              </c:otherwise>
	            	</c:choose>
				</td>
				<td>
				    <c:url value="/workOrderDeleteDeficiency/${unitDeficiency.id}/${unit.homeEnrollmentNumber}" var="deleteUrl" />
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

		<c:url value="/workOrderAddDeficiency/${unit.homeEnrollmentNumber}" var="addUrl" />
		<a href="${addUrl}" id="btnXlg" class="btn btn-primary pull-right">Add Deficiency</a>

		<c:url value="/displayUnits/${unit.projectName}" var="backUrl" />
		<a href="${backUrl}" id="btnXlg" class="btn btn-default">Back</a>
	</div>

</body>
</html>