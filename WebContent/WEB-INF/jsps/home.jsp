<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>

/*
Extra Large Button CSS
*/
.btn-xl {
	padding: 34px 40px;
	font-size: 25px;
	border-radius: 8px;
	text-align: center;
	margin: 20px;
	border: 2px solid black;
	color:inherit;
	background-color: #EDEEFF;
}
.btn-xl:hover {
	background-color: #9394AA;
	text-decoration: none;
	color: black;
}


</style>

	<div class="">
	
		<div class="row row-centered text-center">

			<legend><h1>Welcome to aBode Software</h1></legend>

			<c:url value="/displayUnitInfo" var="displayUnitInformation" />
			<c:url value="/selectReport" var="selectReport" />
			<c:url value="/workOrderHome" var="workOrderHome" />
			<c:url value="/help" var="help" />
			<c:url value="/buildInspection" var="buildInspection" />
			

		</div>

		<div class="row">
			<div class="col-sm-2 text-center"></div>
			<a href="${displayUnitInformation}"	class="col-sm-4 btn-xl btn-inverse">Fill out PDI</a>
			<a href="${buildInspection}" class="col-sm-4 btn-xl btn-inverse">Build	Inspection</a>

		</div>

		<div class="row">
			<div class="col-sm-2 text-center"></div>
			<a href="${workOrderHome}" class="col-sm-4 btn-xl btn-inverse btn-xl">View Work Orders</a>
			<a href="${selectReport}" class="col-sm-4 btn-xl btn-inverse btn-xl">View Reports</a>

		</div>

		<div class="row row-centered">
			<div class="col-sm-2 text-center"></div>
		<!-- 	<a href="${help}" class="col-sm-4 btn-xl btn-inverse btn-xl">Help</a> -->
		<!-- <a href="${Placeholder}" class="col-sm-4 btn-xl btn-inverse btn-xl">Confirm Repairs</a> -->

		</div>
			<br />
				
<legend> </legend>
	</div>
