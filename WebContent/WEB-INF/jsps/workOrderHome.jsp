<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.list-group-item{
	margin:1%;
}
</style>

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
