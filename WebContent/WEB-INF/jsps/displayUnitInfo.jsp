<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="scripts/modernizr.custom.34982.js"></script>

<script src="scripts/signing.js"></script>
<script src="scripts/signatureCapture.js"></script>


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
<style>
.flex-v-center {
	display: flex;
	align-items: center;
}

/*
Extra Large Button CSS
*/
.btn-lilG {
	padding: 8px 18px;
	font-size: 10px;
	border-radius: 30px;
	text-align: center;
	margin: 5px;
	border: 2px solid black;
	color:inherit;
	
}

#canvasContainer {
    border: 1px solid grey;
    border-radius: 5px;
}

</style>
<title>Unit Information</title>
</head>
<body>

	<div style="margin: 2%">

		<c:url value="/displayUnitData" var="url" />
		<!--<form name="form" class="form-horizontal" onsubmit="return verify()">-->

		<form:form commandName="unit" method="post" action="${url}" class="form-horizontal">

			<div class="form-group">

				<label class="col-lg-8 control-label">Vendor/Builder
					and Home Address Information</label>

					<form:input path="homeEnrollmentNumber" placeholder="Enter Home Enrollment Number" class="form-control" required="required"/>
			</div>

			<div class="form-group">
				
				<input type="submit" value="Go!" class="pull-right btn btn-default" />

			</div>
</form:form>
<!--</form>-->
			<div id="error"></div>

		<fieldset>
			<c:url value="/saveUnit" var="url2" />
			<form name="form" method="post" action="${url2}"
				class="form-horizontal" onsubmit="return verify()">

				<legend>Unit Information</legend>

				<div class="form-group">

					<label for="dateOfPosession" class="col-lg-1 control-label">Date
						of Posession</label>

					<div class="col-lg-2">
						<input path="dateOfPosession" name="txDateOfPosession"
							class="form-control" id="dateOfPosession"
							value="${unit.posessionDate}" required="required" type="text" />
					</div>

					<label for="venBuildRefNo" class="col-lg-7 control-label">Vendor/Builder
						and Reference Number</label>

					<div class="col-lg-2">
						<input path="venBuildRefNo" name="txtVenBuildRefNo"
							class="form-control" id="venBuildRefNo" placeholder=""
							required="required" type="text" />

					</div>

				</div>
				<!-- Top row ends row 2 starts -->

				<div class="form-group">

					<label for="lotNum" class="col-lg-1 control-label">Lot # </label>

					<div class="col-lg-1">
						<input path="lotNum" name="txtlotNum" class="form-control"
							id="lotNum" value="${unit.lotNumber}" required="required" type="text" />

					</div>


					<label for="plan" class="col-lg-1 control-label">Plan</label>

					<div class="col-lg-4">
						<input path="plan" name="txtPlan" class="form-control" id="plan"
							placeholder="" required="required" type="text" value="${unit.plan}"/>
					</div>

					<label for="municipality" class="col-lg-3 control-label">Municipality</label>

					<div class="col-lg-2">
						<input path="municipality" name="txtMunicipality"
							class="form-control" id="municipality" value="${unit.municipality}"
							required="required" type="text" />

					</div>

				</div>

				<!-- end of row 2 start of row 3 -->

				<div class="form-group">

					<label for="condoProjName" class="col-lg-3 control-label">Condominium
						Project Name</label>

					<div class="col-lg-4">
						<input path="condoProjName" name="txtCondoProjName"
							class="form-control" id="condoProjName" value="${unit.projectName}"
							required="required" type="text" />
					</div>

					<label for="level" class="col-lg-3 control-label">Level</label>

					<div class="col-lg-2">
						<input path="level" name="txtLevel" class="form-control"
							id="level" placeholder="" required="required" type="text" value="${unit.level}" />
					</div>


				</div>

				<!-- end of row 3 start of row 4 -->

				<div class="form-group">

					<label for="homeCivicAddress" class="col-lg-3 control-label">Home
						Civic Address</label>

					<div class="col-lg-4">
						<input path="homeCivicAddress" name="txtHomeCivicAddress"
							class="form-control" id="homeCivicAddress" placeholder=""
							required="required" type="text" value="${unit.address}" />
					</div>

					<label for="level" class="col-lg-3 control-label">Unit Number</label>

					<div class="col-lg-2">
						<input path="unitNum" name="txtUnitNum" class="form-control"
							id="unitNum" placeholder="" required="required" type="text" value="${unit.unitNum}" />
					</div>

				</div>


				<!-- end of row 5 start of row 6 -->


				<div class="form-group">


					<label for="venBuildName" class="col-lg-3 control-label">Vendor
						/ Builder Name</label>

					<div class="col-lg-9">
						<input path="venBuildName" name="txtVenBuildName"
							class="form-control" id="venBuildName" placeholder=""
							required="required" type="text" />
					</div>

				</div>

				<!-- end of row 6 start of row 7 -->

				<div class="form-group">


					<label for="repName" class="col-lg-3 control-label">Representative
						Name</label>

					<div class="col-lg-4">
						<input path="repName" name="txtRepName" class="form-control"
							id="repName" placeholder="" required="required" type="text" />
					</div>

				</div>
				
				<!-- end of row 6 start of row 7 -->
				
				<div class="form-group">

					<label for="repSignature" class="col-lg-3 control-label">Representative's
						Signature</label>

					<div class="col-lg-4">
						<div id="canvasContainer" width="300px" >
    						<canvas id="signature" height="200px" />
    					</div>
					</div>

				</div>

				<!-- end of row 6 start of row 7 -->
				<div class="form-group">

					<a href="${url2}" class="pull-right btn btn-default">Save</a>

				</div>
				
				
				<div class="form-group">
			        <c:url value="/displayUnitDeficiencies/${unit.homeEnrollmentNumber}" var="displayUnitDeficiencies" />
					<a href="${displayUnitDeficiencies}" class="pull-right btn btn-default">Next</a>

				</div>
			</form>
		</fieldset>

	</div>

	<!-- </fieldset>
	</form> -->

	<!-- footer area -->

</body>
</html>