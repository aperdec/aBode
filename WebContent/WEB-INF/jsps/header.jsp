	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<c:url value="/" var="home" />
	<c:url value="/displayUnitInfo" var="pdi" />
	<c:url value="/workOrderHome" var="workOrder" />
	<c:url value="/buildInspection" var="buildInspection" />
	<c:url value="/displayBuildingProjects" var="projects" />
	<c:url value="/displayConstructionPersonnel" var="constructionPersonnel" />
	<c:url value="/selectReport" var="reports" />
	<c:url value="/help" var="help" />


		<nav class="navbar navbar-default">
          <div class="container-fluid">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="${home}">aBode</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">

                <li><a href="${pdi}">Fill Out PDI</a></li>

                <li class="dropdown">
                  <a href="${workOrder}" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Work Order<span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="${projects}">Projects</a></li>
                    <li><a href="${constructionPersonnel}">Construction Personnel</a></li>
                  </ul>
                </li>

                <li><a href="${reports}">View Reports</a></li>
				<li><a href="${buildInspection}">Build Inspection</a></li>
              </ul>
              <form class="navbar-form navbar-left" role="search" action="workOrderDisplayUnitDeficiencies">
                <div class="form-group">
                  <input id="homeEnrollmentNumberNav" name="homeEnrollmentNumber" onkeypress='return event.charCode >= 48 && event.charCode <= 57' type="text" class="form-control" placeholder="Home Enrollment Number" required="required">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
              </form>
              <ul class="nav navbar-nav navbar-right">
                <li><a href="${help}">Help</a></li>
              </ul>
            </div>
          </div>
        </nav>
