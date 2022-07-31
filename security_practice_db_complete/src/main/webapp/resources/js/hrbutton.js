/**
 * hr att 근무태도 버튼
 */
 //버튼 클릭시 Row 값 가져오기
 $(".btn-primary").click(function(){ 
	let list_form = $("#listForm");
	var str = "";
	var tdArr = new Array();	// 배열 선언
	var btnprimary = $(this);

	// checkBtn.parent() : checkBtn의 부모는 <td>이다.
	// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
	var tr = btnprimary.parent().parent();
	var td = tr.children();
	
	console.log("클릭한 Row의 모든 데이터 : "+tr.text());
	
	var att_id = td.eq(0).text();
	//var mem_id = td.eq(1).text();
	//var att_vac = td.eq(2).text();
	//var att_nos = td.eq(3).text();
	//var att_late = td.eq(4).text();
	
	console.log("var에 들어감");
	
	
	console.log("append됨");
	
	// list_form 안에 att_id 태그를 추가 (값은 href가 가지고 있는 값으로)
    // 내용 보기에 들어갔을 때 사용자가 리스트 버튼이 아닌 뒤로가기 버튼을 눌러서 목록으로 돌아올 때 bno가 계속 추가되지 않게 방지
    if(list_form.find("[name='att_id']").length!=0){
		console.log("ㅎㅇ");
       list_form.find("[name='att_id']").val(att_id);
		console.log("ㅎㅇ");
    } else{
        list_form.append("<input type='hidden' name='att_id' value='"+att_id+"'>")
    }
	//list_form.attr("action","/user/support/hr/att");
	//console.log("attr 넘어감");

	list_form.submit();
	
	})
	
	$(function(){
	//approval_id 클릭시 /approval/approval_read로 이동
	$(".back-user").click(function(){
		location.href="/user/support/hr/att";
	})
	
	$(function(){
	//approval_id 클릭시 /approval/approval_read로 이동
	$(".back-user1").click(function(){
		location.href="/user/support/disaptch/att";
	})
	
	//페이지 이동 버튼 클릭
 	let actionForm = $("#actionForm");
	$(".paginate_button a").click(function(e){
		e.preventDefault();
		
		//bno가 있는 경우 제거
		actionForm.find("[name='att_id']").remove();
		
		//action 수정
		actionForm.attr("action","/user/support/hr/att");
		
		//사용자가 선택한 페이지 번호 가져오기
		let pageNum = $(this).attr("href");
		
		//가져온 번호를 actionForm 안의 pageNum 값으로 대체
		actionForm.find("[name='pageNum']").val(pageNum);
	
		//actionForm 보내기
		actionForm.submit();
 

   })
	
})
	
});