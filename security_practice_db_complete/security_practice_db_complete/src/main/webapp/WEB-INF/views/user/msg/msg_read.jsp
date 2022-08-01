<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../includes/header.jsp" %>
      <div id="layoutSidenav_content">
                <main>
                	<form action="" method="post" role="form" class="msgForm">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">쪽지</h1>

                        
                        
                    <div class="mb-3">
					  <label for="exampleFormControlInput1" class="form-label"> <br>발신자</label>
					  <input type="text" style="width:300px;" class="form-control" value="${mRead.sender_id}" readonly="readonly">
					
		
								
					</div>
					<div class="mb-3">
					  <label for="exampleFormControlTextarea1" class="form-label">내용</label>


					  
					  <textarea class="form-control" style="resize: none;" readonly="readonly" rows="12">${mRead.msg_content}</textarea>
					</div>    
    				<div>
    				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
   					<button type="button" class="btn btn-primary " onclick="location='/user/index'">목록</button>
   					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary msgDelete" onclick="alert('쪽지가 삭제되었습니다.')">
					 삭제
					</button>
   				</div>
			
			
</div>
<input type="hidden" name="msg_id" value="${mRead.msg_id}" />
</form>
</main>
<script src="/resources/js/msgRead.js"></script>
<%@include file="../../includes/footer.jsp" %>
</div>