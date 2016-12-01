<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="../scripts/photo.js"></script>
<title>Add Deficiency: ${unit.homeEnrollmentNumber}</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Open+Sans:400,700');
@import url('https://fonts.googleapis.com/icon?family=Material+Icons');

*{
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

html{
    background-color: #fff;
    font:normal 16px/1.5 sans-serif;
    color: #333;
}

h3{
    font: normal 32px/1.5 'Open Sans', sans-serif;
    color: #2c3e50;
    margin: 50px 0;
    text-align: center;
}


.container2{
    max-width: 1000px;
    margin: 50px auto;
    padding: 20px;
    background-color: #efefef;
}

.app2{
    width: 100%;
    position: relative;
}

.app2 #start-camera{
    display: none;
    border-radius: 3px;
    max-width: 400px;
    color: #fff;
    background-color: #448AFF;
    text-decoration: none;
    padding: 15px;
    opacity: 0.8;
    margin: 50px auto;
    text-align: center;
}

.app2 video#camera-stream{
    display: none;
    width: 100%;
}

.app2 img#snap{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 10;
    display: none;
}

.app2 #error-message{
    width: 100%;
    background-color: #ccc;
    color: #9b9b9b;
    font-size: 28px;
    padding: 200px 100px;
    text-align: center;
    display: none;
}

.app2 .controls{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 20;

    display: flex;
    align-items: flex-end;
    justify-content: space-between;
    padding: 30px;
    display: none;
}

.app2 .controls a{
    border-radius: 50%;
    color: #fff;
    background-color: #111;
    text-decoration: none;
    padding: 15px;
    line-height: 0;
    opacity: 0.7;
    outline: none;
    -webkit-tap-highlight-color: transparent;
}

.app2 .controls a:hover{
    opacity: 1;
}

.app2 .controls a.disabled{
    background-color: #555;
    opacity: 0.5;
    cursor: default;
    pointer-events: none;
}

.app2 .controls a.disabled:hover{
    opacity: 0.5;
}

.app2 .controls a i{
    font-size: 18px;
}

.app2 .controls #take-photo i{
    font-size: 32px;
}

.app2 canvas{
    display: none;
}



.app2 video#camera-stream.visible,
.app2 img#snap.visible,
.app2 #error-message.visible
{
    display: block;
}

.app2 .controls.visible{
    display: flex;
}



@media(max-width: 1000px){
    .container2{
        margin: 40px;
    }

    .app2 #start-camera.visible{
        display: block;
    }

    .app2 .controls a i{
        font-size: 16px;
    }

    .app2 .controls #take-photo i{
        font-size: 24px;
    }
}


@media(max-width: 600px){
    .container2{
        margin: 10px;
    }

    .app2 #error-message{
        padding: 80px 50px;
        font-size: 18px;
    }

    .app2 .controls a i{
        font-size: 12px;
    }

    .app2 .controls #take-photo i{
        font-size: 18px;
    }
}
#con {
	background-color: #EDEEFF;
	border-radius: 15px;
}
</style>
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
	<div class="jumbotron" id="con" >
		<c:url value="/workOrderSaveDeficiency" var="url" />
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
							<option>Bedroom</option>
							<option>Living Room</option>
							<option>Hallway</option>
							<option>Bedroom</option>
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
                	<label for="defPhoto" class="col-lg-1 control-label">Deficiency Photo</label>
                	<div class="col-lg-8">
                		<input path="defPhoto" name="defPhoto" class="form-control" id="defPhoto" readonly/> 
                	</div>
                	<div class="col-lg-2">
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                    Add Photo
                  </button>
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

				<input type="hidden" id="homeEnrollmentNumber" name="homeEnrollmentNumber" value="${unit.homeEnrollmentNumber}"/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

				<input type="submit" value="Save Deficiency" id="btnXlg" class="btn btn-primary" style="margin-left: 8.33333333333%" />

			    <c:url value="/workOrderDisplayUnitDeficiencies/${unit.homeEnrollmentNumber}" var="displayUnitDeficiencies" />
			    <a href="${displayUnitDeficiencies}" class="pull-right btn btn-default" id="btnXlg" style="margin-right: 8.33333333333%">Back</a>

			</fieldset>
		</form>
	</div>
	</div>
	<div class="modal fade" id="myModal">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title">Deficiency Photo</h4>
                      </div>
                      <div class="modal-body">
                        <div class="container2">

						  <div class="app2">
			
						    <a href="#" id="start-camera" class="visible">Touch here to start the app.</a>
						    <video id="camera-stream"></video>
						    <img id="snap">
			
						    <p id="error-message"></p>
			
						    <div class="controls">
						      <a href="#" id="delete-photo" title="Redo Photo" class="disabled"><i class="material-icons">replay</i></a>
						      <a href="#" id="take-photo" title="Take Photo"><i class="material-icons">camera_alt</i></a>
						      <a href="#" id="download-photo" download="def${deficiency.id}hen${unit.homeEnrollmentNumber}.png" title="Save Photo" 
						      onclick="saveDone()" class="disabled">
						      	<i class="material-icons">done</i></a>
						    </div>


			    <canvas></canvas>
			  </div>
			</div>
			
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="saveDone()">Close</button>
                  
                      </div>
                    </div><!-- /.modal-content -->
                  </div><!-- /.modal-dialog -->