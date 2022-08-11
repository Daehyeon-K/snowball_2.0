/**
 * read.jsp 스크립트
 */
$(function(){
   
   //operForm 가져오기
   let operForm = $("#operForm");
   
   $(".info").click(function(){
      location.href = "/user/board/list";
   })
   
   //modify 버튼 클릭시 operForm 이동
   $(".success").click(function(){
	if(confirm("수정하시겠습니까?")) {
      operForm.attr("action","/user/board/modify");
      operForm.submit();
	}else{
	
	}
   })
   
   //삭제 버튼 클릭시 
	$(".danger").click(function(){
	  if(confirm("삭제하시겠습니까?")) {
		alert("삭제가 완료되었습니다.");
		operForm.attr("action","/user/board/delete");
      	operForm.attr("method","get");
      	operForm.submit();
	} else {
		
	}
     
   })
   
            
})
      
      
   