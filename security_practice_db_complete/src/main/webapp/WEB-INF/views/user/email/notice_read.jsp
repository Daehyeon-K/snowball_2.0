<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../../views/includes/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<div class="row menu-card-size">
               <div class="card mb-4">
                   <div class="card-header">
                       <i class="fas fa-chart-area me-1"></i>
                       공지사항
                   </div>
                   <div class="card-body">
                    <div style="letter-spacing:0; word-spacing:0; " >
                    
                    
					
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
                
                <button type="button" class="btn btn-primary">목록보기</button>                
                </form>             
                    
                    
</div>  
</div>
</div>
</div>
</div>
</main>
<script src="/resources/js/notice_read.js"></script>
<%@include file="../../../views/includes/footer.jsp"%>
			