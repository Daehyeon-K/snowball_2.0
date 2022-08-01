<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/list.css" /> 
<%@include file="../../includes/header.jsp" %>

<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                    	<h1 class="mt-4 breadcrumb mb-4 layout-center">게시글 조회</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">list board</li>
                        </ol>
                        
                        
                        
<!-- 게시글 검색 부분 -->
 <div class="col-md-12">
       <div class="col-md-8">
       	<!--search Form-->
       	<form action="" method="get" id="searchForm">
       		<input type="hidden" name="pageNum" value="${cri.pageNum}" />
			<input type="hidden" name="amount" value="${cri.amount}" />            	
       		<select name="type" id="">
       			<option value=""  <c:out value="${cri.type == '' ? 'selected':'' }"/>>---------</option>
       			<option value="T" <c:out value="${cri.type == 'T' ? 'selected':'' }"/>>제목</option>
       			<option value="C" <c:out value="${cri.type == 'C' ? 'selected':'' }"/>>내용</option>
       			<option value="W" <c:out value="${cri.type == 'W' ? 'selected':'' }"/>>사용자ID</option>
       			<option value="TC" <c:out value="${cri.type == 'TC' ? 'selected':'' }"/>>제목 or 내용</option>
       			<option value="TW" <c:out value="${cri.type == 'TW' ? 'selected':'' }"/>>제목 or 사용자ID</option>
       			<option value="TCW" <c:out value="${cri.type == 'TCW' ? 'selected':'' }"/>>제목 or 내용 or 사용자ID</option>            		
       		</select>            
       		<input type="text" name="keyword" id=""  value="${cri.keyword}"/>
       		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
       		<button class="btn btn-default" type="submit">Search</button>	
       	</form>                
       </div>	
	

<table class="table">
  <thead>
    <tr>
       <th scope="col">게시물ID</th>
	   <th scope="col">사용자ID</th>
	   <th scope="col">게시물 제목</th>
	   <th scope="col">게시물 내용</th>
	   <th scope="col">게시물 작성시간</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="blist" items="${boardList}">
    <tr>
      <th scope="row">${blist.board_id}</th>
      <td>${blist.mem_id}</td>
       <td><a href="/user/board/readrow?board_id=${blist.board_id}">${blist.board_title}</a></td> 
      <td>${blist.board_content}</td>
      <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${blist.board_regdate}"/></td>
    </tr>
  </c:forEach> 
  </tbody>
</table>
<button type="button" class="btn btn-primary" onclick="location='/user/board/create'">글작성</button>


<!-- 페이지 나누기 하단 부분 -->
	<div class="text-center">
	  <ul class="pagination">
	     <c:if test="${pageDto.prev}">
	       <li class="paginate_button previous"><a href="${pageDto.startPage-1}">Previous</a></li>
	    </c:if>
	    
	    <!-- 숫자 부분은 루프가 돌아야 하기에 forEach 써주기 -->
	    <c:forEach var="idx" begin="${pageDto.startPage}" end="${pageDto.endPage}">
	         <li class="paginate_button ${pageDto.cri.pageNum == idx?'active':''}"><a href="${idx}">${idx}</a></li>
	    </c:forEach>
	    
	   <c:if test="${pageDto.next}">    
	            <li class="paginate_button next"><a href="${pageDto.endPage+1}">Next</a></li>
	    </c:if> 
	       
	  </ul>
	</div>
	
	<form action="" id="actionForm">
	   <!-- pageNum, amount, type, keyword 값을 부를 때 - 
	      1) pageDto => ${pageDto.cri.pageNum}  
	      2)cri => ${criteria.pageNum} : 얘는 ModelAttribute 가 사용 안된 경우, 이 때 클래스명 앞에 붙이는데 소문자로 붙여서 쓰기
	         ㄴ cri 지금 @ModelAttribute("cri")로 담아줬기 때문에 cri.pageNum 가능
	   -->
		<input type="hidden" name="pageNum" value="${cri.pageNum}" />
		<input type="hidden" name="amount" value="${cri.amount}" />
		<input type="hidden" name="type" value="${cri.type}" />
		<input type="hidden" name="keyword" value="${cri.keyword}" />
	</form>
	
	
<%@include file="../../includes/footer.jsp" %>
</div>
<script src="/resources/js/page.js"></script>