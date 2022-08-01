<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../views/includes/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                    	<h1 class="mt-4 breadcrumb mb-4 layout-center">게시글 수정</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">modify board</li>
                        </ol>

<div>
<form action="/user/board/modify" method="post" role="form">
  <div class="form-group">
  <label for="board_id">게시글 번호</label>
  <input type="text" name="board_id" class="form-control" value="${dto.board_id}" readonly/> 
  </div>
  <div class="form-group">
     <label for="mem_id">사용자ID</label>
  	<input type="text" name="mem_id" class="form-control" value="${dto.mem_id}" readonly/> 
  </div>
  <div class="form-group">
    <label for="board_title">제목</label>
  <input type="text" name="board_title" class="form-control" value="${dto.board_title}" /> 
   </div>
   <div class="form-group">
     <label for="board_content">내용</label>
  <input type="text" name="board_content" class="form-control" value="${dto.board_content}" /> 
 </div>
  
 <div class="form-groups">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   <button type="submit" data-oper='modify' class="btn btn-success">Modify</button>              			
   <button type="submit" data-oper='list' class="btn btn-danger">List</button> 
 </div>
</form>
<%@include file="../../../views/includes/footer.jsp" %>
</div>

<form action="" id="operForm">
	<input type="hidden" value="${dto.board_id}" name="board_id"/>
	<input type="hidden" value="${cri.pageNum}" name="pageNum"/>
	<input type="hidden" value="${cri.amount}" name="amount"/>
	<input type="hidden" value="${cri.type}" name="type"/>
	<input type="hidden" value="${cri.keyword}" name="keyword"/>
</form>
<script src="/resources/js/modify.js"></script>


