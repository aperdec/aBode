	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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