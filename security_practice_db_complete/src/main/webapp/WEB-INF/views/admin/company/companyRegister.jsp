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
                       원청 등록
                   </div>
                   <div class="card-body">
                    <div style="letter-spacing:0; word-spacing:0; " >

					
					<form  method="post" class="form-signin">
         <div class="form-group">
         <label>파견 원청 번호</label>
         <input name="company_id" class="form-control" required>
         </div>
         
         
         
         <div class="form-group">
         <label >파견 원청명</label>
         <input name="company_name" class="form-control" required>
         </div>
         
         
         <div class="form-group">
         <label >연락처</label>
         <input name="company_phone" class="form-control" required>
         </div>
         
         <div class="form-group">
         <label >파견지 주소</label>
         <input name="company_addr" class="form-control" required>
         </div>
         
         <div class="form-group">
            <label >파견 담당자</label>
            <input name="company_man" class="form-control" required>
         </div>
         
         <div class="form-group">
            <label >계약 시작 일시</label>
            <input name="company_partner_start" class="form-control" required>
         </div>
         
         <div class="form-group">
            <label >계약 종료 일시</label>
            <input name="company_partner_end" class="form-control" required>
         </div>
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
         <button type="submit" class="btn btn-primary">원청 등록</button>
         <!-- <button class="btn btn-lg btn-primary btn-block" type="submit">원청 등록</button> -->
        <!--  <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="location='/admin/company/companyList'">돌아가기</button> -->
	      </form>
					
					

</div>
</div>
</div>
</div>
</main>
<%@include file="../../../views/includes/footer.jsp"%>
			