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
				    <c:url value="/workOrderCompleteDeficiency/${deficiency.id}/${deficiency.homeEnrollmentNumber}/${deficiency.constructionPersonnel}" var="completeUrl" />
				    <a href="${completeUrl}" class="btn btn-primary pull-right">Is Completed: ${deficiency.status}</a>
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
