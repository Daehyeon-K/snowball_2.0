<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../includes/header.jsp" %>

<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                    	<h1 class="mt-4 breadcrumb mb-4 layout-center">
							<input type="text" name="mem_id" value='사용자 조회' class="login-name" readonly/>   
						</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Member List</li>
                        </ol>

 <div class="col-md-8">
          <!--search Form-->
          	<form action="" method="get" id="searchForm">
       	    	<input type="hidden" name="pageNum" value="${cri.pageNum}" /> 
				<input type="hidden" name="amount" value="${cri.amount}" />
          		<select name="type" id="">
           		<option value="W" <c:out value="${cri.type == 'W' ? 'selected':'' }"/>>사용자명</option>
           		<option value="C" <c:out value="${cri.type == 'C' ? 'selected':'' }"/>>사용자ID</option>
       	    	</select>
       	    	<input type="text" name="keyword" id="" value="${cri.keyword}"/>
       	    	<button class="btn btn-default" type="submit">Search</button>
          	</form>


<table class="table">
  <thead>
    <tr>
      <th scope="col">직원ID</th>
      <th scope="col">부서</th>
      <th scope="col">원청</th>
      <th scope="col">부서</th>
      <th scope="col">이름</th>
      <th scope="col">연락처</th>
      <th scope="col">이메일</th>
      <th scope="col">성별</th>
      <th scope="col">생년월일</th>
      <th scope="col">주소</th>
      <th scope="col">연봉</th>
      <th scope="col">비밀번호</th>
      <th scope="col">고용일</th>
      <th scope="col">계약만료</th>
      <th scope="col">원청시작</th>
      <th scope="col">원청만료</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="list" items="${mem}">
	    <tr>
	      <th scope="row"><a href="/admin/mem/memRead?mem_id=${list.mem_id}">${list.mem_id}</a></th>
	      <td>${list.grade_id}</td>
	      <td>${list.company_id}</td>
	      <td>${list.dept_id}</td>
	      <td>${list.mem_name}</td>
	      <td>${list.mem_phone}</td>
	      <td>${list.mem_mail}</td>
	      <td>${list.mem_gender}</td>
	      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.mem_birth}"/></td>
	      <td>${list.mem_addr}</td>
	      <td>${list.mem_sal}</td>
	      <td>${list.mem_pwd}</td>
	      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.mem_con_start}"/></td>
	      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.mem_con_end}"/></td>
	      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.mem_dcon_start}"/></td>
	      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.mem_dcon_end}"/></td>
	    </tr>
    </c:forEach>
  </tbody>
</table>
<button type="button" class="btn btn-primary back-user">돌아가기</button>


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
<script src="/resources/js/list.js"></script>
<script src="/resources/js/back.js"></script>
</html>
<%@include file="../../includes/footer.jsp" %>