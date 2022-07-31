<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../includes/header.jsp" %>
      <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">쪽지</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">쪽지 보내기</li>
                        </ol>
                        
                        
 		<div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" method="post" role="form">
                				<div class="form-group">
                					<label style="width: 15%;">수신자</label>
                					<input style="width: 20%;" class="form-control" name="receiver_id" required>                				
                				</div>  
                				<div class="form-group">
                					<label>내용</label>
                					<textarea class="form-control" style="resize: none;" rows="10" name="msg_content" required></textarea>               				
                				</div> 
                				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                				<button type="submit" class="btn btn-default">보내기</button>              			
                				<button type="button" class="btn btn-default back-user">돌아가기</button>                 				            			
                			</form>
                		</div>
                	</div>
                </div>
            </div>  
</div>
</main>
<script src="/resources/js/back.js"></script>
<%@include file="../../includes/footer.jsp" %>
</div>