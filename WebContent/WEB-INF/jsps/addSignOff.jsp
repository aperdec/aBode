<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="../scripts/modernizr.custom.34982.js"></script>

<script src="../scripts/signing.js"></script>
<script src="../scripts/signatureCapture.js"></script>
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
#canvasContainer {
    border: 1px solid grey;
    border-radius: 5px;
    background-color:white;
}
#smallJum{
	background-color:#EDEEFF;
	padding: 2%;
	border-radius: 15px;
}
#bottomBtn{
margin: 2%
}
</style>
<title>SignOff Form</title>
</head>
<body>

	<div style="margin: 2%">
	<div id="smallJum">
	<fieldset>
		<c:url value="/addSignOff" var="url" />
		<form name="form" method="post" action="${url}"	class="form-horizontal" onsubmit="return verify()">

				<legend>SignOff Form</legend>

				<div class="form-group">
                	<p>I have inspected my new home and I agree that the descriptions of the items listed on
                	 this form are accurate.</p>	
				</div>
                                
				<!--entry row 1 -->
				
				<div class="form-group">
					<label for="date" class="col-lg-3 control-label">Date</label>

					<div class="col-lg-2">
						<input path="date" name="date" class="form-control" value="${form.date}"
							id="date" placeholder="" required="required" type="text" />
					</div>
				</div>
				<!--entry row 2 -->
				<div class="form-group">

					<label for="purchName" class="col-lg-3 control-label">Purchaser's Name</label>

					<div class="col-lg-4">
						<input path="purchName" name="txtPurchasersName" class="form-control" id="purchName"
							placeholder="" value="${form.purchName}" required="required" type="text" />
					</div>
				</div>
				<!--entry row 3 -->
				<div class="form-group">
				<label for="desName" class="col-lg-3 control-label">Designator's Name</label>

					<div class="col-lg-4">
						<input path="desName" name="desName" class="form-control" id="desName" value="${form.desName}"
							placeholder="" type="text" />

					</div>
				</div>
				<!-- row 4 -->
				<input type="hidden" name="homeEnrollmentNumber" value="${form.homeEnrollmentNumber}"/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<div class="form-group">
					<input type="submit" value="Save" class="pull-right btn btn-primary" />

				</div>
                </form>
				<div class="form-group">

					<label for="finalSig" class="col-lg-3 control-label">Designator / Purchaser's Signature</label>
					<div class="col-lg-4">
						<div id="canvasContainer" width="300px" >
    						<canvas id="signature" height="200px" />
    					</div>
					</div>
					
					<div><button id="acc2" onclick="accept()" class="btn btn-primary btn-sm">Accept</button></div>
					<div id="acc1"></div>
					<br><br>
					<div><button onclick="clearSig()" class="btn btn-default btn-sm">Redo</button></div>				

</div>
				</fieldset>
</div>
</div>
				<!-- end text -->
				<div id="bottomBtn">
                <div>
	                <p>* Purchasers or owners who intend to designate someone to conduct the PDI in their place should ensure they 
	                   provide written authority to the vendor/builder authorizing the designate to sign this form on their behalf</p>
	                 <br>
                 <!-- <p>I the homeowner, confirm that all repair work listed has been completed.</p> -->
                 </div>

				<!-- end of row 5 start of row 6 -->
				<!-- MAY NOT NEED
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
					
				
				</div> -->

				<!-- end of row 6 start of row 7 -->
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				
				<div class="form-group">
			        <c:url value="/" var="home" />
					<a href="${home}" class="pull-right btn btn-success" id="nextBtn">Finish</a>

				</div>

				<div class="form-group">
			        <c:url value="/displayUnitDeficiencies/${form.homeEnrollmentNumber}" var="displayUnitDeficiencies" />
					<a href="${displayUnitDeficiencies}" class="pull-left btn btn-default" id="backBtn">Back</a>

				</div>
				</div>
				
				
			
				<!-- end -->

	
                

	</div>


	<!-- footer area -->

</body>
</html>