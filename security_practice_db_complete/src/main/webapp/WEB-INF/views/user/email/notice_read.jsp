<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@include file="../../includes/header.jsp" %>

<div id="layoutSidenav_content">
<main>
<div class="container-fluid px-4 pt-4">

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">공지 사항</h1>
    </div>
</div>            
<div class="row">
    <div class="col-lg-12">
       <div class="panel panel-default">
            <div class="panel-heading">
               공지 사항 열람
            </div>
            <div class="panel-body">
             <form action="" method="get" role="form">
                <div class="form-group">
                   <label>공지 번호</label>
                   <input class="form-control" name="mail_id" value="${noticeRead.mail_id}" readonly="readonly">                            
                </div> 
                
                <div class="form-group">
                   <label>발신자 명</label>
                   <input class="form-control" name="mail_name" value="${noticeRead.mail_name}" readonly="readonly">                            
                </div> 

                <div class="form-group">
                   <label>제목</label>
                   <!-- ${dto.content}<> -->
                   <input class="form-control" name="mail_title" value="${noticeRead.mail_title}" readonly="readonly">                 
                </div> 
                <div class="form-group">
                   <label>내용</label>
                   <input class="form-control" name="mail_content" value="${noticeRead.mail_content}" readonly="readonly">                            
                </div>  

                <div class="form-group">
                   <label>수신일</label>
                   <input type = "date" class="form-control" name="mail_send_date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${noticeRead.mail_send_date}"/>" readonly="readonly">                            
                </div>  
                
                <button type="button" class="btn btn-info">목록보기</button>                
                </form>
             </div> 
</div>
</div>
</div>
<script src="/resources/js/notice_read.js"></script>
</div>
</main>
<%@include file="../../includes/footer.jsp" %>
</div>