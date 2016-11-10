<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.list-group-item{
	margin:0.7%;
}
</style>

	<div id="legendCon">
	<legend><h2>Work Orders by Contractor</h2></legend>
	<div style="margin: 2%">
		<div class="list-group">
			<c:forEach var="constructionPersonnel" items="${constructionPersonnelList}">
				<c:url value="/displayDeficiencies/${constructionPersonnel.id}" var="viewUrl" />
				<a href="${viewUrl}" class="list-group-item" id ="btnHovering"> ${constructionPersonnel.constructionPersonnelName} 
				<span class="pull-right"> Open Deficiencies: <span class="badge" style="background-color:red;"> ${constructionPersonnel.deficiencyCount}</span> </span> </a>
			</c:forEach>
		</div>
	</div>
	</div>

	<div style="padding: 0% 2%">

       	<c:url value="/workOrderHome" var="backUrl" />
       	<a href="${backUrl}" id="btnXlg" class="btn btn-default">Back</a>
    </div>
