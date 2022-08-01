<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@include file="../../includes/header.jsp" %>

<div id="layoutSidenav_content">
<main>
<div class="container-fluid px-4">

<div class="row">
  <div>
    <h1 class="page-header">원청 리스트</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        <button id="regBtn" type="button" class="btn-primary">
          등록하기
        </button>
      </div>
      <!-- /.panel-heading -->
    <div class="panel-body">
      <table class="table table-striped table-bordered table-hover">
        <thead>
          <tr>
            <th>파견 원청 번호</th>
            <th>파견 원청 이름</th>
            <th>파견 원청 주소</th>
            <th>파견 원청 연락처</th>
            <th>담당자명</th>
            <th>계약 시작 일시</th>
            <th>계약 종료 일시</th>
          </tr>
        </thead>
        <tbody>
           <!-- 게시판 리스트 반복문 -->
          <c:forEach var="dto" items="${company_list}">
              <tr>
                 <td><a href="/admin/company/companyRead?company_id=${dto.company_id}">${dto.company_id}</a></td>
                 <td>${dto.company_name}</td>
                 <td>${dto.company_phone}</td>
                 <td>${dto.company_addr}</td>
                 <td>${dto.company_man}</td>
                 <td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.company_partner_start}"/></td>
                 <td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.company_partner_end}"/></td>
              </tr>
           </c:forEach>
        </tbody>
    </table>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<%@include file="../../includes/footer.jsp" %>
</div>

<script src="/resources/js/list.js"></script>  
<script src="/resources/js/company_list.js"></script>



\