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
    
    #btnXlg {
    padding: 24px 34px;
    font-size: 16px;
    line-height: normal;
    border-radius: 8px;
    }
    </style>

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
				    <c:url value="/workOrderCompleteDeficiencyUnit/${unitDeficiency.id}/${unit.homeEnrollmentNumber}" var="completeUrl" />
                    <a href="${completeUrl}" class="btn btn-primary pull-right">Is Completed: ${unitDeficiency.status}</a>
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
