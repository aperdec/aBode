<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
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
<title>Perds' Wiki</title>
</head>
<body>

	<div style="margin: 2%">
		<c:url value="/saveSubject" var="url" />
		<form:form commandName="subject" class="form-horizontal" method="post"
			action="${url}">

			<fieldset>
				<legend>Enter or Edit Information</legend>

				<div class="form-group">
					<label for="inputTitle" class="col-lg-1 control-label">Title</label>
					<div class="col-lg-10">
						<form:input path="title" class="form-control" id="inputTitle"
							placeholder="Title" required="required" />
					</div>
				</div>

				<div class="form-group">
					<label for="textArea" class="col-lg-1 control-label">Text</label>
					<div class="col-lg-10">
						<form:textarea path="text" class="form-control" rows="3"
							id="textArea" required="required" />
					</div>
				</div>
				
				<security:authorize access="isAuthenticated()">
   					<security:authentication property="principal.username" var="username" /> 
				</security:authorize>
				
				<form:input path="username" type="hidden" value="${username}"/>
				
				<input type="submit" value="Save Subject!" class="btn btn-primary "
					style="margin-left: 8.33333333333%" />

			</fieldset>
		</form:form>

	</div>
</body>
</html>