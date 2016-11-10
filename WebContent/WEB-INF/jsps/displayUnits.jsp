<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.list-group-item{
	margin:1.5%;
}
</style>

	<div id="legendCon">
	<legend><h2>Units with Deficiencies for ${project}</h2></legend>

	<div style="margin: 1%">
		<div class="list-group">
			<c:forEach var="unit" items="${unitList}">
				<c:url value="../workOrderDisplayUnitDeficiencies/${unit.homeEnrollmentNumber}" var="viewUrl" />
				<a href="${viewUrl}" class="list-group-item" id="btnHovering"> Unit: <b>${unit.unitNum}</b> at ${unit.address} 
				<span class="pull-right"> Open Deficiencies: <span class="badge" style="background-color:red;"> ${unit.deficienciesOpen} </span> </span> </a>
			</c:forEach>
		</div>

		<c:url value="/displayBuildingProjects" var="backUrl" />
		<a href="${backUrl}" id="btnXlg" class="btn btn-default">Back</a>


	</div>


		
		<legend> </legend>
	</div>
