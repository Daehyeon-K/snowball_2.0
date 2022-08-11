<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../../../views/includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<div class="menu-name">
				<span >게시글 보기</span>
			</div>
			<ol class="breadcrumb mb-4" style="padding-left: 10px;">
				<li class="breadcrumb-item active">Board Read</li>
			</ol>
			
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			
			
			<div>
				<form action="" method="post" role="form">
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
							value="${dto.board_title}" readonly />
					</div>
					<div class="form-group">
						<label for="board_content">내용</label> <input type="text"
							name="board_content" class="form-control"
							value="${dto.board_content}" readonly />
					</div>

					<div class="form-groups">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<%-- 파일 첨부 영역 --%>
						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default">
									<div class="panel-heading">
										<i class="fa fas fa-file"></i>파일첨부
									</div>
									<div class="uploadResult">
										<ul>
											<!-- 첨부파일 정보 -->
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="bigPictureWrapper1">
							<div class="bigPicture1"></div>
						</div>

						<!-- 리스트 버튼은 누구나 다 보여져야하니까 권한 걸지 않기 -->
						<button type="button" class="btn btn-info">리스트</button>
						<br /><br />
						<!-- 수정 및 삭제버튼은 자기 자신을 제외한 다른 사람 게시물을 수정/삭제 불가해야하므로 권한 조건 걸어주기 -->
						<sec:authentication property="principal" var="info" />
						<sec:authorize access="isAuthenticated()">
							<c:if test="${info.username == dto.mem_id}">
								<button type="button" class="btn btn-primary success" id="ModBtn">수정</button>
								<button type="button" class="btn btn-primary danger" id="RemoveBtn">삭제</button>
							</c:if>
						</sec:authorize>


					</div>
				</form>
			</div>

			<%-- 댓글 리스트 영역 --%>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i> Reply

							<sec:authorize access="isAuthenticated()">
								<button type="button" id="addReplyBtn"
									class="btn btn-primary btn-xs pull-right">New Reply</button>
							</sec:authorize>
						</div>

						<div class="panel-body">
							<ul class="chat">
								<li class="left clearfix" data-reply_id="12">
									<div>
										<div class="header">
											<strong class="primary-font">user00</strong> <small
												class="pull-right text-muted">2022-05-04 15:54</small>
										</div>
										<!-- 댓글 내용 -->
										<p>Snow</p>
									</div>
								</li>
							</ul>
						</div>
						<div class="panel-footer"></div>
					</div>

				</div>

				<%-- 댓글 작성 모달 폼 --%>
				<div class="modal" tabindex="-1" id="replyModal" data-rno="1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title">Reply</h5>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label for="">내용</label> <input type="text"
										name="reply_content" id="" class="form-control"
										placeholder="댓글 내용" />
								</div>
								<div class="form-group">
									<label for="">작성자</label> <input type="text"
										class="form-control" name="mem_name"
										value='<sec:authentication property="principal.user.mem_name"/>'
										readonly />
								</div>
								<div class="form-group">
									<label for="">작성일</label> <input type="text"
										name="reply_regdate" id="" class="form-control"
										placeholder="작성일" />
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-warning"
									id="modalRegisterBtn">등록</button>
								<button type="button" class="btn btn-primary" id="modalModBtn">수정</button>
								<button type="button" class="btn btn-primary" id="modalRemoveBtn">삭제</button>
								<button type="button" class="btn btn-primary" id="modalCloseBtn"
									data-bs-dismiss="modal">종료</button>
							</div>
						</div>
					</div>

				</div>

				<%-- modify / list 버튼 클릭시 이동할 폼 --%>
				<form action="" id="operForm">
					<input type="hidden" value="${dto.board_id}" name="board_id" /> <input
						type="hidden" value="${cri.pageNum}" name="pageNum" /> <input
						type="hidden" value="${cri.amount}" name="amount" /> <input
						type="hidden" value="${cri.type}" name="type" /> <input
						type="hidden" value="${cri.keyword}" name="keyword" /> <input
						type="hidden"
						value='<sec:authentication property="principal.username"/>'
						name="mem_name" />
				</form>
<script>
   let board_id = '${dto.board_id}';
   
   <sec:authorize access="isAuthenticated()">
/*     mem_name = '<sec:authentication property="principal.user.mem_name"/>';  */
       mem_name = '<sec:authentication property="principal.username"/>';
   </sec:authorize>  
   
   let csrfHeaderName = "${_csrf.headerName}";
   let csrfTokenValue = "${_csrf.token}";
</script>

</main>
<script src="/resources/js/read_row.js"></script>
<script src="/resources/js/reply.js"></script>
<script src="/resources/js/read2.js"></script>
<script src="/resources/js/upload2.js"></script>
<%@include file="../../../views/includes/footer.jsp" %>
			