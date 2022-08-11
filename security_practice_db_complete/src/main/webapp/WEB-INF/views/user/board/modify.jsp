<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../../views/includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<div class="row menu-card-size">
               <div class="card mb-4">
                   <div class="card-header">
                       <i class="fas fa-chart-area me-1"></i>
                       게시글 수정
                   </div>
                   <div class="card-body">
                    <div style="letter-spacing:0; word-spacing:0; " >
                    
                    
					<div>
				<form action="/user/board/modify" method="post" role="form">
					<div class="form-group">
						<label for="board_id">게시글 번호</label> <input type="text"
							name="board_id" class="form-control" value="${dto.board_id}"
							readonly />
					</div>
					<div class="form-group">
						<label for="mem_id">사용자ID</label> <input type="text" name="mem_id"
							class="form-control" value="${dto.mem_id}" readonly />
					</div>
					<div class="form-group">
						<label for="board_title">제목</label> <input type="text"
							name="board_title" class="form-control"
							value="${dto.board_title}" />
					</div>
					<div class="form-group">
						<label for="board_content">내용</label> <input type="text"
							name="board_content" class="form-control"
							value="${dto.board_content}" />
					</div>
					<div class="form-groups">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<div class="form-groups">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<button type="submit" data-oper='modify' class="btn btn-primary">수정</button>
							<button type="submit" data-oper='list' class="btn btn-primary">리스트</button>
						</div>
				</form>
			</div>
			<form action="" id="operForm">
				<input type="hidden" value="${dto.board_id}" name="board_id" /> <input
					type="hidden" value="${cri.pageNum}" name="pageNum" /> <input
					type="hidden" value="${cri.amount}" name="amount" /> <input
					type="hidden" value="${cri.type}" name="type" /> <input
					type="hidden" value="${cri.keyword}" name="keyword" />
			</form>
                    
                    
</div>  
</div>
</div>
</div>
</div>
</main>
			<script src="/resources/js/modify.js"></script>                    
<%@include file="../../../views/includes/footer.jsp"%>
			