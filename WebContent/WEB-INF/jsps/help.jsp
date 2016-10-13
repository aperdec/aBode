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

<link rel="stylesheet" type="text/css" href="css/style.css">

<style>
#contactTable{
	width:50%;
}
table td{
	padding: 2%;
}
.boxBg{
	background-color:#EDEEFF
}
</style>

<title>aBode</title>
</head>
<body>

	<div id="legendCon">
	<h2>Help</h2>
	<br>
	<legend>Frequently Asked Questions</legend>
		<li class="list-group-item" id="btnHovering" data-toggle="modal" data-target="#modal1">
          Home enrollment number will not generate data
        </li>
		<div class="modal" id="modal1">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Home enrollment number will not generate data</h4>
              </div>
              <div class="modal-body">
                <li>Make sure to select the go button</a></li>
                <li>Close Abode for 10 seconds then reopen Abode</a></li>
                <li>Make sure caps lock is off</a></li>
                <li>Login with the correct credentials </a></li>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnHovering" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
<br>
		<li class="list-group-item" data-toggle="modal" data-target="#modal2">
                  Next button is not functioning
                </li>
        		<div class="modal" id="modal2">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" id="btnHovering" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Next button is not functioning</h4>
                      </div>
                      <div class="modal-body">
                        <li>Make sure all fields are populated</a></li>
                        			<li>Populate needed fields </a></li>
                        			<li>Make sure to save</a></li>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      </div>
                    </div>
                  </div>
                </div>


<br>
	<li class="list-group-item" data-toggle="modal" data-target="#modal3">
                      No Deficiencies displaying
                    </li>
            		<div class="modal" id="modal3">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">No Deficiencies displaying</h4>
                          </div>
                          <div class="modal-body">
                            <li>Make sure you are updated</a></li>
                            			<li>Make sure there is a internet connection</a></li>
                            			<li>Re enter the home enrollment number </a></li>
                            			<li>Add or delete needed deficiencies</a></li>
                            			<li>Populate needed fields </a></li>
                            			<li>Make sure to save</a></li>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    </div>

	<div id="legendCon" class="jumbotron" style="background-color:#EDEEFF">
	<legend>Contact Information</legend>
	<b>
	<table id="contactTable">
		<tr>
			<td>Abode Software</td>
			<td>Phone: 647-232-2699 <br> Email: TechHelp@Abode.com</td>
		</tr>

		<tr>
			<td> Times Group Inc</td>
			<td>Phone: 905-940-6286 <br> Email: Rupal@TimesGroup.com</td>
		</tr>
	</table>
	</b>
	</div>
	<div id="legendCon" class="jumbotron" style="background-color:#EDEEFF">
		<legend>Submit a Question or Feedback</legend>

		<div class="col-lg-7 control-label">
			<input type="text" class="form-control" placeholder="Subject">
		</div><br>
		<div rows="6" class="col-lg-7 control-label">
			<textarea class="form-control">
			</textarea>
		</div>
		<div class="col-lg-7 control-label">
		<address>
			Select link to ask questions here: <a
				href="mailto:exampleAbode@exampleAbode.com? subject=Feedback&body=Message"
				target="#">Send Mail</a>
		</address>
		</div>
	</div>



</body>
</html>