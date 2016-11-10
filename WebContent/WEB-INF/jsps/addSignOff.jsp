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

<script type="text/javascript">
var e;
var used;

function hide(){
//used = document.getElementById("repName").value;
//disable save on load
$( "#btnXlg2" ).prop( "disabled", true );


document.getElementById("btnXlg").style.visibility = 'visible';
document.getElementById("btnXlg2").style.visibility = 'visible';

if (used === ""){
	//alert(used);
	document.getElementById("btnXlg").style.visibility = 'visible';
}
}

function showSave(){
	$( "#btnXlg2" ).prop( "disabled", false );
	//$( "#nextBtn" ).prop( "disabled", false );
//	$('a').disable(false);

	//document.getElementById("saveBtn").style.visibility = 'visible';
}

function enableNextBtn(){
	$('a').disable(false);
}

function disableNextBtn(){
	$('a').disable(false);
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
//Function to enable disable Next button HREF
$(function() {
    jQuery.fn.extend({
        disable: function(state) {
            return this.each(function() {
                var $this = $(this);
                if($this.is('input'))
                    this.disabled = state;
                else
                    $this.toggleClass('disabled', state);
            });
        }
    });
    
   // $('a').disable(true);
   
    $('body').on('click', 'a.disabled', function(event) {
        event.preventDefault();
    });
}); 

</script>
<link rel="stylesheet" type="text/css" href="../css/style.css">	
	
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
#acc2 {
    padding: 21px 26px;
    font-size: 16px;
    line-height: normal;
    border-radius: 8px;
    color:white;
    }
</style>
<title>SignOff Form</title>
</head>
<body onload="hide()">
<div id="titleCon"><legend><h2>Pre-Delivery Inspection (Step 3 of 3)</h2></legend></div>
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
				<!-- <input type="submit" value="Save" id="btnXlg2" class="pull-right btn btn-primary" /> -->

				</div>
              <!--   </form> -->
				<div class="form-group">

					<label for="finalSig" class="col-lg-3 control-label">Designator / Purchaser's Signature</label>
					<div class="col-lg-4">
						<div id="canvasContainer" width="300px" >
    						<canvas id="signature" height="200px" />
    					</div>
					</div>
					
					<div><button id="acc2" onclick="accept()" class="btn btn-primary btn-sm" type="button">Accept</button></div>
					<div id="acc1"></div>
					<br><br>
					<div><button onclick="clearSig()" id="btnXlg" class="btn btn-default btn-sm" type="button">Redo</button></div>				

</div>
				<!-- </fieldset> -->
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
			        <input type="submit" value="Save and Proceed" id="btnXlg2" class="pull-right btn btn-success" />
				<!-- <a href="${home}" class="pull-right btn btn-success" id="btnXlg2">Finish</a> -->
				</fieldset>
</form>
				</div>

				<div class="form-group">
				
			        <c:url value="/displayUnitDeficiencies/${form.homeEnrollmentNumber}" var="displayUnitDeficiencies" />
					<a href="${displayUnitDeficiencies}" class="pull-left btn btn-default" id="btnXlg">Back</a>

				</div>
				</div>
				<br />
				<br />
				<legend> </legend>
				<br />
				<br />
				<br />
				<br />
				<!-- end -->

	
                

	</div>


	<!-- footer area -->

</body>
</html>