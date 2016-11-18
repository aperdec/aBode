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
	margin: 2%;
	border-radius: 15px;
}

table{
	border: #D1D0CE solid 1px;
}
#titleCon{
	margin: 2%;
}
#nextDbtn{
    padding: 24px 70px;
    font-size: 16px;
    line-height: normal;
    border-radius: 8px;
    }
#btnXlg {
    padding: 24px 34px;
    font-size: 16px;
    line-height: normal;
    border-radius: 8px;
    }
</style>

<div style="margin: 2%">
<legend><h2>Build Inspection (Step 2 of 2)</h2></legend>
</div>
<div class="jumbotron" id="con">
<center><h2>Unit ${unit.unitNum} Deficiency List</h2></center>
	<div style="margin: 2%">
		<div class="list-group">
		<table class="table table-striped table-hover">
		  <thead>
		    <tr>
		      <th>#</th>
		      <th>Location</th>
		      <th>Deficiency Type</th>
		      <th>Description</th>
		      <th></th>
		      <th></th>
		    </tr>
		  </thead>
		  <tbody>
			<c:forEach var="unitDeficiency" items="${unit.deficiencies}">
				<tr>
				<td>${unitDeficiency.id}</td>
				<td>${unitDeficiency.location}</td>
				<td>${unitDeficiency.category}</td> 
				<td>${unitDeficiency.description}</td>

				<td>
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#photoModal${unitDeficiency.id}">
                        View Photo
                    </button>
                </td>

                <div class="modal fade" id="photoModal${unitDeficiency.id}">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title">Deficiency Photo</h4>
                      </div>
                      <div class="modal-body">
                        <img id="defImage" src="defImage/${unit.homeEnrollmentNumber}/${unitDeficiency.id}" />
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                      </div>
                    </div><!-- /.modal-content -->
                  </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->

				<td>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal${unitDeficiency.id}">
                        Delete
                    </button>
                </td>

                <div class="modal fade" id="myModal${unitDeficiency.id}">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title">Confirm Delete</h4>
                      </div>
                      <div class="modal-body">
                        Are you sure you want to delete deficiency ${unitDeficiency.id}?
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <c:url value="/deleteDeficiency2/${unitDeficiency.id}/${unit.homeEnrollmentNumber}" var="deleteUrl" />
                        <a href="${deleteUrl}" class="btn btn-danger" style="margin:1%;">Delete</a>
                      </div>
                    </div><!-- /.modal-content -->
                  </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
				</tr>
			</c:forEach>
			</tbody>
			</table>
		</div>
	</div>
</div>
	<div style="padding: 0% 2%">
		
		<c:url value="/addDeficiency2/${unit.homeEnrollmentNumber}" var="addUrl" />
		<a href="${addUrl}" id="btnXlg"class="btn btn-primary">Add Deficiency</a> 

		<c:url value="/" var="finish" />
		<a href="${finish}" id="btnXlg" class="pull-right btn btn-success">Finish</a>
				<br />
				<br />
				<br />
		<legend> </legend>
	</div>