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