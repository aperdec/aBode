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
<title>Add Deficiency: ${unit.homeEnrollmentNumber}</title>
</head>
<body>

	<div style="margin: 2%">
		<c:url value="/workOrderSaveDeficiency" var="url" />
		<form name="form" class="form-horizontal" method="post" action="${url}">

			<fieldset>
				<legend>Enter or Edit Information</legend>

				<div class="form-group">
					<label for="id" class="col-lg-1 control-label">Deficiency Number</label>
					<div class="col-lg-10">
						<input path="id" name="id" class="form-control" id="id" placeholder="Id" required="required"/>
					</div>
				</div>

				<div class="form-group">
                	<label for="deadline" class="col-lg-1 control-label">Deadline</label>
                	<div class="col-lg-10">
                		<input path="deadline" name="deadline" class="form-control" id="deadline" value="${unit.posessionDate}" readonly/>
                	</div>
                </div>

				<div class="form-group">
					<label for="location" class="col-lg-1 control-label">Location</label>
					<div class="col-lg-10">
						<select name="location" class="form-control" id="location">
							<option>Kitchen</option>
							<option>Bedroom</option>
							<option>Living Room</option>
							<option>Hallway</option>
							<option>Bedroom</option>
							<option>Washroom</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="description" class="col-lg-1 control-label">Description</label>
					<div class="col-lg-10">
						<textarea name="description" path="description" class="form-control" rows="3"
							id="description" required="required"> </textarea>
					</div>
				</div>

				<div class="form-group">
					<label for="constructionPersonnel" class="col-lg-1 control-label">Assign To</label>
					<div class="col-lg-10">
						<select class="form-control" id="constructionPersonnel" name="constructionPersonnel">
							<option>Jane Smith</option>
							<option>Joey Batts</option>
							<option>Jackson Trig</option>
							<option>Jeffeory Spindle</option>
							<option>Jim Gerale</option>
							<option>Joelle Done</option>
						</select>
					</div>
				</div>

                <div class="form-group">
					<label for="category" class="col-lg-1 control-label">Category</label>
					<div class="col-lg-10">
						<select class="form-control" id="category" name="category">
				        <c:forEach var="category" items="${deficiency.categories}">
                	        <option>${category}</option>
                        </c:forEach>
                        </select>
					</div>
				</div>

				<input type="hidden" name="homeEnrollmentNumber" value="${unit.homeEnrollmentNumber}"/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

				<input type="submit" value="Save Deficiency" class="btn btn-primary" style="margin-left: 8.33333333333%" />


			    <c:url value="/workOrderDisplayUnitDeficiencies/${unit.homeEnrollmentNumber}" var="displayUnitDeficiencies" />
			    <a href="${displayUnitDeficiencies}" class="pull-right btn btn-default">Back</a>



			</fieldset>
		</form>

	</div>
</body>
</html>