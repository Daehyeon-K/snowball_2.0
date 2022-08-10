<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../../views/includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4 breadcrumb mb-4 layout-center">게시글 작성</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">register board</li>
			</ol>

			<div>
				<form
					action="/user/board/create?${_csrf.parameterName}=${_csrf.token}"
					method="post" role="form" enctype="multipart/form-data">
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

					<div class="uploadDiv">
						<input type="file" name="uploadFile" id="uploadFile" multiple />
					</div>

					<br>

					<div class="form-groups">
						<button type="submit" class="btn btn-primary">올리기</button>
						<button type="button" class="btn btn-primary"
							onclick="location='/user/board/list'">돌아가기</button>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</div>
					<div class="uploadResult" style="display:none">
   						<ul><!-- 첨부파일 정보 --></ul>
   					</div>
				</form>
				<script>
					let csrfHeaderName = "${_csrf.headerName}";
					let csrfTokenValue = "${_csrf.token}";
				</script>
				<%@include file="../../../views/includes/footer.jsp"%>
			</div>
			<script src="/resources/js/back.js"></script>		
			<script src="/resources/js/upload2.js"></script>