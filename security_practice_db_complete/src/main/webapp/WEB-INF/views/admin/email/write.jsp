<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../../../views/includes/header.jsp" %>

<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                    	<h1 class="mt-4 breadcrumb mb-4 layout-center">
							<input type="text" name="mem_id" value='공지메일 발신' class="login-name" readonly/>   
						</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Email Send</li>
                        </ol>

<form action="/admin/email/send.do" method="post">
  <div class="form-group">
    <label for="mem_id">발신자 명</label>
	<input type="text" name="mail_name" class="form-control" />
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
    <input type="text" class="form-control" name="mail_content" >
  </div>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  <input type="submit" value="전송">
</form>

<span style="color:red">${message}</span>

</div>
</div>

<%@include file="../../includes/footer.jsp" %>
</div>