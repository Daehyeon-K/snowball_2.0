<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../includes/header.jsp" %>
<div id="layoutSidenav_content">
<main>
 <div class="container-fluid px-4">
   <h1>사용자 정보</h1>
          
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" role="form" method="post" id="formSubmit">
                				<div class="form-group">
                					<div class="form-group">
                					<label>사원번호</label>
                					<input class="form-control" name="mem_id" readonly="readonly" value="${dto.mem_id}">                				
                				</div> 
                				<div class="form-group">
                					<label>직책번호</label>
                					<input class="form-control" name="grade_id" readonly="readonly" value="${dto.grade_id}">                				
                				</div>  
                				<div class="form-group">
                					<label>원청번호</label>
                					<input class="form-control" name="company_id" readonly="readonly" value="${dto.company_id}">             				
                				</div> 
                				<div class="form-group">
                					<label>부서번호</label>
                					<input class="form-control" name="dept_id" readonly="readonly" value="${dto.dept_id}">                				
                				</div>
                					<div class="form-group">
                					<label>이름</label>
                					<input class="form-control" name="mem_name" readonly="readonly" value="${dto.mem_name}">                				
                				</div>  
                				<div class="form-group">
                					<label>전화번호</label>
                					<input class="form-control" name="mem_phone" readonly="readonly" value="${dto.mem_phone}">                				
                				</div>   
                				<div class="form-group">
                					<label>메일</label>
                					<input class="form-control" name="mem_mail" readonly="readonly" value="${dto.mem_mail}">                				
                				</div>
                				<div class="form-group">
                					<label>성별</label>
                					<input class="form-control" name="mem_gender" readonly="readonly" value="${dto.mem_gender}">                				
                				</div> 
                				<div class="form-group">
                					<label>생년월일</label>
                					<input class="form-control" name="mem_birth" readonly="readonly" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${dto.mem_birth}"/>">                				
                				</div> 
                				<div class="form-group">
                					<label>주소</label>
                					<input class="form-control" name="mem_addr" readonly="readonly" value="${dto.mem_addr}">                				
                				</div> 
                				<div class="form-group">
                					<label>연봉</label>
                					<input class="form-control" name="mem_sal" readonly="readonly" value="${dto.mem_sal}">                				
                				</div> 
                				<div class="form-group">
                					<label>비밀번호</label>
                					<input class="form-control" name="mem_pwd" readonly="readonly" value="${dto.mem_pwd}">                				
                				</div>
                				<div class="form-group">
                					<label>계약일</label>
                					<input class="form-control" name="mem_con_start" readonly="readonly" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${dto.mem_con_start}"/>">                				
                				</div> 
                				<div class="form-group">
                					<label>계약만료일</label>
                					<input class="form-control" name="mem_con_end" readonly="readonly" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${dto.mem_con_end}"/>">                				
                				</div> 
                				<div class="form-group">
                					<label>파트너사계약일</label>
                					<input class="form-control" name="mem_dcon_start" readonly="readonly" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${dto.mem_dcon_start}"/>">                				
                				</div> 
                				<div class="form-group">
                					<label>파트너사계약만료일</label>
                					<input class="form-control" name="mem_dcon_end" readonly="readonly" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${dto.mem_dcon_end}"/>">                				
                				</div> 
                					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                					<button type="button" class="btn btn-default">수정</button>     			
                	         		<button type="reset" class="btn btn-info">리스트</button>    
                	         		<button type="button" class="btn btn-danger">삭제</button>     			
                			</form>
                		</div>
                	</div>
                </div>
            </div>  

<%-- modify / list 버튼 클릭시 이동할 폼 --%>            
<form action="/admin/mem/memModify" id="operForm">
	<input type="hidden" value="${dto.mem_id}" name="mem_id"/>
	<input type="hidden" value="${cri.pageNum}" name="pageNum"/>
	<input type="hidden" value="${cri.amount}" name="amount"/>
	<input type="hidden" value="${cri.type}" name="type"/>
	<input type="hidden" value="${cri.keyword}" name="keyword"/>
</form>    
<script>
	//현재 글 번호
	let mem_id = ${dto.mem_id};
</script>        
<script src="/resources/js/mem_read.js"></script>          

<%@include file="../../includes/footer.jsp" %>










  