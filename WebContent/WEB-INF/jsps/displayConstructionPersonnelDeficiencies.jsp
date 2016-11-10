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
	
<link rel="stylesheet" type="text/css" href="../../../css/style.css">
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    </style>

<div class="jumbotron" id="con">
<center><h2>Deficiency List</h2></center>
	<div style="margin: 2%">
	<legend>Work Assigned to ${deficiency.constructionPersonnel}</legend>
		<div class="list-group">
		<table class="table table-striped table-hover">
		  <thead>
		    <tr>
		    <th>Project</th>
		      <th>Unit</th>
		      <th>Location</th>
		      <th>Deficiency Type</th>
		      <th>Notes</th>
		      <th></th>
		      <th></th>
		    </tr>
		  </thead>
		  <tbody>
			<c:forEach var="deficiency" items="${deficiencyList}">
				<tr>
				<td>${deficiency.id}</td>
				<td>${deficiency.id}</td>
				<td>${deficiency.location}</td>
				<td>${deficiency.category}</td>
				<td>${deficiency.description}</td>
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
				</tr>
			</c:forEach>
			</tbody>
			</table>
		</div>
	</div>
</div>

	<div style="padding: 0% 2%">

       	<c:url value="/displayConstructionPersonnel" var="backUrl" />
       	<a href="${backUrl}" id="btnXlg" class="btn btn-default">Back</a>
    </div>
