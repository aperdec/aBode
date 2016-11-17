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
	padding-right:1%;
    }

    table{
    	border: #D1D0CE solid 1px;
    }
    
    #btnXlg {
    padding: 24px 34px;
    font-size: 16px;
    line-height: normal;
    border-radius: 8px;
    }
    </style>

<div class="jumbotron" id="con">
<center><h2>${unit.projectName}, Unit ${unit.unitNum}</h2></center>

	<div style="margin: 2%">
	<legend><h3>Deficiency List</h3></legend>
		<div class="list-group">
		<table class="table table-striped table-hover">
		  <thead>
		    <tr>
		      <th>#</th>
		      <th>Location</th>
		      <th>Deficiency Type</th>
		      <th>Notes</th>
		      <th>Assignee</th>
		      <th style="text-align: center;">Status</th>
		      <th></th>
		      <th></th>
		    </tr>
		  </thead>
		  <tbody>
			<c:forEach var="unitDeficiency" items="${unit.deficiencies}">
				<c:url value="/editDeficiency/${unit.homeEnrollmentNumber}/${unitDeficiency.id}" var="editUrl" />
				<tr>
				<td>${unitDeficiency.id}</td>
				<td>${unitDeficiency.location}</td>
				<td>${unitDeficiency.category}</td>
				<td>${unitDeficiency.description}</td>
				<td>${unitDeficiency.constructionPersonnel}</td>
				<td>
				    <c:choose>
	              <c:when test="${unitDeficiency.status}">
		              <c:url value="/workOrderCompleteDeficiencyUnit/${unitDeficiency.id}/${unitDeficiency.homeEnrollmentNumber}" var="completeUrl" />
					    <a href="${completeUrl}" class="btn btn-success pull-right">Complete</a>
	                
	              </c:when>
	              <c:otherwise>
	                <c:url value="/workOrderCompleteDeficiencyUnit/${unitDeficiency.id}/${unitDeficiency.homeEnrollmentNumber}" var="completeUrl" />
					    <a href="${completeUrl}" class="btn btn-warning pull-right">Incompleted</a>
	              </c:otherwise>
	            	</c:choose>
				</td>
				<td>
				<a href="${editUrl}" class="btn btn-primary pull-right">Edit</a>
				</td>
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
                        <c:url value="/workOrderDeleteDeficiency/${unitDeficiency.id}/${unit.homeEnrollmentNumber}" var="deleteUrl" />
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

		<c:url value="/workOrderAddDeficiency/${unit.homeEnrollmentNumber}" var="addUrl" />
		<a href="${addUrl}" id="btnXlg" class="btn btn-primary pull-right">Add Deficiency</a>

		<c:url value="/displayUnits/${unit.projectName}" var="backUrl" />
		<a href="${backUrl}" id="btnXlg" class="btn btn-default">Back</a>
	</div>
