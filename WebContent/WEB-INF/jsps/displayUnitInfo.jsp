<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
var e;

var used;
function hide(){
used = document.getElementById("repName").value;
document.getElementById("nextBtn").style.visibility = 'hidden';
document.getElementById("saveBtn").style.visibility = 'hidden';
document.getElementById("nextBtn").style.visibility = 'visible';

if (used === ""){
	//alert(used);
	document.getElementById("nextBtn").style.visibility = 'hidden';
}
}

function showSave(){
	document.getElementById("saveBtn").style.visibility = 'visible';
}

function acceptSig(){
	var link = document.getElementById("signature").toDataURL();
	document.getElementById("acc2").innerHTML='<a id="acc2" data-toggle="tooltip" data-placement="top" title="Attatch Signature to Form" download="refSig.png" href="'+link+'">Attach</a>';
	showSave();
	//alert("hi");
}

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



<style>
.flex-v-center {
	display: flex;
	align-items: center;
}

#smallJum{
	background-color:#EDEEFF;
	padding: 2%;
	border-radius: 15px;
}
#acc2 {
    padding: 21px 26px;
    font-size: 16px;
    line-height: normal;
    border-radius: 8px;
    color:white;
    }
#nextBtn {
    padding: 24px 34px;
    font-size: 16px;
    line-height: normal;
    border-radius: 8px;
    }
#topEntry{
	margin: 1%;
}
#saveBtn{
    padding: 24px 34px;
    font-size: 16px;
    line-height: normal;
    border-radius: 8px;
    }
</style>

<body onload="hide()">

	<div style="margin: 2%">
	<legend><h2>Pre-Delivery Inspection (Step 1 of 3)</h2></legend>
		<c:url value="/displayUnitData" var="url" />

<form method="post" action="${url}" class="form-horizontal" onsubmit="return Validate()">
	<div id="topEntry">
			<div class="form-group">

				<label class="col-lg-8 control-label">Enter Home Enrollment Number</label>

					<input path="homeEnrollmentNumber" name="homeEnrollmentNumber" placeholder="Enter Home Enrollment Number" class="form-control"
					id="homeEnrollmentNumber" required="required" data-toggle="tooltip" data-placement="top" value="${unit.homeEnrollmentNumber}" title="Enter Home Enrollment Number"/>
			</div>
			<div class="form-group">				
				<input data-toggle="tooltip" data-placement="top" title="Display Unit Data"
				type="submit" value="Load Unit" id="btnXlg" class="pull-right btn btn-primary" />
			</div>
	</div>

				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

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
			<div id="error"></div>
<div id="smallJum">
		<fieldset>
			<c:url value="/saveUnit" var="url2" />
			<form name="form" method="post" action="${url2}"
				class="form-horizontal" onsubmit="return verify()">

				<legend>Unit Information</legend>

				<div class="form-group">

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
							required="required" type="text" value="${builder.builderRefNum}"/>

					</div>

				</div>
				<!-- Top row ends row 2 starts -->

				<div class="form-group">

					<label for="lotNum" class="col-lg-1 control-label">Lot # </label>

					<div class="col-lg-1">
						<input path="unit.lotNumber" name="lotNumber" class="form-control"
							id="lotNumber" value="${unit.lotNumber}" required="required" type="text" />

					</div>


					<label for="plan" class="col-lg-1 control-label">Plan</label>

					<div class="col-lg-4">
						<input path="plan" name="plan" class="form-control" id="plan"
							placeholder="" required="required" type="text" value="${unit.plan}"/>
					</div>

					<label for="municipality" class="col-lg-3 control-label">Municipality</label>

					<div class="col-lg-2">
						<input path="municipality" name="municipality"
							class="form-control" id="municipality" value="${unit.municipality}"
							required="required" type="text" />

					</div>

				</div>

				<!-- end of row 2 start of row 3 -->

				<div class="form-group">

					<label for="condoProjName" class="col-lg-3 control-label">Condominium
						Project Name</label>

					<div class="col-lg-4">
						<input path="condoProjName" name="projectName"
							class="form-control" id="condoProjName" value="${unit.projectName}"
							required="required" type="text" />
					</div>

					<label for="level" class="col-lg-3 control-label">Level</label>

					<div class="col-lg-2">
						<input path="level" name="level" class="form-control"
							id="level" placeholder="" required="required" type="text" value="${unit.level}" />
					</div>


				</div>

				<!-- end of row 3 start of row 4 -->

				<div class="form-group">

					<label for="homeCivicAddress" class="col-lg-3 control-label">Home
						Civic Address</label>

					<div class="col-lg-4">
						<input path="homeCivicAddress" name="address"
							class="form-control" id="homeCivicAddress" placeholder=""
							required="required" type="text" value="${unit.address}" />
					</div>

					<label for="level" class="col-lg-3 control-label">Unit Number</label>

					<div class="col-lg-2">
						<input path="unitNum" name="unitNum" class="form-control"
							id="unitNum" placeholder="" required="required" type="text" value="${unit.unitNum}" />
					</div>

				</div>


				<!-- end of row 5 start of row 6 -->


				<div class="form-group">


					<label for="venBuildName" class="col-lg-3 control-label">Vendor
						/ Builder Name</label>

					<div class="col-lg-9">
						<input path="venBuildName" name="builderName"
							class="form-control" id="venBuildName" placeholder=""
							required="required" type="text" value="${builder.builderName}" />
					</div>

				</div>

				<!-- end of row 6 start of row 7 -->

				<div class="form-group">


					<label for="repName" class="col-lg-3 control-label">Representative
						Name</label>

					<div class="col-lg-4">
						<input path="repName" name="repName" class="form-control"
							id="repName" placeholder="" type="text" value="${form.repName}"
							data-toggle="tooltip" data-placement="right" title="Please Enter a Name"/>
					</div>

				</div>

				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" name="homeEnrollmentNumber" value="${unit.homeEnrollmentNumber}"/>

				<!-- end of row 6 start of row 7 -->
								<!-- end of row 6 start of row 7 -->
				<div class="form-group">

					<!-- <a href="${url2}" class="pull-right btn btn-default">Save</a> -->
					<input type="submit" value="Save" class="pull-right btn btn-primary" id="saveBtn"/>
				</div>


			</form>
				<div class="form-group">

					<label for="repSignature" class="col-lg-3 control-label">Representative's
						Signature</label>

					<div class="col-lg-4">
						<div id="canvasContainer" width="300px"
						data-toggle="tooltip" data-placement="top" title="Signing Area">
    						<canvas id="signature" height="200px" />
    					</div>
					</div>
					
					<div><button id="acc2" class="btn btn-primary" onclick="acceptSig()">Accept</button></div>
					<div id="acc1"></div>
					<br><br>
					<div><button onclick="clearSig()" id="btnXlg" class="btn btn-default">Redo</button></div>
				</div>


		</fieldset>
</div>
				<div class="form-group">
			        <c:url value="/displayUnitDeficiencies/${unit.homeEnrollmentNumber}" var="displayUnitDeficiencies" />
			        <br />
				 <br />
					<a href="${displayUnitDeficiencies}" class="pull-right btn btn-success" id="nextBtn">Next</a>

				</div>
				 
				<div>
				<!--image display test. 
				 <img id="theimage" src="imageDisplay/${form.homeEnrollmentNumber}/2" /> Working! -->
				 </div> 
				 <br />
				 <br />
				 <br />
				 <br />
				 <br />
				
				 <legend> </legend>
	</div>

	<!-- </fieldset>
	
	</form> -->
	
	<!-- footer area -->

</body>