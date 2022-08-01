/**
 * notice_list의 스크립트
 */

$(function(){

//	작성 버튼은 관리자만 할 수 있기에 지워버림
//	$("#regBtn").click(function(){
//		location.href = "/admin/email/write.do";
//	})
	
   $(".noticeRead").click(function(e){
      e.preventDefault();
      
      //a가 가지고 있는 href속성 태그를 가지고 옴 
       let href = $(this).attr("href")
      
      console.log(href);


	  let NoticeReadForm = $("#NoticeReadForm");    
	  /* var mail_id = $("maildto.mail_id");*/


      if(NoticeReadForm.find("[name='mail_id']").length!=0){
         NoticeReadForm.find("[name='mail_id']").val(href);
      } else {
         NoticeReadForm.append("<input type='hidden' name='mail_id' value='"+href+"'>");
      }
      
      NoticeReadForm.attr("action","/user/email/noticeRead");
      NoticeReadForm.submit();


	
      
   })    
})

