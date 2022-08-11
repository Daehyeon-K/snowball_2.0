<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@include file="../../../views/includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<div class="row menu-card-size">
               <div class="card mb-4">
                   <div class="card-header">
                       <i class="fas fa-chart-area me-1"></i>
                       게시글 작성
                   </div>
                   <div class="card-body">
                    <div style="letter-spacing:0; word-spacing:0; " >

					
					<form action="/user/board/create?${_csrf.parameterName}=${_csrf.token}" method="post" role="form" enctype="multipart/form-data">
					<div class="form-group">
						<label for="mem_id">사용자ID</label> <input type="text" name="mem_id"
							class="form-control"
							value='<sec:authentication property="principal.username"/>'
							readonly />
					</div>
					<div class="form-group">
						<label for="board_title">제목</label> <input type="text"
							name="board_title" class="form-control" required />
					</div>
					<div class="form-group">
						<label for="board_content">내용</label> <input type="text"
							name="board_content" class="form-control" required />
					</div>
					<br />
					<div class="uploadDiv">
						<input type="file" name="uploadFile" id="uploadFile" multiple />
					</div>

					<br>

					<div class="form-groups">
					<br /><br /><br /><br /><br /><br /><br /><br />
						<button type="button" class="btn btn-primary success">올리기</button>
						<button type="button" class="btn btn-primary"
							onclick="location='/user/board/list'">돌아가기</button>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</div>
					<div class="uploadResult" style="display:none">
   						<ul><!-- 첨부파일 정보 --></ul>
   					</div>
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
<script src="/resources/js/upload2.js"></script>
<script src="/resources/js/back.js"></script>
<%@include file="../../../views/includes/footer.jsp"%>
			