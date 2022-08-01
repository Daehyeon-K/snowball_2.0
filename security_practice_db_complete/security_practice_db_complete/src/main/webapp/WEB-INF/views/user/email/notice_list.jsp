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
    <h1 class="page-header">공지 게시판</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
     <div class="panel-heading">
        <!-- <button id="regBtn" type="button" class="btn-pr-4 mb-2">
          공지메일 작성
        </button> -->
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
	             <td>
	             <a href="${maildto.mail_id}" class="noticeRead">${maildto.mail_title}</a>
	             </td>
                 <td>${maildto.mail_content}</td>
             <td><fmt:formatDate pattern="yyyy-MM-dd" value="${maildto.mail_send_date}"/></td>
           </c:forEach>
        </tbody>
    </table>

</div>
</div>
</div>
</div>
</div>
</main>
<form action="" id="NoticeReadForm" >
		
</form>
<script src="/resources/js/notice_list.js"></script>
<%@include file="../../includes/footer.jsp" %>
    <%-- 페이지 링크를 처리할 폼 --%>
</div>
