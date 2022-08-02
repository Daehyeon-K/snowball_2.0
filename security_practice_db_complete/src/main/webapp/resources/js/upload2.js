/**
 * uploadform_ajax 스크립트
 */

$(function(){
   
   $(":file").change(function(){
      console.log("ajax 파일 업로드 호출");
      
      // 틀 객체 생성
      let formData = new FormData();
      
      // 첨부파일 목록 가져오기
      let inputFile = $("[name='uploadFile']");
      console.log("첨부파일 목록 가져오기")
      console.log(inputFile);
      
      let files = inputFile[0].files;
      console.log("첨부파일 뽑기")
      console.log(files);
      
      // 폼 객체에 첨부파일들 추가
      for(let i=0;i<files.length;i++){
         console.log("첨부파일 반복 돌리기")
         if(!checkExtension(files[i].name,files[i].size)){
            console.log("조건문 확인")
            return false;
         }
         
         formData.append("uploadFile",files[i]);
      }
      
      //enctype ="multipart/form-data"와 같은 코드의 의미 = processData,contentType
      
      // processData : false => 데이터를 일반적인 쿼리 스트링 형태로 변환할 것인지 결정
      //                    기본값은 true(location/x-www-form-urlencodered)
      // contentType : false => 기본값은 true
      
      // 폼 객체 ajax 전송
      $.ajax({
         url:'/user/board/create',
         type:'post',
         processData:false,
         contentType:false,
         beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		 },
         data:formData,
         dataType:'json',
         success:function(result){
            //console.log(result);
            $(":file").val("");
            showUploadFile(result);
         }
      })
      
      
   }) //uploadBtn 종료
   

   function showImage(fileCallPath){
     $(".bigPictureWrapper1").css("display","flex").show();
   
     $(".bigPicture1").html("<img src='/user/board/display?fileName="+fileCallPath+"'>").animate({width:'100%',height:'100%'},1000);
  }