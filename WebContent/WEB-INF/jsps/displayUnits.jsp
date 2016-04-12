<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
<title>aBode</title>
</head>
<body>
	
	<!-- This is checking for account creation
	
	<c:if test="${accountCreated}"><script>
		function myFunction() {
    		alert("Account Successfully Created");
			}
		</script>
	</c:if>
	
	-->
	
	<div style="margin: 2%">
		<h1>aBode</h1>
		<div class="list-group">
			<c:forEach var="subject" items="${subjectList}">
				<c:url value="/viewSubject/${subject.title}" var="viewUrl" />
				<a href="${viewUrl}" class="list-group-item"> ${subject.title} </a>
			</c:forEach>
		</div>

		<c:url value="/addSubject" var="addUrl" />
		<a href="${addUrl}" class="btn btn-primary">Add A New Subject</a>
	</div>

</body>
</html>