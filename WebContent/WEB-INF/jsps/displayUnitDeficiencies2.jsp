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

<div style="margin: 2%">
<legend><h2>Build Inspection (Step 2 of 2)</h2></legend>
</div>
<div class="jumbotron" id="con">
<center><h2>Unit ${unit.unitNum} Deficiency List</h2></center>
	<div style="margin: 2%">
		<div class="list-group">
		<table class="table table-striped table-hover">
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
				    <c:url value="/deleteDeficiency2/${unitDeficiency.id}/${unit.homeEnrollmentNumber}" var="deleteUrl2" />
				    <a href="${deleteUrl2}" class="btn btn-danger pull-right">Delete</a>
				</td>
				</tr>
			</c:forEach>
			</tbody>
			</table>
		</div>
	</div>
</div>
	<div style="padding: 0% 2%">
		
		<c:url value="/addDeficiency2/${unit.homeEnrollmentNumber}" var="addUrl" />
		<a href="${addUrl}" id="btnXlg"class="btn btn-primary">Add Deficiency</a> 

		<c:url value="/" var="finish" />
		<a href="${finish}" id="btnXlg" class="pull-right btn btn-success">Finish</a>
				<br />
				<br />
				<br />
		<legend> </legend>
	</div>