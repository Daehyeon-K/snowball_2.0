/**
 * 
 */

$(function(){
    
    let actionForm = $("#actionForm");
    
    // 페이지 이동 버튼 클릭
    $(".paginate_button a").click(function(e){
       e.preventDefault(); // a 속성 중지
       
       // 사용자가 선택한 페이지 번호 가져오기
       let pageNum = $(this).attr("href");
       
       // 가져온 번호를 actionForm 안의 pageNum 값으로 대체
       actionForm.find("[name='pageNum']").val(pageNum);
       
       // actionForm 보내기
       actionForm.submit();
    })

	$(".btn-danger").click(function(){
		location.href="/user/approvalInsert";
	})
    
 })