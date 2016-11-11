<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
#con {
	background-color: #EDEEFF;
}

table{
	border: #D1D0CE solid 1px;
}

#constructionPersonnel{
    height: auto;
    font-size: 16px;
    padding: 12px;
    line-height: 28px;
    border-radius: 8px;
}
#assignLbl{
    height: auto;
    font-size: 16px;
    padding: 16px;
    line-height: 28px;
    border-radius: 8px;
}
</style>

<title>Tarion Report Selection</title>

	<div style="margin: 2%;">
		<c:url value="/selectReport" var="url" />
		<form name="form" class="form-horizontal" method="post" action="${url}">
		<fieldset>
		<div class="jumbotron" id="legendCon" style="background-color:#EDEEFF">

		<div class="form-group">
			
			<label for="constructionPersonnel" class="col-lg-2 pull-left control-label" id="assignLbl">Assign
				To</label>
			<div class="col-lg-9" >
				<select class="form-control" id="constructionPersonnel"
					name="constructionPersonnel">
					<optgroup label="">
						<option>Pre-Delivery Inspection Report</option>
					</optgroup>
					<optgroup label="">
						<option>Other...</option>
					</optgroup>
				</select>
				</div>
				
			</div>
			<div class="form-group">
			<input type="hidden" name="homeEnrollmentNumber" value="" /> 
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="col-lg-8 col-lg-offset-10">
			<c:url value="/pdiReport" var="pdiReport" />
			<a href="${pdiReport}" id="btnXlg" class="pull-left btn btn-success">Next</a>
			</div>
		</div>

	</div>
			</fieldset>
			</form>
			
	</div>