/**
 * list.jsp 스크립트
 */
$(function(){
	//regBtn 클릭 시 /mem/register 로 움직이기
	$("#regBtn").click(function(){
		location.href = "/mem/mem_register";
	})
	
	$('[name="remove"]').click(function(){
		if(!confirm("사용자를 삭제 하시겠습니까?")){
			alert("사용자가 삭제되지 않았습니다")
		}else{
			let removeForm	=	$("#removeForm");
			var str = "";
		   var tdArr = new Array();   // 배열 선언
		   var btnprimary = $(this);
		   
		   // checkBtn.parent() : checkBtn의 부모는 <td>이다.
		   // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
		   var tr = btnprimary.parent().parent();
		   var td = tr.children();
		   
		   console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		   
		   var mem_id = td.eq(0).text();
		 
		   
		   console.log("var에 들어감");
		   
		  	removeForm.append()
      
	      // removeForm 안에 mem_id 태그를 추가 (값은 href가 가지고 있는 값으로)
	      // 내용 보기에 들어갔을 때 사용자가 리스트 버튼이 아닌 뒤로가기 버튼을 눌러서 목록으로 돌아올 때 company_id가 계속 추가되지 않게 방지
	      if(removeForm.find("[name='mem_id']").length!=0){
	         removeForm.find("[name='mem_id']").val(mem_id);
	      } else{
	         removeForm.append("<input type='hidden' name='mem_id' value='"+mem_id+"'>");      
	      }
	      
	      removeForm.attr("action", "/mem/mem_delete");
	      removeForm.attr("method", "post");
	      removeForm.submit();
	 
		}
	})
	
	//페이지 이동 버튼 클릭
	let actionForm = $("#actionForm");
	
	$(".paginate_button a").click(function(e){
		e.preventDefault();   // a 속성 중지
		
		//mem_id 가 있는 경우 제거
		actionForm.find("[name='mem_id']").remove();
		
		//action 수정
		actionForm.attr("action","/mem/mem_list");
		
		//사용자가 선택한 페이지 번호 가져오기
		let pageNum = $(this).attr('href');		
		//가져온 번호를 actionForm 안의 pageNum 값으로 대체
		actionForm.find("[name='pageNum']").val(pageNum);		
		//actionForm 보내기
		actionForm.submit();
		
	})//paginate_button 종료
	
	//페이지 목록 개수가 클릭
	$(".form-control").change(function(){
		//actionForm 안의 amount 값을 변경하기
		actionForm.find("[name='amount']").val($(this).val());
		//actionForm 보내기
		actionForm.submit();
	})
	
	
	//타이틀 클릭시
	$('[name="update"]').click(function(e){
		e.preventDefault();  //a 태그 기능 중지	
		
		
		//a가 가지고 있는 href 가지고 오기
		let href = $(this).attr("href");
		
		//actionForm 안에 bno 태그를 추가하기(값은 href가 가지고 있는 값으로)
		//내용 보기에 들어갔을 때 사용자가 리스트 버튼이 아닌 뒤로 가기 버튼을 눌러서
		//목록으로 돌아올 때 bno가 계속 추가되는 것 방지
		if(actionForm.find("[name='mem_id']").length!=0){
			actionForm.find("[name='mem_id']").val(href);
		}else{
			actionForm.append("<input type='hidden' name='mem_id' value='"+ href +"'>");					
		}
			
	
		//actionForm action 변경(/mem/read)
		actionForm.attr("action","/mem/mem_read");
		
		//actionForm 보내기
		actionForm.submit();
	})
	
	
	//검색 버튼 클릭시
	$(".btn-default").click(function(e){
		//submit 기능 중지	
		e.preventDefault();
		
		let searchForm = $("#searchForm");		
		
		//type 아무것도 선택이 되지 않으면 경고 메세지 주기
		if(searchForm.find("select[name='type']").val() == ''){
			alert("검색기준을 선택해 주세요");
			return false;
		}
		
		//keyword 값이 없으면 경고 메세지 주기
		if(searchForm.find("input[name='keyword']").val() == ''){
			alert("검색어를 입력해 주세요");
			return false;
		}
		//검색 폼 안에 pageNum 은 1로 변경	
		searchForm.find("input[name='pageNum']").val("1");
		
		//검색 폼 전송
		searchForm.submit();
	})
	
})
