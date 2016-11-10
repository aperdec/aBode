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
	<legend><h2>Work Orders by Project</h2></legend>
	<c:choose>
                      <c:when test="${errorUnit}">
                        <div class="alert alert-danger" id="alert" >
                            <div id="selectHEN">Home Enrollment Number does not exist.</div>
                        </div>
                      </c:when>
                    </c:choose>
	<div style="margin: 2%">
		<div class="list-group">
			<c:forEach var="project" items="${projectList}">
				<c:url value="/displayUnits/${project}" var="viewUrl" />
				<a href="${viewUrl}" class="list-group-item" id ="btnHovering"> ${project} </a>
			</c:forEach>
		</div>
	</div>
	</div>

	<div style="padding: 0% 2%">

    	<c:url value="/workOrderHome" var="backUrl" />
    	<a href="${backUrl}" id="btnXlg" class="btn btn-default">Back</a>
    	
    	<br />
		<br />


		<legend> </legend>
    	
    </div>
