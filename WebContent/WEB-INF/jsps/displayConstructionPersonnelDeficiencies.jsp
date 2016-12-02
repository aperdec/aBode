
	

	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    </style>

<div class="jumbotron" id="con">
<center><h2>Deficiency List</h2></center>
	<div style="margin: 2%">
	<legend>Work Assigned to ${constructionPersonnel}</legend>
		<div class="list-group">
		<table class="table table-striped table-hover">
		  <thead>
		    <tr>
		      <th>Project</th>
		      <th>Unit</th>
		      <th>Location</th>
		      <th>Deficiency Type</th>
		      <th>Notes</th>
		      <th>Deadline</th>
		      <th></th>
		      <th style="text-align: center;">Status</th>
		    </tr>
		  </thead>
		  <tbody>
			<c:forEach var="deficiency" items="${deficiencyList}">
				<tr>
				<td>${deficiency.projectName}</td>
				<td>${deficiency.unitNum}</td>
				<td>${deficiency.location}</td>
				<td>${deficiency.category}</td>
				<td>${deficiency.description}</td>
				<td><fmt:formatDate value="${deficiency.deadline}" pattern="yyyy-MM-dd" /></td>

				<td>
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#photoModal${deficiency.id}">
                        View Photo
                    </button>
                </td>

                <div class="modal fade" id="photoModal${deficiency.id}">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title">Deficiency Photo</h4>
                      </div>
                      <div class="modal-body">
                        <img id="defImage" src="../defImage/${deficiency.homeEnrollmentNumber}/${deficiency.id}" />
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                      </div>
                    </div><!-- /.modal-content -->
                  </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->

				<td style="text-align: center;">
					<c:choose>
	              <c:when test="${deficiency.status}">
		              <c:url value="/workOrderCompleteDeficiency/${deficiency.id}/${deficiency.homeEnrollmentNumber}/${deficiency.constructionPersonnel}" var="completeUrl" />
					    <a href="${completeUrl}" id="toggleBtnID" class="btn btn-success">Complete</a>

	              </c:when>
	              <c:otherwise>
	                <c:url value="/workOrderCompleteDeficiency/${deficiency.id}/${deficiency.homeEnrollmentNumber}/${deficiency.constructionPersonnel}" var="completeUrl" />
					    <a href="${completeUrl}" id="toggleBtnID" class="btn btn-warning">Incomplete</a>
	              </c:otherwise>
	            	</c:choose>

				</td>
				</tr>
			</c:forEach>
			</tbody>
			</table>
		</div>
	</div>
</div>

	<div style="padding: 0% 2%">

       	<c:url value="/displayConstructionPersonnel" var="backUrl" />
       	<a href="${backUrl}" id="btnXlg" class="btn btn-default">Back</a>
    </div>
