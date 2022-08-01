/**
 * read.jsp 스크립트
 */
$(function(){

	let formSubmit = $("#formSubmit"); // 정보 폼 전송하는 것
	
	let operForm = $("#operForm");
	
	//list 버튼 클릭시  
	$(".btn-info").click(function(){
		location.href = '/admin/mem/memList';
	})
	
	
	//modify 버튼 클릭시 operForm 이동
	$(".btn-default").click(function(){
		operForm.submit();
	})
	
	
	
	$(".btn-danger").click(function(){
		if(!confirm("사용자를 삭제 하시겠습니까?")){
			alert("사용자가 삭제되지 않았습니다");
		}
		formSubmit.attr('action', "/admin/mem/memRemove");
		formSubmit.submit();
	})
	
})

















