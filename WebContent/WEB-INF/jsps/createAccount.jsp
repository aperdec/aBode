<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<c:url value="/css/style.css" />">
<script src="<c:url value="/scripts/script.js" />"></script>
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
<title>Insert title here</title>
</head>
<body>

	<div id="error"></div>
	
	<div style="margin: 2%">
	<c:url value ="/register" var="url" />
		<form name="form" method="post" action="${url}" class="form-horizontal" onsubmit="return verify()">
			<fieldset>
				<legend>Enter User Information</legend>
				
				<div class="form-group">
					<label for="inputUsername" class="col-lg-1 control-label">Username</label>
					<div class="col-lg-10">
						<input path="username" name="username" class="form-control" id="inputUsername"
							placeholder="Username" required="required" type="text" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputPassword" class="col-lg-1 control-label">Password</label>
					<div class="col-lg-10">
						<input path="password" class="form-control" id="inputPassword"
							placeholder="Password" required="required" name="password" type="password"/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputRePassword" class="col-lg-1 control-label">Re-enter Password</label>
					<div class="col-lg-10">
						<input path="verifyPassword" class="form-control" id="inputRePassword"
							placeholder="Re-enter Password" required="required" name="verifyPassword" type="password" />
					</div>
				</div>
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

				<input type="submit" value="Create Account!" class="btn btn-primary " onclick="verify()"
					style="margin-left: 8.33333333333%" />
					
			</fieldset>
		</form>
	</div>
</body>
</html>