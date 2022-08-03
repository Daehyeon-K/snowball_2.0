/**
 * modify.jsp 스크립트
 */
$(function(){
   //operForm 가져오기
   let operForm = $("#operForm");
   
   $("button").click(function(e){
      e.preventDefault(); //submit 막기
      
      //현재 눌러진 버튼의 data- 값을 가져오기
      let oper = $(this).data("oper");
      
      if(oper == "modify"){
         operForm = $("[role='form']");
		 if(confirm("수정 하시겠습니까?")) {
			alert("수정이 완료되었습니다")
		} else {
			
		}
		      	
      } else if(oper == "list"){
         operForm.find("[name='board_id']").remove();
         operForm.attr('action','/user/board/list');
      }
      
      operForm.submit();      
      
   })
   
})
















