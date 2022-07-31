/**
 * 
 */
$(function(){
   
   let operForm = $("#operForm");
   
   //list 버튼 클릭 시 /company/company_list 보여주기
   $(".btn-info").click(function(){
      // operForm bno 태그 제거하기
      operForm.find("input[name='company_id']").remove(); //name이 bno인거 찾아서 제거하기
      
      //operForm action 수정
      operForm.attr("action","/admin/company/companyList"); //이동경로 바꿔주기
      
      //operForm 보내기(전송시켜주기)
      operForm.submit();
   })
   
   //modify 버튼 클릭 시
   $(".btn-primary").click(function(){
   	  operForm.attr("action", "/admin/company/companyModify");
      operForm.submit();
   })
   
   $(".btn-danger").click(function(){
      operForm.attr("action", "/admin/company/companyDelete");
      operForm.attr("method", "get");
      operForm.submit();
   })
   
})