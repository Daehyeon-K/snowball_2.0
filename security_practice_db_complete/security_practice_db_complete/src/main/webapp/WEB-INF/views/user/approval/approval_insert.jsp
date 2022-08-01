<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../../../views/includes/header.jsp" %>

<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                       <h1 class="mt-4 breadcrumb mb-4 layout-center">
                     <input type="text" name="mem_id" value='결재 기안' class="login-name" readonly/>   
                  </h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Approval Insert</li>
                        </ol>

<form action="approvalInsert?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="mem_id">사용자ID</label>
   <%--  <input type="text" class="form-control" name="mem_id" value="${login.mem_id}" readonly> --%>
   <input type="text" name="mem_id" class="form-control" value='<sec:authentication property="principal.username"/>' readonly/>
  </div>
  <div class="form-group">
   <label for="approval_type_id">결재종류</label>
   <div class="form-group md-4">
      <select name="approval_type_id" id="approval_type_id" class="form-control">
         <option value="BP">비품신청</option>
         <option value="HG">휴가신청</option>
      </select>
   </div>
  </div>
 <!--  <div class="form-group">
    <label for="approval_commit_id">결재승인</label>
    <input type="text" class="form-control" name="approval_commit_id" value="" >
  </div> -->
  <div class="form-group">
    <label for="approval_inter_id">중간승인권자</label>
    <!-- <input type="text" class="form-control" name="approval_inter_id" value="" readonly> -->
    <select name="approval_inter_id" id="approval_inter_id" class="form-control"> <!-- 옵션을 select 이용해서 불러오기는 안될지 -->
       <c:forEach var="interMan" items="${interMan}">
         <option value="${interMan.mem_id}">${interMan.mem_name} ${interMan.grade_name}</option>
      </c:forEach>
      <!-- 
      <option value="20220001">최지수 과장</option>
      <option value="20221003">김과장 과장</option>
      <option value="20220003">이결순 부장</option>
      <option value="20220008">곽도원 부장</option>
       -->
   </select>
  </div>
  <div class="form-group">
    <label for="approval_final_id">최종승인권자</label>
    <!-- <input type="text" class="form-control" name="approval_final_id" value="" readonly> -->
    <select name="approval_final_id" id="approval_final_id" class="form-control">
       <c:forEach var="fianlMan" items="${finalMan}">
         <option value="${fianlMan.mem_id}">${fianlMan.mem_name} ${fianlMan.grade_name}</option>
      </c:forEach>
      <!-- 
      <option value="20220007">정우성 사장</option>
      -->
   </select>
  </div>
  <div class="form-group">
    <label for="approval_reject">결재반려사유</label>
    <input type="text" class="form-control" name="approval_reject">
  </div>
  <div class="form-group">
    <label for="approval_content">결재내용</label>
    <input type="text" class="form-control" name="approval_content">
  </div>
  <div class="uploadDiv">
         <input type="file" name="uploadFile" id="" multiple />
   </div>
  <button id="uploadBtn" class="btn btn-primary">신청하기</button>
  <button type="button" class="btn btn-primary back-user">돌아가기</button>
</form>
</body>
<script>
   let csrfHeaderName = "${_csrf.headerName}";
   let csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/js/upload.js"></script>
<script src="/resources/js/back.js"></script>
</html>
<%@include file="../../../views/includes/footer.jsp" %>