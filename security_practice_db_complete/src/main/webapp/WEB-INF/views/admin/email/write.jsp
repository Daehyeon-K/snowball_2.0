<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../../views/includes/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<div class="row menu-card-size">
               <div class="card mb-4">
                   <div class="card-header">
                       <i class="fas fa-chart-area me-1"></i>
                       공지메일 발신
                   </div>
                   <div class="card-body">
                    <div style="letter-spacing:0; word-spacing:0; " >

					
					<form action="/admin/email/send.do?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="mem_id">발신자 명</label>
	<input type="text" name="mail_name" class="form-control" value='<sec:authentication property="principal.user.mem_name"/>' readonly/>
  </div>
  <div class="form-group">
	<label for="approval_type_id">발신자 이메일</label>
	<input type="text" name="sender_id" class="form-control" value="jsw30295@gmail.com" readonly />
  </div>
  <div class="form-group">
    <label for="approval_inter_id">수신자 이메일</label>
    <input type="text" name="receiver_id" class="form-control" />
  </div>
  <div class="form-group">
    <label for="approval_final_id">제목</label>
    <input type="text" name="mail_title" class="form-control" />
  </div>
  <div class="form-group">
    <label for="approval_reject">내용</label>
    <!-- <input type="text" class="form-control" name="mail_content" > -->
    <textarea name="mail_content" class="form-control" cols="30" rows="10"></textarea>
  </div>
   <div class="form-group">
   	<label for="attach">파일첨부</label>
   	<input type="file" name="attach" id="attach" />
   </div>
<%--   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
  <input type="submit" value="전송" class="btn btn-default">
</form>

<span style="color:red">${message}</span>
					

</div>
</div>
</div>
</div>
</main>
<%@include file="../../../views/includes/footer.jsp"%>
			