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
	
	<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
#con {
	background-color: #EDEEFF;
}

table{
	border: #D1D0CE solid 1px;
}
#divCon {
   
}
label {
    text-align: left;
}
#sig{
	background-color: white;
}
body{
	font-size: 22px;
}
</style>
	
<title>Tarion PDI Form: ${unit.homeEnrollmentNumber}</title>
</head>
<body>

<script>
var e;

function ValidateHEN() {
	e = document.getElementById("homeEnrollmentNumber").value;
    //if you need text to be compared then use
    if(e <= 0 || e ==null || e=="") {
        $('#alert').show();
        $('#selectHEN').show();
        return false;
    } else if (isNaN(e)){
    	$('#alert').show();
        $('#selectHEN').show();
        return false;
    } else {
        return true;
    }
}

function Validate() {
    if (ValidateHEN()) {
        return true;
    } else if (ValidateHEN()) {
        $('#selectHEN').hide();
        return false;
    } else {
        return false;
    }
}
</script>

<div id="divCon">

<div style="margin: 2%">
<legend><h2>Pre-Delivery Inspection Report</h2></legend>
	<div class="jumbotron" id="legendCon" style="background-color:#EDEEFF">
	<c:url value="/pdiReportData" var="url2" />
	<form method="post" action="${url2}" class="form-horizontal" onsubmit="return Validate()">
			
			<div class="form-group" style="margin: 2%">
				<label class="pull-left control-label">Enter Home Enrollment Number</label>
				<input id="homeEnrollmentNumber" name="homeEnrollmentNumber" placeholder="Enter Home Enrollment Number" class="form-control" value="${unit.homeEnrollmentNumber}" required="required"/>
			</div>

			<div class="form-group" style="margin: 2%">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="submit" value="Go!" id="btnXlg" class="pull-right btn btn-primary" />

			</div>

			<c:choose>
                <c:when test="${errorHomeEnrollmentNumber}">
                    <div class="alert alert-danger" id="alert" >
                        <div id="selectHEN">Home Enrollment Number does not exist.</div>
                        <div id="selectHEN" class="collapse">Please enter a valid Home Enrollment Number.</div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-danger collapse" id="alert" >
                        <div id="selectHEN" class="collapse">Please enter a valid Home Enrollment Number.</div>
                    </div>
                </c:otherwise>
            </c:choose>
    </form>


	</div>
	
		<c:url value="/pdiReport" var="url" />
		<form name="form" class="form-horizontal" method="post"	action="${url}">
			<fieldset>
				<legend>TARION Pre-Delivery Inspection Form</legend>
				<div>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>Item #</th>
								<th>Room Location</th>
								<th>Description:</th>
							</tr>
						</thead>
						 <tbody>
			<c:forEach var="unitDeficiency" items="${unit.deficiencies}">
				<tr>
				<td>${unitDeficiency.id}</td>
				<td>${unitDeficiency.location}</td>
				<td>${unitDeficiency.category}</td> 
				<td>${unitDeficiency.description}</td>

				</tr>
			</c:forEach>
			</tbody>
					</table>
		
	</div>
	
	<div class="jumbotron" id="legendCon" style="background-color:#EDEEFF">

		<div class="form-group" style="margin: 2%">
		
			<div class="col-lg-12">
				<label for="dateOfPosession" class="pull-left control-label">Date of Posession</label>			
				<input path="dateOfPosession" name="posessionDate" class="form-control col-lg-10"
				 id="dateOfPosession" value="${unit.posessionDate}" required="required"
				  type="text" readonly/>
			</div>

			<div class="col-lg-12">
				<label for="venBuildRefNo" class="pull-left control-label">Vendor/Builder and Reference Number</label>
				<input path="venBuildRefNo" name="builderRefNum" class="form-control" 
				id="venBuildRefNo" placeholder="" required="required" type="text" 
				value="${builder.builderRefNum}" readonly/>
			</div>

			<div class="col-lg-12">
				<label for="lotNum" class="pull-left control-label">Lot # </label>
				<input path="unit.lotNumber" name="lotNumber" class="form-control"
				id="lotNumber" value="${unit.lotNumber}" required="required" type="text" readonly/>
			</div>

			<div class="col-lg-12">
				<label for="plan" class="pull-left control-label">Plan</label>
				<input path="plan" name="plan" class="form-control" id="plan"
				placeholder="" required="required" type="text" value="${unit.plan}" readonly/>
			</div>

			<div class="col-lg-12">
				<label for="municipality" class="pull-left control-label">Municipality</label>
				<input path="municipality" name="municipality" class="form-control"
				id="municipality" value="${unit.municipality}" required="required" type="text" readonly/>
			</div>
			
			<div class="col-lg-12">
				<label for="condoProjName" class="pull-left control-label">Condominium Project Name</label>
				<input path="condoProjName" name="projectName" class="form-control"
				id="condoProjName" value="${unit.projectName}" required="required"
				type="text" readonly/>
			</div>

			<div class="col-lg-12">
				<label for="level" class="pull-left control-label">Level</label>
				<input path="level" name="level" class="form-control" id="level"
				placeholder="" required="required" type="text"
				value="${unit.level}" readonly/>
			</div>
			

			<div class="col-lg-12">
				<label for="level" class="pull-left control-label">Unit</label>
				<input path="level" name="level" class="form-control" id="level"
				placeholder="" required="required" type="text"
				value="${unit.unitNum}" readonly/>
			</div>


			<div class="col-lg-12">
				<label for="homeCivicAddress" class="pull-left control-label">Home Civic Address</label>
				<input path="homeCivicAddress" name="address" class="form-control"
				id="homeCivicAddress" placeholder="" required="required"
				type="text" value="${unit.address}" readonly/>
			</div>


			<div class="col-lg-12">
				<label for="venBuildName" class="pull-left control-label">Vendor	/ Builder Name</label>
				<input path="venBuildName" name="builderName" class="form-control"
				id="venBuildName" placeholder="" required="required" type="text"
				value="${builder.builderName}" readonly/>
			</div>

			
			<div class="col-lg-12">
				<label for="repName" class="pull-left control-label">Representative Name</label>
			</div>
			<div class="col-lg-5">
				<input path="repName" name="repName" class="form-control" id="repName" 
					placeholder="" type="text" required="required" value="${form.repName}"  readonly/>
			</div>
			<div class="col-lg-6" id="sig" style="margin: 2%">
				<img id="theimage" src="imageDisplay/${form.homeEnrollmentNumber}/2" />
			</div>
				<div>		
					<label for="id" class="pull-right control-label" style="margin: 2%">This section
					should be completed and signed by all persons who are shown as
					purchasers on the APS for the home, or as owners of land in a
					construction contract ( and / or by their designate* ).</label>
				</div>
			</div>

	</div>
	

			
	<div class="jumbotron" id="legendCon" style="background-color:#EDEEFF">
	
		<div style="margin: 2%">
			<div class="form-group"  >
				<div>
					<label for="id" class="pull-right control-label" style="margin: 2%">I have
						inspected my new home and I agree that the descriptions of the items
						listed on this form are accurate</label>
				</div>
				<div class="col-lg-12">
					<div class="col-lg-5">
						<input path="id" name="id" class="form-control" id="id" value="${form.purchName}"  readonly/>
					</div>
			
					<div class="col-lg-6" id="sig" id="sig" style="margin: 2%">
						<img id="theimage" src="imageDisplay/${form.homeEnrollmentNumber}" />
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
						<div>
							<label for="deadline" class="col-lg-2 pull-left control-label" >Purchaser's Name</label>
						</div>
					<div>
						<label for="deadline" class="col-lg-5 pull-right control-label" >Purchaser's Signature</label>
					</div>
				</div>
				<div class="col-lg-12 pull-right" style="margin: 2%">
					
						
							<div class="col-lg-10 col-md-8 col-sm-8 col-xs-8">
								<label for="date" class="control-label pull-right">Date (YYYY/MM/DD)</label>
							</div>
							<div class="col-lg-2 col-md-4 col-sm-4 col-xs-4">
								<input path="id" name="id" class="form-control col-md-12" id="id" value="${form.date}"  readonly/>
							</div>

				</div>
				<div class="col-lg-12 pull-right" style="margin: 2%">
					<label for="deadline" class="col-lg-12 control-label pull-left">*Purchasers
					or owners who intend to designate someone to conduct the PDI in
					their place should ensure they provide written authority to the
					vendor/builder authorizing the designate to sign this form on their
					behalf
					</label>
				</div>
			</div>
		</div>

	</div>
			</fieldset>
	</form>
	
		<div>
			<input type="hidden" name="homeEnrollmentNumber" value="" /> 
			<input	type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</div>
		
	<div class="jumbotron" id="legendCon" style="background-color:#EDEEFF; ">
		<div style="padding:1%;" class="col-lg-12">	

			<!-- <input type="submit" value="Finish" class="btn btn-primary"
				style="margin-left: 8.33333333333%" /> -->
			
			<c:url value="/selectReport" var="selectReport" />
			<a href="${selectReport}" class="pull-right btn btn-default" id="btnXlg">Back</a>
			
			<c:url value="/" var="home" />
			<a href="${home}" class="pull-left btn btn-success" id="btnXlg">Finish</a>
		</div>	
		<br>
	</div>
	
</div>
</div>
</body>
</html>