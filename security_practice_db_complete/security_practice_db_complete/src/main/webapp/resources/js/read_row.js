/**
 * read.jsp 스크립트
 */
$(function(){
   
   //operForm 가져오기
   let operForm = $("#operForm");
   
   $(".btn-info").click(function(){
      location.href = "/user/board/list";
   })
   
   //modify 버튼 클릭시 operForm 이동
   $(".btn-success").click(function(){
      operForm.attr("action","/user/board/modify");
      operForm.submit();
   })
   
   //삭제 버튼 클릭시 
   $(".btn-danger").click(function(e){
      operForm.attr("action","/user/board/delete");
      operForm.attr("method","get");
      operForm.submit();
   })      
            
})
      
      
   