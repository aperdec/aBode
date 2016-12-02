<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
#feedbackDiv {
	width: 90%;
}

#contactTable {
	width: 50%;
}

table td {
	padding: 2%;
}

.boxBg {
	background-color: #EDEEFF
}

#a1 {
	display: none;
}
</style>

<script type="text/javascript">
	var closed1;

	function hide() {
		document.getElementById('a1').style.display = 'none';
		document.getElementById('a2').style.display = 'none';
		document.getElementById('a3').style.display = 'none';
		closed1 = true;
		closed2 = true;
		closed3 = true;
		//alert(closed1);
	}

	function clickQ1() {
		if (closed1 == true) {
			//alert(closed1);
			document.getElementById('a1').style.display = "initial";
			closed1 = false;
			//alert(closed1);
		} else {
			document.getElementById('a1').style.display = 'none';
			closed1 = true;
		}
	}
	function clickQ2() {
		if (closed2 == true) {
			//alert(closed1);
			document.getElementById('a2').style.display = "initial";
			closed2 = false;
			//alert(closed1);
		} else {
			document.getElementById('a2').style.display = 'none';
			closed2 = true;
		}
	}
	function clickQ3() {
		if (closed3 == true) {
			//alert(closed1);
			document.getElementById('a3').style.display = "initial";
			closed3 = false;
			//alert(closed1);
		} else {
			document.getElementById('a3').style.display = 'none';
			closed3 = true;
		}
	}
	
</script>

<body onload="hide()">

	<div id="legendCon">
		<legend>
			<h2>Help</h2>
		</legend>
		<br>
		<legend>Frequently Asked Questions</legend>
		<li class="list-group-item" id="btnHovering" onclick="clickQ1 ()">
			<span id="q1">What to do when the Home Enrollment Number will
				not load the unit</span>
		</li>
		<div id="a1" class="modal-body">
			<li>Ensure you re logined with the correct credentials</li>
			<li>Make sure to select the "Load Unit" button</li>
			<li>Close Abode for 10 seconds then reopen Abode</li>
			<li>Call Times Group office to ensure the correct units have
				been assigned. Phone: 905-940-6286</li>

		</div>

		<br>
		<li class="list-group-item" id="btnHovering" onclick="clickQ2 ()">
			<span id="q2">The Next button is not functioning</span>
		</li>
		<div id="a2" class="modal-body">
			<li>Make sure all required fields are filled-in</li>
			<li>Ensure to save the page</li>
			<li>If this problem persists please contact JACK Software</li>
		</div>

		<br>
		<li class="list-group-item" id="btnHovering" onclick="clickQ3 ()">
			<span id="q3"> No Deficiencies are displaying</span>
		</li>
		<div id="a3" class="modal-body">
			<li>Make sure you have downloaded all patches</li>
			<li>Make sure there is an internet connection</li>
			<li>Re enter the home enrollment number </a></li>
			<li>Add or delete needed deficiencies</a></li>

			<li>Make sure to save</a></li>
		</div>


		<div id="legendCon" class="jumbotron"
			style="background-color: #EDEEFF">
			<div style="margin: 2%">
				<legend>Contact Information</legend>

				<b>
					<table id="contactTable">
						<tr>
							<td>Abode Software</td>
							<td>Phone: 647-232-2699 <br> Email: TechHelp@Abode.com
							</td>
						</tr>

						<tr>
							<td>Times Group Inc</td>
							<td>Phone: 905-940-6286 <br> Email:
								Rupal@TimesGroup.com
							</td>
						</tr>
					</table>
				</b>
			</div>
		</div>
		<div id="legendCon" class="jumbotron"
			style="background-color: #EDEEFF; height: 460px">
			<div style="margin: 2%">
				<legend>Submit a Question or Feedback</legend>
				<div id="feedbackDiv" class="form-group">
					<div class="col-lg-10 control-label">
						<input type="text" class="form-control" placeholder="Subject">
					</div>
					<br>
					<br>
					<div class="col-lg-10 control-label">
						<textarea rows="9" maxlength="350" class="form-control pull-left"
							placeholder="Short entry (350 character limit)">
				</textarea>
					</div>
					<br>
					<br>
					<div class="col-lg-7 control-label" style="margin:1%">
						<address> <form id="reset" >
							<a
								href="mailto:exampleAbode@exampleAbode.com? subject=Feedback&body=Message"
								id="btnXlg" class="btn btn-primary">Send Mail</a> 
								
								 <button type="submit" value="Reset" id="btnXlg" class="btn btn-default" onclick="clickQ4 ()">Reset</button>
								 </form>
						</address>

					</div>

				</div>



			</div>

		</div>
		<br>
</body>