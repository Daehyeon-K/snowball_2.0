<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>

<%@include file="../../../../views/includes/header.jsp" %>

<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                    	<h1 class="mt-4 breadcrumb mb-4 layout-center">
							<input type="text" name="mem_id" value='인사 - 근태 정보' class="login-name" readonly/>   
						</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">HR - Attendance Info</li>
                        </ol>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <!-- /.panel-heading -->
      <div class="panel-body">
        <table class="table table-striped table-bordered table-hover">
          <thead>
           <div class="row">
          <!-- start search -->
          <div class="col-md-12">
            <div class="col-md-8">
            <!--search Form-->
            	<form action="" method="get" id="searchForm">
            	<input type="hidden" name="pageNum" value="${cri.pageNum}" id = ""/>
				<input type="hidden" name="amount" value="${cri.amount}" />
            		<select name="type" id="">
	            		<option value="T" <c:out value="${cri.type == 'T' ? 'selected':'' }"/>>근태ID</option>
	            		<option value="C" <c:out value="${cri.type == 'C' ? 'selected':'' }"/>>사용자ID</option>
         	    	</select>
         	    	<input type="text" name="keyword" id="" value="${cri.keyword}"/>
         	    	<button class="btn btn-default" type="submit">Search</button>
            	</form>
            </div>
          <div class="row">
          <!-- start search -->
          <div class="col-md-12">
          <tr>
	      <th scope="col">근태ID</th>
	      <th scope="col">사용자ID</th>
	      <th scope="col">남은 휴가일수</th>
	      <th scope="col">결근 일수</th>
	      <th scope="col">지각 일수</th>
	      <th scope="col">근무 태도</th>
  		 </tr>
          </thead>
		<tbody>
		<c:forEach var="list" items="${hrlist}">
		<form action="" method="post" role="form" id="listForm" >
		    <tr>
		      <td>${list.att_id}</td>
		      <td>${list.mem_id}</td>
		      <td>${list.att_vac}</td>
		      <td>${list.att_nos}</td>
		      <td>${list.att_late}</td>
		      <td><button type="button" class="btn btn-primary" >근무태도</button></td>
			 </tr>
			 <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}"/>
			</form>
		  </c:forEach> 
		  </tbody>
        </table>
       <button type="button" class="btn btn-primary back-user">돌아가기</button>
       </div>
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
</body>
<script src="/resources/js/hrbutton.js?ver=3"></script>
<script src="/resources/js/back.js"></script>
</html>
<%@include file="../../../../views/includes/footer.jsp" %>