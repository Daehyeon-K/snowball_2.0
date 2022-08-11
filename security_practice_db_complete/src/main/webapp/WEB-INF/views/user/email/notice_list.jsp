<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../../views/includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<div class="menu-name">
				<span >공지 게시판</span>
			</div>
			<ol class="breadcrumb mb-4" style="padding-left: 10px;">
				<li class="breadcrumb-item active">Email List</li>
			</ol>
			
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			
			<!--search Form-->
			<form action="" method="get" id="searchForm"
				style="text-align: right">
				<input type="hidden" name="pageNum" value="${cri.pageNum}" /> <input
					type="hidden" name="amount" value="${cri.amount}" /> 
					<select name="type" id="" class="select-height">
					<option value="W"<c:out value="${cri.type == 'W' ? 'selected':'' }"/>>공지내용</option>
					<option value="T"<c:out value="${cri.type == 'T' ? 'selected':'' }"/>>공지제목</option>
				</select> 
				<input type="text" name="keyword" id="" value="${cri.keyword}" />
				<button class="btn btn-default" type="submit" style="padding-top: 0px;padding-bottom: 0px;height:28px;">Search</button>
			</form>
			</br>
			<!-- /.col-lg-12 -->
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: rgba(0, 128, 255, 0.08);">
							공지 이메일
						</div>
						<div class="panel-body">

							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>공지 제목</th>
										<th>공지 내용</th>
										<th>전송 일시</th>
									</tr>
								</thead>
								<tbody>
									<!-- 게시판 리스트 반복문 -->
									<c:forEach var="maildto" items="${notice_list}">
										<tr>
											<td><a href="${maildto.mail_id}" class="noticeRead">${maildto.mail_title}</a>
											</td>
											<td>${maildto.mail_content}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${maildto.mail_send_date}" /></td>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 페이지 나누기 하단 부분 -->
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${pageDto.prev}">
					<li class="paginate_button previous"><a
						href="${pageDto.startPage-1}">Previous</a></li>
				</c:if>

				<!-- 숫자 부분은 루프가 돌아야 하기에 forEach 써주기 -->
				<c:forEach var="idx" begin="${pageDto.startPage}" end="${pageDto.endPage}">
					<li	class="paginate_button ${pageDto.cri.pageNum == idx?'active':''}">
					  <a href="${idx}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageDto.next}">
					<li class="paginate_button next"><a
						href="${pageDto.endPage+1}">Next</a></li>
				</c:if>

			</ul>
		</div>
		<form action="" id="actionForm">
			<!-- pageNum, amount, type, keyword 값을 부를 때 - 
	      1) pageDto => ${pageDto.cri.pageNum}  
	      2)cri => ${criteria.pageNum} : 얘는 ModelAttribute 가 사용 안된 경우, 이 때 클래스명 앞에 붙이는데 소문자로 붙여서 쓰기
	         ㄴ cri 지금 @ModelAttribute("cri")로 담아줬기 때문에 cri.pageNum 가능
	   -->
			<input type="hidden" name="pageNum" value="${cri.pageNum}" /> <input
				type="hidden" name="amount" value="${cri.amount}" /> <input
				type="hidden" name="type" value="${cri.type}" /> <input
				type="hidden" name="keyword" value="${cri.keyword}" />
		</form>
		
</main>
<script src="/resources/js/list.js"></script>
<script src="/resources/js/back.js"></script>
<%@include file="../../../views/includes/footer.jsp" %>
			