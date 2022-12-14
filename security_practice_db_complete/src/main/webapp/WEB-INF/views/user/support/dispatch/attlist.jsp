<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../../../views/includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<div class="menu-name">
				<span >파견 - 근태 조회</span>
			</div>
			<ol class="breadcrumb mb-4" style="padding-left: 10px;">
				<li class="breadcrumb-item active">Dispatch - Attendance List</li>
			</ol>
			
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			
			
		 <!-- /.panel-heading -->
      <div class="panel-body">
        <table class="table table-striped table-bordered table-hover">
          <thead>
          <div class="row">
          <!-- start search -->
          <div class="col-md-12">
          <tr>
	      <th scope="col">출퇴근ID</th>
	      <th scope="col">근태ID</th>
	      <th scope="col">출근시간</th>
	      <th scope="col">퇴근시간</th>
	      <th scope="col">초과근무시간</th>
  		 </tr>
          </thead>
		<tbody>
		<c:forEach var="list" items="${comlist}">
		    <tr>
		      <td>${list.commute_id}</td>
		      <td>${list.att_id}</td>
		      <td>${list.commute_in}</td>
		      <td>${list.commute_out}</td>
		      <td>${list.commute_wot}</td>
			 </tr>
		  </c:forEach> 
		  </tbody>
        </table>
         <button type="button" class="btn btn-primary back-user1">뒤로가기</button>
     </div>
			
			
			
		</div>
	</main>
<script src="/resources/js/hrbutton.js?ver=3"></script>
<%@include file="../../../../views/includes/footer.jsp" %>
			