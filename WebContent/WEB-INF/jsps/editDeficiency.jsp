<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
	
<link rel="stylesheet" type="text/css" href="/spring/css/style.css">

<style>
#con {
	background-color: #EDEEFF;
	border-radius: 15px;
}
#btnXlg2 {
    padding: 24px 34px;
    font-size: 16px;
    line-height: normal;
    border-radius: 8px;
    }
</style>
	
<title>Add Deficiency: ${unit.homeEnrollmentNumber}</title>
</head>
<body>
<script>
    function Validate() {
            if (ValidateCategories() && ValidateLocation()) {
                return true;
            } else if (ValidateCategories()) {
                $('#selectCategory').hide();
                return false;
            } else if (ValidateLocation()) {
                $('#selectLocation').hide();
                return false;
            } else {
                return false;
            }
        }

        function ValidateLocation() {
            var e = document.getElementById("location");
            //if you need text to be compared then use
            var strUser1 = e.options[e.selectedIndex].text;
            if(strUser1=="Select A Location") {
                $('#alert').show();
                $('#selectLocation').show();
                return false;
            } else {
                return true;
            }
        }

        function ValidateCategories() {
            var e = document.getElementById("category");
            //if you need text to be compared then use
            var strUser1 = e.options[e.selectedIndex].text;
            if(strUser1=="Select A Category") {
                $('#alert').show();
                $('#selectCategory').show();
                return false;
            } else {
                return true;
            }
        }

        function changeCP() {
            var cp = document.getElementById("constructionPersonnelM");
            $('#constructionPersonnel').val($('#constructionPersonnelM').val());
            return true;
        }
</script>

	<div style="margin: 2%">
		<c:url value="/workOrderSaveDeficiency" var="url" />
		<form name="form" class="form-horizontal" method="post" onsubmit="return Validate()" action="${url}">
		<div class="jumbotron" id="con">
			<fieldset>
				<legend>Enter or Edit Deficiency Information</legend>
				<br>
				<div class="alert alert-danger collapse" id="alert" >
                	<div id="selectCategory" class="collapse">Please select a category.</div>
                    <div id="selectLocation" class="collapse">Please select a location.</div>
                </div>

				<div class="form-group">
					<label for="id" class="col-lg-1 control-label">Deficiency Number</label>
					<div class="col-lg-10">
						<input path="id" name="id" class="form-control" id="id" value="${deficiency.id}" readonly/>
					</div>
				</div>

				<div class="form-group">
                	<label for="deadline" class="col-lg-1 control-label">Deadline</label>
                	<div class="col-lg-10">
                		<input path="deadline" name="deadline" class="form-control" id="deadline" value="${unit.posessionDate}" readonly/>
                	</div>
                </div>

				<div class="form-group">
					<label for="location" class="col-lg-1 control-label">Location</label>
					<div class="col-lg-10">
					<input name="location" class="form-control" id="location" value="${deficiency.location}" readonly/>
					</div>
				</div>

				<div class="form-group">
					<label for="description" class="col-lg-1 control-label">Description</label>
					<div class="col-lg-10">
						<input name="description" path="description" class="form-control" rows="3"
							id="description" value="${deficiency.description}" required="required"> </textarea>
					</div>
				</div>
				
				<div class="form-group">
					<label for="constructionPersonnel" class="col-lg-1 control-label">Assign To</label>
					<div class="col-lg-8">
						<input class="form-control" id="constructionPersonnel" name="constructionPersonnel" value="${deficiency.constructionPersonnel}" readonly/>
					</div>
					<div class="col-lg-2">
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                    Change Assignee
                  </button>
					</div>
				</div>

				<div class="modal fade" id="myModal">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title">Select Construction Personnel</h4>
                      </div>
                      <div class="modal-body">
                        <select class="form-control" id="constructionPersonnelM" name="constructionPersonnelM">
                            <c:forEach var="constructionPersonnel" items="${constructionPersonnelList}">
                                 <option>${constructionPersonnel.trade} - ${constructionPersonnel.name}</option>
                            </c:forEach>
                        </select>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="return changeCP()" data-dismiss="modal">Save changes</button>
                      </div>
                    </div><!-- /.modal-content -->
                  </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->

                <div class="form-group">
					<label for="category" class="col-lg-1 control-label">Category</label>
					<div class="col-lg-10">
					    <input name="category" class="form-control" id="category" value="${deficiency.category}" readonly/>
					</div>
				</div>

				<input type="hidden" name="homeEnrollmentNumber" value="${unit.homeEnrollmentNumber}"/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				
				<input type="submit" value="Save Deficiency" class="btn btn-primary" id="btnXlg2" style="margin-left: 8.33333333333%" />
					
					
			    <c:url value="/workOrderDisplayUnitDeficiencies/${unit.homeEnrollmentNumber}" var="displayUnitDeficiencies" />
                <a href="${displayUnitDeficiencies}" class="pull-right btn btn-default" id="btnXlg2" style="margin-right: 8.3%">Back</a>

			</fieldset>
			</div>
		</form>

	</div>
</body>
</html>