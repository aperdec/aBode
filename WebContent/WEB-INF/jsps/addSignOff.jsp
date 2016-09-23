<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
.flex-v-center {
	display: flex;
	align-items: center;
}
</style>
<title>SignOff Form</title>
</head>
<body>

	<!-- <p style="font-size:160%;">aBode</p> -->



	<div style="margin: 2%">
	
		<c:url value="/register" var="url" />
		<form name="form" method="post" action="${url}"
			class="form-horizontal" onsubmit="return verify()">
			
			<div class="form-group">

					<label for="homeCivicAddress" class="col-lg-8 control-label">Vendor/Builder and Home Address Information</label>

					<div class="col-lg-4">
						<input path="homeCivicAddress" name="txtHomeCivicAddress"
							class="form-control" id="homeCivicAddress" placeholder="Enter Home Enrollment Number"
							required="required" type="text" />
					</div>


				</div>
				
				<div class="form-group">
				</div>


			<fieldset>

				<legend>SignOff Form</legend>


				<div class="form-group">
                                    <p>I have inspected my new home and I agree that the descriptions of the items listed on this form are accurate.</p>	
				</div>
                                
				<!-- -->

				<div class="form-group">

					<label for="purchasersName" class="col-lg-3 control-label">Purchaser's Name</label>

					<div class="col-lg-4">
						<input path="purchasersName" name="txtPurchasersName" class="form-control" id="purchasersName"
							placeholder="" required="required" type="text" />
					</div>

					<label for="designatorsName" class="col-lg-3 control-label">Designator's * Name</label>

					<div class="col-lg-2">
						<input path="designatorsName" name="txtDesignatorsName"
							class="form-control" id="designatorsName"
							placeholder="" required="required" type="text" />

					</div>
				</div>

				<!-- end of row 2 start of row 3 -->

				<div class="form-group">

					<label for="purchasersSig" class="col-lg-3 control-label">Purchasers Signature</label>

					<div class="col-lg-4">
						<input path="purchasersSig" name="txtPurchasersSig"
							class="form-control" id="purchasersSig" placeholder=""
							required="required" type="text" />
					</div>

					<label for="date" class="col-lg-3 control-label">Date</label>

					<div class="col-lg-2">
						<input path="date" name="txtDate" class="form-control"
							id="level" placeholder="" required="required" type="text" />
					</div>
				</div>

				<!-- end of row 3 start of row 4 -->
                                <div class="form-group">
                                    <p>* Purchasers or owners who intend to designate someone to conduct the PDI in their place should ensure they 
                                        provide written authority to the vendor/builder authorizing the designate to sign this form on their behalf</p>
                                    <br>
                                    <p>I the homeowner, confirm that all repair work listed has been completed.</p>
                                </div>

				<!-- end of row 5 start of row 6 -->

				<div class="form-group">

					<label for="purchasersSigAgree" class="col-lg-3 control-label">Purchasers Signature</label>

					<div class="col-lg-4">
						<input path="purchasersSigAgree" name="txtPurchasersSigAgree"
							class="form-control" id="purchasersSigAgree" placeholder=""
							required="required" type="text" />
					</div>

					<label for="dateAgree" class="col-lg-3 control-label">Date</label>

					<div class="col-lg-2">
						<input path="dateAgree" name="txtDateAgree" class="form-control"
							id="level" placeholder="" required="required" type="text" />
					</div>
					
				
				</div>

				<!-- end of row 6 start of row 7 -->
				
					<div class="form-group">
			        <c:url value="/" var="home" />
					<a href="${home}" class="pull-right btn btn-default">Finish</a>

					</div>

				<div class="form-group">


					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type="submit" value="Save"
						class="pull-right btn btn-default" onclick="verify()"
						 />

				</div>
				
				
			
				<!-- end -->

	
                        </fieldset>
                </form>

	</div>


	<!-- footer area -->

</body>
</html>