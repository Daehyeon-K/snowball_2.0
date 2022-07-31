<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>

<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                    	<h1 class="mt-4 breadcrumb mb-4 layout-center">
							<input type="text" name="mem_id" value='사용자 추가' class="login-name" readonly/>   
						</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Member Insert</li>
                        </ol>

<div>
<form method="post">
   <div class="form-group col-md-6">
     <label for="mem_id">아이디</label>
     <input type="text" class="form-control" name="mem_id" required>
   </div>
   <div class="form-group col-md-6">
     <label for="grade_id">직급</label>
     <input type="text" class="form-control" name="grade_id" required>
   </div>
   <div class="form-group col-md-6">
     <label for="company_id">원청</label>
     <input type="text" class="form-control" name="company_id">
   </div>
   <div class="form-group col-md-6">
     <label for="dept_id">부서</label>
     <input type="text" class="form-control" name="dept_id" required>
   </div>
  <div class="form-group col-md-6">
    <label for="mem_name">이름</label>
    <input type="text" class="form-control" name="mem_name" required>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_phone">전화번호</label>
    <input type="text" class="form-control" name="mem_phone" required>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_mail">메일</label>
    <input type="text" class="form-control" name="mem_mail" required>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_gender">성별</label>
    <input type="text" class="form-control" name="mem_gender" required>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_birth">생년월일</label>
    <input type="text" class="form-control" name="mem_birth" required>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_addr">주소</label>
    <input type="text" class="form-control" name="mem_addr" required>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_sal">연봉</label>
    <input type="text" class="form-control" name="mem_sal" required>
  </div>
 <div class="form-group col-md-6">
    <label for="mem_pwd">비밀번호</label>
    <input type="text" class="form-control" name="mem_pwd" required>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_con_start">고용일자</label>
    <input type="text" class="form-control" name="mem_con_start" required>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_con_end">계약 만료일(비정규직)</label>
    <input type="text" class="form-control" name="mem_con_end">
  </div>
  <div class="form-group col-md-6">
    <label for="mem_dcon_start">원청 계약 시작일</label>
    <input type="text" class="form-control" name="mem_dcon_start">
  </div>
  <div class="form-group col-md-6">
    <label for="mem_dcon_end">원청 계약 만료일</label>
    <input type="text" class="form-control" name="mem_dcon_end">
  </div>
  
 <div class="form-group col-md-6">
  <button type="submit" class="btn btn-primary">사용자 정보 추가</button>
  <button type="button" class="btn btn-primary back-user">돌아가기</button>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 </div>
</form>
</div>
<script src="/resources/js/back.js"></script>
<%@include file="../../includes/footer.jsp" %>