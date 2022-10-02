<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../../views/includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<div class="row menu-card-size">
               <div class="card mb-4">
                   <div class="card-header">
                       <i class="fas fa-chart-area me-1"></i>
                       결재 기안
                   </div>
                   <div class="card-body">
                    <div style="letter-spacing:0; word-spacing:0; " >
                   	<form action="approvalInsert?${_csrf.parameterName}=${_csrf.token}"
				method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="mem_id">사용자ID</label>
					<input type="text" name="mem_id" class="form-control"
						value='<sec:authentication property="principal.username"/>'
						readonly />
				</div>
				<div class="form-group">
					<label for="approval_type_id">결재종류</label>
					<div class="form-group md-4">
						<select name="approval_type_id" id="approval_type_id"
							class="form-control">
							<option value="BP">비품신청 ▼</option>
							<option value="HG">휴가신청</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="approval_inter_id">중간승인권자</label>
					<select name="approval_inter_id" id="approval_inter_id"
						class="form-control">
						<!-- 옵션을 select 이용해서 불러오기는 안될지 -->
						<c:forEach var="interMan" items="${interMan}">
							<option value="${interMan.mem_id}">${interMan.mem_name}
								${interMan.grade_name} ▼</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="approval_final_id">최종승인권자</label>
					<select name="approval_final_id" id="approval_final_id"
						class="form-control">
						<c:forEach var="fianlMan" items="${finalMan}">
							<option value="${fianlMan.mem_id}">${fianlMan.mem_name}
								${fianlMan.grade_name} ▼</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="approval_reject">결재반려사유</label> <input type="text"
						class="form-control" name="approval_reject">
				</div>
				<div class="form-group">
					<label for="approval_content">결재내용</label> <input type="text"
						class="form-control" name="approval_content">
				</div>
				<div class="uploadDiv">
					<input type="file" name="uploadFile" id="" multiple />
				</div>
				<div class="uploadResult" style="display: none">
					<ul>
						<!-- 첨부파일 정보 -->
					</ul>
				</div>
				<br /><br /><br /><br />
				<button type="button" id="uploadBtn" class="btn btn-primary file-form" style="margin-right:5px;">신청하기</button>
				<button type="button" class="btn btn-primary back-user">돌아가기</button>
			</form>
									   </div>  
									</div>
                                </div>
                        </div>
                        </div>
			</main>
			<script>
				let csrfHeaderName = "${_csrf.headerName}";
				let csrfTokenValue = "${_csrf.token}";
			</script>
			<script src="/resources/js/upload.js"></script>
			<script src="/resources/js/back.js"></script>
<%@include file="../../../views/includes/footer.jsp"%>
			