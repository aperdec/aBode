<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
</script>

	<div style="margin: 2%">
		<c:url value="/saveDeficiency2" var="url" />
		<form name="form" class="form-horizontal" method="post" onsubmit="return Validate()" action="${url}">

			<fieldset>
				<legend>Enter or Edit Information</legend>

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
						<select name="location" class="form-control" id="location">
						    <option>Select A Location</option>
							<option>Kitchen</option>
							<option>Master Bedroom</option>
							<option>Bedroom</option>
							<option>Living Room</option>
							<option>Dining Room</option>
							<option>Hallway</option>
							<option>Master Washroom</option>
							<option>Washroom</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="description" class="col-lg-1 control-label">Description</label>
					<div class="col-lg-10">
						<textarea name="description" path="description" class="form-control" rows="3"
							id="description" required="required"> </textarea>
					</div>
				</div>
				
				<div class="form-group">
					<label for="constructionPersonnel" class="col-lg-1 control-label">Assign To</label>
					<div class="col-lg-10">
						<select class="form-control" id="constructionPersonnel" name="constructionPersonnel">
							<c:forEach var="constructionPersonnel" items="${constructionPersonnelList}">
                                 <option>${constructionPersonnel.trade} - ${constructionPersonnel.name}</option>
                            </c:forEach>
						</select>
					</div>
				</div>

                <div class="form-group">
					<label for="category" class="col-lg-1 control-label">Category</label>
					<div class="col-lg-10">
						<select class="form-control" id="category" name="category">
				        <c:forEach var="category" items="${categories.categoryList}">
                	        <option>${category.subCategoryName}</option>
                        </c:forEach>
                        </select>
					</div>
				</div>

				<input type="hidden" name="homeEnrollmentNumber" value="${unit.homeEnrollmentNumber}"/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				
				<input type="submit" value="Save Deficiency" class="btn btn-primary" id="btnXlg2" style="margin-left: 8.33333333333%" />
					
					
			    <c:url value="/displayUnitDeficiencies2/${unit.homeEnrollmentNumber}" var="displayUnitDeficiencies2" />
			    <a href="${displayUnitDeficiencies2}" id="btnXlg2" class="pull-right btn btn-default">Back</a>

			</fieldset>
		</form>

	</div>