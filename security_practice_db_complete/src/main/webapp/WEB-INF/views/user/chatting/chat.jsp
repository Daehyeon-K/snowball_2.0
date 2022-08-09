<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../../includes/header.jsp" %>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4 breadcrumb mb-4 layout-center">채팅방</h1>
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
							<button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
						</div>
					</div>
					</div>
				</div>
			</div>
		<%@include file="../../../views/includes/footer.jsp"%>

<script>
   let username ='<sec:authentication property="principal.user.mem_name"/>';
   let userid ='<sec:authentication property="principal.user.mem_id"/>';
</script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="/resources/js/sockJS.js?ver=3"></script>