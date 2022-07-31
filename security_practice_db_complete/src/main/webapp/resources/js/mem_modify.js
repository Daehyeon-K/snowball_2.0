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
			
			console.log(operForm.html());
			
		
		}else if(oper == "list"){
			operForm.find("[name='mem_id']").remove();
			operForm.attr('action','/admin/mem/memList');
		}
		
		operForm.submit();		
	})
	
	
	
})

















