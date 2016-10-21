<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">
	

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
<title>aBode</title>

</head>
<body>

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
              <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="Home Enrollment Number">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
              </form>
              <ul class="nav navbar-nav navbar-right">
                <li><a href="${help}">Help</a></li>
              </ul>
            </div>
          </div>
        </nav>

</body>
</html>