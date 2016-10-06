<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
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
<title>Tarion PDI Form: ${unit.homeEnrollmentNumber}</title>
</head>
<body>
	<div>
	
	<c:url value="/pdiReportData" var="url2" />
	
	<form method="post" action="${url2}" class="form-horizontal">
			
			<div class="form-group">

				<label class="col-lg-8 control-label">Enter Home Enrollment Number</label>

					<input name="homeEnrollmentNumber" placeholder="Enter Home Enrollment Number" class="form-control" required="required"/>
			</div>

			<div class="form-group">
				 <input	type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="submit" value="Go!" class="pull-right btn btn-default" />

			</div>
</form>
	
	</div>
	<div style="margin: 2%">
		<c:url value="/pdiReport" var="url" />
		<form name="form" class="form-horizontal" method="post"
			action="${url}">

			<fieldset>
				<legend>TARION Pre-Delivery Inspection Form</legend>
				<div>
					<table class="table table-inverse table-hover ">
						<thead>
							<tr>
								<th>#</th>
								<th>Item #</th>
								<th>Room Location</th>
								<th>Description:</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>Column content</td>
								<td>Column content</td>
								<td>Column content</td>
							</tr>
							<tr>
								<td>2</td>
								<td>Column content</td>
								<td>Column content</td>
								<td>Column content</td>
							</tr>

						</tbody>
					</table>


				</div>
				<div></div>
	</div>
	<div class="jumbotron other-colour">

		<div class="form-group">
			<label for="id" class="col-lg-1 control-label">Deficiency
				Number</label>
			<div class="col-lg-10">
				<input path="id" name="id" class="form-control" id="id" value=""
					readonly />
			</div>
			<label for="dateOfPosession" class="col-lg-1 control-label">Date
				of Posession</label>

			<div class="col-lg-2">
				<input path="dateOfPosession" name="posessionDate"
					class="form-control" id="dateOfPosession"
					value="${unit.posessionDate}" required="required" type="text" />
			</div>

			<label for="venBuildRefNo" class="col-lg-7 control-label">Vendor/Builder
				and Reference Number</label>

			<div class="col-lg-2">
				<input path="venBuildRefNo" name="builderRefNum"
					class="form-control" id="venBuildRefNo" placeholder=""
					required="required" type="text" value="${builder.builderRefNum}" />

			</div>

			<label for="lotNum" class="col-lg-1 control-label">Lot # </label>

			<div class="col-lg-1">
				<input path="unit.lotNumber" name="lotNumber" class="form-control"
					id="lotNumber" value="${unit.lotNumber}" required="required"
					type="text" />

			</div>


			<label for="plan" class="col-lg-1 control-label">Plan</label>

			<div class="col-lg-4">
				<input path="plan" name="plan" class="form-control" id="plan"
					placeholder="" required="required" type="text" value="${unit.plan}" />
			</div>

			<label for="municipality" class="col-lg-3 control-label">Municipality</label>

			<div class="col-lg-2">
				<input path="municipality" name="municipality" class="form-control"
					id="municipality" value="${unit.municipality}" required="required"
					type="text" />

			</div>
			<label for="condoProjName" class="col-lg-3 control-label">Condominium
				Project Name</label>

			<div class="col-lg-4">
				<input path="condoProjName" name="projectName" class="form-control"
					id="condoProjName" value="${unit.projectName}" required="required"
					type="text" />
			</div>

			<label for="level" class="col-lg-3 control-label">Level</label>

			<div class="col-lg-2">
				<input path="level" name="level" class="form-control" id="level"
					placeholder="" required="required" type="text"
					value="${unit.level}" />
			</div>
			<label for="level" class="col-lg-3 control-label">Unit</label>

			<div class="col-lg-2">
				<input path="level" name="level" class="form-control" id="level"
					placeholder="" required="required" type="text"
					value="${unit.unitNum}" />
			</div>
			<label for="homeCivicAddress" class="col-lg-3 control-label">Home
				Civic Address</label>

			<div class="col-lg-4">
				<input path="homeCivicAddress" name="address" class="form-control"
					id="homeCivicAddress" placeholder="" required="required"
					type="text" value="${unit.address}" />
			</div>
			<label for="venBuildName" class="col-lg-3 control-label">Vendor
				/ Builder Name</label>

			<div class="col-lg-9">
				<input path="venBuildName" name="builderName" class="form-control"
					id="venBuildName" placeholder="" required="required" type="text"
					value="${builder.builderName}" />
			</div>
			<label for="repName" class="col-lg-3 control-label">Representative
				Name</label>

			<div class="col-lg-4">
				<input path="repName" name="repName" class="form-control"
					id="repName" placeholder="" type="text" required="required"
					value="${form.repName}" />
			</div>
		</div>

	</div>
	<label for="id" class="col-lg-1 control-label">This section
		should be completed and signed by all persons who are shown as
		purchasers on the APS for the home, or as owners of land in a
		construction contract(and / or by their designate*).</label>
	<div class="jumbotron other-colour">

		<div class="form-group">
			<label for="id" class="col-lg-1 control-label">I have
				inspected my new home and I agree that the descriptions of the items
				listed on this form are accurate</label>

		</div>

		<div class="form-group">
			<div class="col-lg-6">
				<input path="id" name="id" class="form-control" id="id" value="${form.purchName}"
					readonly />
			</div>
			<div class="col-lg-6">
				<img id="theimage" src="imageDisplay/${form.homeEnrollmentNumber}" />
			</div>
			<label for="deadline" class="col-lg-1 control-label">Purchaser's
				Name</label> <label for="deadline" class="col-lg-1 control-label">Purchaser's
				Signature</label>

			<div class="col-lg-6">
				<input path="id" name="id" class="form-control" id="id" value=""
					readonly />
			</div>
			<div class="col-lg-6">
				<input path="deadline" name="deadline" class="form-control"
					id="deadline" value="" readonly />
			</div>
			<label for="deadline" class="col-lg-1 control-label">Purchaser's
				Name</label> <label for="deadline" class="col-lg-1 control-label">Purchaser's
				Signature</label>
				
				

			<div class="col-lg-6">
				<input path="id" name="id" class="form-control" id="id" value=""
					readonly />
			</div>
			<div class="col-lg-6">
				<input path="deadline" name="deadline" class="form-control"
					id="deadline" value="" readonly />
			</div>
			<label for="deadline" class="col-lg-1 control-label">Purchaser's
				Name</label> <label for="deadline" class="col-lg-1 control-label">Purchaser's
				Signature</label>
			<div class="col-lg-6">
				<input path="id" name="id" class="form-control" id="id" value=""
					readonly /> <label for="deadline" class="col-lg-1 control-label">Date
					(YYYY/MM/DD)</label>
			</div>
			<label for="deadline" class="col-lg-1 control-label">*Purchasers
				or owners who indend to designate someone to conduct the PDI in
				their place should ensure they provide written authority to the
				vendor/builder authorizng the designate to sign this form on their
				behalf</label>
		</div>

		</fieldset>
		</form>

	</div>
	<div class="jumbotron">

		<input type="hidden" name="homeEnrollmentNumber" value="" /> <input
			type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		<input type="submit" value="Finish" class="btn btn-primary"
			style="margin-left: 8.33333333333%" />


		<c:url value="/displayUnitDeficiencies/${unit.homeEnrollmentNumber}"
			var="displayUnitDeficiencies" />
		<a href="${pdiReport}" class="pull-right btn btn-default">Back</a>

	</div>
</body>
</html>