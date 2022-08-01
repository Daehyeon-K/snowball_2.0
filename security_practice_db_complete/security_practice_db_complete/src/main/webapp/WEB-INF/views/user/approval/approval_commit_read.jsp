<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../../../views/includes/header.jsp" %>

<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                    	<h1 class="mt-4 breadcrumb mb-4 layout-center">
							<input type="text" name="mem_id" value='결재 정보' class="login-name" readonly/>   
						</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Approval Information</li>
                        </ol>

<form action="approvalCommit?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" id="approval_commit_form">

  <div class="form-group">
    <label for="approval_id">결재ID</label>
  	<input type="text" class="form-control" name="approval_id" value="${dto.approval_id}" readonly>
  </div>
  
  <div class="form-group">
    <label for="mem_id">사용자ID</label>	
  	<input type="text" class="form-control" name="mem_id" value="${dto.mem_id}" readonly>
  </div>
  
  <div class="form-group">
	<label for="approval_type_id">결재종류</label>
	<div class="form-group md-4">
		<input type="text" class="form-control" name="approval_type_id" value="${dto.approval_type_id}" readonly>
		<!--<select name="approval_type_id" id="approval_type_id" class="form-control">
			<option value="BP">비품신청</option>
			<option value="HG">휴가신청</option>
		</select> -->
	</div>
  </div>
  
  <div class="form-group">
    <label for="approval_commit_id">결재승인번호</label>
    <div>
	    <input type="text" class="form-control" name="approval_commit_id" value="${dto.approval_commit_id}" readonly >
	    <!-- <input type="text" class="form-control" name="approval_commit_id" value="${dto.approval_commit_id}" readonly > -->
    </div>
  </div>
  
  <div class="form-group">
    <label for="approval_commit_inter_check">중간승인현황</label>
    <div>
	    <input type="text" class="form-control" name="approval_commit_inter_check" value="${commitDto.approval_commit_inter_check}" readonly >
	    <!-- <input type="text" class="form-control" name="approval_commit_id" value="${dto.approval_commit_id}" readonly > -->
    </div>
  </div>
  
  <div class="form-group">
    <label for="approval_commit_final_check">최종승인현황</label>
    <div>
	    <input type="text" class="form-control" name="approval_commit_final_check" value="${commitDto.approval_commit_final_check}" readonly >
	    <!-- <input type="text" class="form-control" name="approval_commit_id" value="${dto.approval_commit_id}" readonly > -->
    </div>
  </div>
  
  <div class="form-group">
    <label for="approval_inter_id">중간승인권자</label>
    <input type="text" class="form-control" name="approval_inter_id" value="${dto.approval_inter_id}" readonly>
    <!-- <select name="approval_inter_id" id="approval_inter_id" class="form-control">
		<option value="20220001">최지수 과장</option>
		<option value="20220003">이결순 부장</option>
		<option value="20220008">곽도원 부장</option>
	</select> -->
  </div>
  
  <div class="form-group">
    <label for="approval_final_id">최종승인권자</label>
    <input type="text" class="form-control" name="approval_final_id" value="${dto.approval_final_id}" readonly>
    <!-- <select name="approval_final_id" id="approval_final_id" class="form-control">
		<option value="20220007">정우성 사장</option>
	</select> -->
  </div>
  
  <div class="form-group">
    <label for="approval_reject">결재반려사유</label>
  	<input type="text" class="form-control" name="approval_reject" value="${dto.approval_reject}">
    <!--<input type="text" class="form-control" name="approval_reject">  -->
  </div>
  
  <div class="form-group">
     <label for="approval_content">결재내용</label>
 	 <input type="text" class="form-control" name="approval_content" value="${dto.approval_content}" readonly>	
  </div>
  
<!--  <div class="uploadResult" >
	 <input type="file" name="uploadFile" id="" multiple="multiple" readonly>
  </div>  -->
  
<!--   <div class="uploadResult">
  	<ul></ul>
  </div> -->
  
 <%-- 파일 첨부 영역 --%>
  <div class="row">
     	<div class="col-lg-12">
     	<div class="panel panel-default">
     		<div class="panel-heading"><i class="fa fas fa-file"></i>파일첨부</div>
     			<div class="uploadResult">
     				<ul><!-- 첨부파일 정보 --></ul>
     			</div>
     		</div>
     	</div>
     </div>
	<div class="bigPictureWrapper">
		<div class="bigPicture"></div>
	</div>
  
  <div>
  	 <button type="submit" class="btn btn-success approval_commit">승인</button>
  	 <button type="submit" class="btn btn-danger approval_reject">반려</button>
 	 <button type="reset" class="btn btn-primary">돌아가기</button>
 	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  </div>
  
  </form>
	<script>
	//현재 approval_id 번호
	let approval_id = "${dto.approval_id}";
	
	</script>


<script src="/resources/js/commitRead.js?ver=3"></script>
<script src="/resources/js/upload.js"></script>

</html>
<%@include file="../../../views/includes/footer.jsp" %>