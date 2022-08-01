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
         url:'/user/approvalInsert',
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
   
   function showUploadFile(result) {
      let uploadResult = $(".uploadResult ul");
      
      let str ="";
      
      
      $(result).each(function(idx,obj){
         if(obj.fileType) {
               //썸네일 이미지 보여주기
               //썸네일 이미지 경로
               let fileCallPath = encodeURIComponent(obj.approval_file_dir+"\\s_"+obj.approval_file_id+"_"+obj.approval_file_name);
            
            //원본 파일 이미지 경로
            let oriPath = obj.approval_file_dir+"\\"+obj.approval_file_id+"_"+obj.approval_file_name;      
            oriPath = oriPath.replace(new RegExp(/\\/g),"/");
            
            //fileCallPath : 파라미터로 넘기는 방식, 인코딩 된 방식
            str += "<li data-path='"+obj.approval_file_dir+"' data-uuid='"+obj.approval_file_id+"' data-filename='"+obj.approval_file_name+"' data-type='"+obj.approval_file_type+"'>";
            str += "<a href=\"javascript:showImage(\'"+oriPath+"\')\">";
            str += "<img src='/display?fileName="+fileCallPath+"'></a>";
            str += "<div>"+obj.approval_file_name;
            str += "<button type='button' class='btn btn-warning btn-circle' data-file='"+fileCallPath+"' data-type='image'>";
            str += "<i class='fa fa-times'></i></button>";
            str += "</div></li>";
           }else { //txt 파일

            //다운로드 경로
            let fileCallPath = encodeURIComponent(obj.approval_file_dir+"\\"+obj.approval_file_id+"_"+obj.approval_file_name);
            
            str += "<li data-path='"+obj.approval_file_dir+"' data-uuid='"+obj.approval_file_id+"' data-filename='"+obj.approval_file_name+"' data-type='"+obj.approval_file_type+"'>";
            str += "<a href='/user/download?fileName="+fileCallPath+"'>";
            str += "<img src='/resources/img/attach.png'></a>";
            str += "<div>"+obj.approval_file_name;
            str += "<button type='button' class='btn btn-warning btn-circle' data-file='"+fileCallPath+"' data-type='file'>";
            str += "<i class='fa fa-times'></i></button>";
            str += "</div></li>";
              }

      });

      console.log("업로드 파일 경로");
      console.log(str);
      
      uploadResult.append(str);
   }//showIpladFile 종료

})
//   function showImage(fileCallPath){
//      $(".bigPictureWrapper").css("display","flex").show();
//   
//      $(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>").animate({width:'100%',height:'100%'},1000);
//   }