<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../../views/includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			
			<div class="menu-name">
				<span >채팅방</span>
			</div>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Chat Room</li>
			</ol>
				
			<div>
				<div>
					<div id="msgArea" class="col">
					
					</div>
					<div class="col-6">
					<div class="input-group mb-3">
						<input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
						<div class="input-group-append">
							<br /><br />
							<button class="btn btn-outline-secondary" type="button" id="button-send" style="border:1px solid gray;margin-top:10px !important;">전송</button>
						</div>
					</div>
					</div>
				</div>
			</div>
			
		</div>
	</main>
<script>
   let username ='<sec:authentication property="principal.user.mem_name"/>';
   let userid ='<sec:authentication property="principal.user.mem_id"/>';
</script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="/resources/js/sockJS.js?ver=3"></script>
<%@include file="../../../views/includes/footer.jsp" %>
			