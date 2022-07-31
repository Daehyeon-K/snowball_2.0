/**
 * company_modify.jsp의 스크립트
 */

$(function(){
   //modifyForm 가져오기
   let modifyForm = $("#modifyForm");
   
   $("button").click(function(e){
      e.preventDefault(); // submit 막기
      
      let oper = $(this).data("oper");
      
      if(oper == "modify"){
         operForm = $([role='form']);
      }
      else if (oper == "list") {
         operForm.find("[name='company_id']").remove();
         operForm.attr('action','/admin/company/companyList');
      }
      
      modifyForm.submit();
   })
})