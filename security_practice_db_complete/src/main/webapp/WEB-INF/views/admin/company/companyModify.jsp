<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@include file="../../includes/header.jsp" %>

<div id="layoutSidenav_content">
<main>
<div class="container-fluid px-4">

 <div class="row">
<div class="col-lg-12">
    <h1 class="page-header">원청 수정</h1>
</div>
<!-- /.col-lg-12 -->
</div>            
 <div class="row">
     <div class="col-lg-12">
        <div class="panel panel-default">
             <div class="panel-heading">
             </div>
             <div class="panel-body">
              <form action="/admin/company/companyUpdate" method="post" id="modifyForm" role="form">
                 <div class="form-group">
                    <label>파견 원청 번호</label>
                    <input class="form-control" name="company_id" readonly="readonly" value="${compDto.company_id}">                            
                 </div> 
                 <div class="form-group">
                    <label>파견 원청 이름</label>
                    <input class="form-control" name="company_name" value="${compDto.company_name }">                            
                 </div>  
                 <div class="form-group">
                    <label>파견 원청 연락처</label>
                    <input class="form-control" name="company_phone" value="${compDto.company_phone}">                           
                 </div> 
                 <div class="form-group">
                    <label>파견 원청 주소</label>
                    <input class="form-control" name="company_addr" readonly="readonly" value="${compDto.company_addr}">                            
                 </div>  

                 <div class="form-group">
                    <label>담당자명</label>
                    <input class="form-control" name="company_man" value="${compDto.company_man}">                            
                 </div>

                 <div class="form-group">
                    <label>계약 시작 일시</label>
                    <input type = "date" class="form-control" name="company_partner_start" readonly="readonly" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${compDto.company_partner_start}"/>"/>                            
                 </div>
                 <div class="form-group">
                    <label>계약 종료 일시</label>
                    <input type = "date" class="form-control" name="company_partner_end" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${compDto.company_partner_end}"/>"/>                            
                 </div>              
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />                                          
                 <button type="submit" data-oper='list' class="Modify btn btn-primary">수정완료</button>
              </form>
           </div>
        </div>
     </div>
     <%@include file="../../includes/footer.jsp" %>
 </div>

<!-- <script src="/resources/js/company_modify_js"></script> -->
