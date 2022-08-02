<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
<form:form method="post" modelAttribute="user">
   <div class="form-group col-md-6">
     <label for="mem_id">아이디</label>
     <form:input path="mem_id" type="text" class="form-control" name="mem_id" placeholder="Enter ID" required="required"/>
     <small><form:errors path="mem_id" style="color: red"/></small>
   </div>
   <div class="form-group col-md-6">
     <label for="grade_id">직급</label>
     <form:input path="grade_id" type="text" class="form-control" name="grade_id" required="required"/>
     <small><form:errors path="grade_id" style="color: red"/></small>
   </div>
   <div class="form-group col-md-6">
     <label for="company_id">원청</label>
     <form:input path="company_id" type="text" class="form-control" name="company_id" placeholder="Enter Company ID"/>
     <small><form:errors path="company_id" style="color: red"/></small>
   </div>
   <div class="form-group col-md-6">
     <label for="dept_id">부서</label>
     <form:input path="dept_id" type="text" class="form-control" name="dept_id"/>
     <small><form:errors path="dept_id" style="color: red"/></small>
   </div>
  <div class="form-group col-md-6">
    <label for="mem_name">이름</label>
    <form:input path="mem_name" type="text" class="form-control" name="mem_name" placeholder="Enter Name" required="required"/>
    <small><form:errors path="mem_name" style="color: red"/></small>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_phone">전화번호</label>
    <form:input path="mem_phone" type="text" class="form-control" name="mem_phone" placeholder="Enter Phone (w/ dash)" required="required"/>
    <small><form:errors path="mem_phone" style="color: red"/></small>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_mail">메일</label>
    <form:input path="mem_mail" type="text" class="form-control" name="mem_mail" placeholder="Enter Mail" required="required"/>
    <small><form:errors path="mem_mail" style="color: red"/></small>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_gender">성별</label>
    <form:input path="mem_gender" type="text" class="form-control" name="mem_gender" required="required"/>
    <small><form:errors path="mem_gender" style="color: red"/></small>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_birth">생년월일</label>
    <form:input path="mem_birth" type="text" class="form-control" name="mem_birth" placeholder="Enter Birthday (YYYY-MM-DD)" required="required"/>
    <small><form:errors path="mem_birth" style="color: red"/></small>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_addr">주소</label>
    <form:input path="mem_addr" type="text" class="form-control" name="mem_addr" placeholder="Enter Address" required="required"/>
    <small><form:errors path="mem_addr" style="color: red"/></small>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_sal">연봉</label>
    <form:input path="mem_sal" type="text" class="form-control" name="mem_sal" placeholder="Enter Salary" required="required"/>
    <small><form:errors path="mem_sal" style="color: red"/></small>
  </div>
 <div class="form-group col-md-6">
    <label for="mem_pwd">비밀번호</label>
    <form:input path="mem_pwd" type="text" class="form-control" name="mem_pwd" placeholder="Enter Password" required="required"/>
    <small><form:errors path="mem_pwd" style="color: red"/></small>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_con_start">고용일자</label>
    <form:input path="mem_con_start" type="text" class="form-control" name="mem_con_start" placeholder="Enter Start Date of Contraction (YYYY-MM-DD)"/>
    <small><form:errors path="mem_con_start" style="color: red"/></small>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_con_end">계약 만료일(비정규직)</label>
    <form:input path="mem_con_end" type="text" class="form-control" name="mem_con_end" placeholder="Enter End Date of Contraction (YYYY-MM-DD)"/>
    <small><form:errors path="mem_con_end" style="color: red"/></small>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_dcon_start">원청 계약 시작일</label>
    <form:input path="mem_dcon_start" type="text" class="form-control" name="mem_dcon_start" placeholder="Enter Start Date of Dispatch Contraction (YYYY-MM-DD)"/>
    <small><form:errors path="mem_dcon_start" style="color: red"/></small>
  </div>
  <div class="form-group col-md-6">
    <label for="mem_dcon_end">원청 계약 만료일</label>
    <form:input path="mem_dcon_end" type="text" class="form-control" name="mem_dcon_end" placeholder="Enter End Date of Dispatch Contraction (YYYY-MM-DD)"/>
    <small><form:errors path="mem_dcon_end" style="color: red"/></small>
  </div>
  
 <div class="form-group col-md-6">
  <button type="submit" class="btn btn-primary">사용자 정보 추가</button>
  <button type="button" class="btn btn-primary back-user">돌아가기</button>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 </div>
</form:form>
</div>
<script src="/resources/js/back.js"></script>
<%@include file="../../includes/footer.jsp" %>