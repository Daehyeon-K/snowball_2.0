<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@include file="../../../views/includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<div class="row menu-card-size">
               <div class="card mb-4">
                   <div class="card-header">
                       <i class="fas fa-chart-area me-1"></i>
                       원청 보기
                   </div>
                   <div class="card-body">
                    <div style="letter-spacing:0; word-spacing:0; " >

					
				<form action="" method="get" role="form" >
                <div class="form-group">
                   <label>파견 원청 번호</label>
                   <input class="form-control" name="company_id" value="${compDto.company_id}" readonly="readonly">                            
                </div> 
                <div class="form-group">
                   <label>파견 원청 이름</label>
                   <input class="form-control" name="company_name" value="${compDto.company_name}" readonly="readonly">                            
                </div>  
                <div class="form-group">
                   <label>파견 원청 연락처</label>
                   <!-- ${dto.content}<> -->
                   <input class="form-control" name="company_phone" value="${compDto.company_phone}" readonly="readonly">                 
                </div> 
                <div class="form-group">
                   <label>파견 원청 주소</label>
                   <input class="form-control" name="company_addr" value="${compDto.company_addr}" readonly="readonly">                            
                </div>  
                <div class="form-group">
                   <label>담당자명</label>
                   <input class="form-control" name="company_man" value="${compDto.company_man}" readonly="readonly">                            
                </div>  
                <div class="form-group">
                   <label>계약 시작 일시</label>
                   
<%--                    <input class="form-control" name="company_partner_start" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${compDto.company_partner_start}"/>" readonly="readonly">                             --%>
                   <input type = "date" class="form-control" name="company_partner_start" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${compDto.company_partner_start}"/>" readonly="readonly">                            
                </div>  
                <div class="form-group">
                   <label>계약 종료 일시</label>
                   <%-- <input class="form-control" name="company_partner_end" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${compDto.company_partner_end}"/>" readonly="readonly"> --%>                            
                   <input type = "date" class="form-control" name="company_partner_end" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${compDto.company_partner_end}"/>" readonly="readonly">                            
                </div>  
                <button type="button" class="btn btn-info">목록보기</button>                   
                <button type="button" class="btn btn-primary">수정하기</button>                   
                <button type="button" class="btn btn-danger">삭제하기</button>                   
                </form>				
					
					
				 <!-- 수정버튼 클릭시 보낼 폼 -->
		         <form action="" id="operForm">
		            <input type="hidden" value="${compDto.company_id}" name="company_id" />
		         </form>	

</div>  
</div>
</div>
</div>
</div>
</main>

<script src="/resources/js/company_read.js"></script>

<%@include file="../../../views/includes/footer.jsp"%>
			