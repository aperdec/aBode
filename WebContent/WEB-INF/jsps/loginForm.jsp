<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


	<c:if test="${param.error != null}">
		<div id="error">No such account exists.  Please check your username and password!</div>
	</c:if>
	<div style="margin:2%">
		<c:url value ="/login" var="url" />
		<form name="form" method="post" class="form-horizontal" action="${url}">
			<fieldset>
				<legend>Login</legend>
				
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
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="submit" value="Login!" onclick="login()" class="btn btn-inverse "
					style="margin-left: 8.33333333333%" />
				<c:url value="/createAccount" var="createUrl"/>
				<a href="${createUrl}" class="btn btn-inverse ">Create an Account</a>
			</fieldset>
		</form>
	
	</div>