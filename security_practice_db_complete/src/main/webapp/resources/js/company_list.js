/**
 * company_list.jsp 의 스크립트
 */
$(function(){
   // readbtn 클릭시 / company_read 로 움직이기
   $(".readbtn").click(function(){
      
      let readForm = $("#readForm");
      var str = "";
      var tdArr = new Array();   // 배열 선언
      var readbtn = $(this);
      
      // checkBtn.parent() : checkBtn의 부모는 <td>이다.
      // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
      var tr = readbtn.parent().parent();
      var td = tr.children();
      
      console.log("클릭한 Row의 모든 데이터 : "+tr.text());
      
      var company_id = td.eq(0).text();
      //var mem_id = td.eq(1).text();
      //var att_vac = td.eq(2).text();
      //var att_nos = td.eq(3).text();
      //var att_late = td.eq(4).text();
      
      console.log("var에 들어감");
      
      // readForm 안에 company_id 태그를 추가 (값은 href가 가지고 있는 값으로)
      // 내용 보기에 들어갔을 때 사용자가 리스트 버튼이 아닌 뒤로가기 버튼을 눌러서 목록으로 돌아올 때 company_id가 계속 추가되지 않게 방지
     if(readForm.find("[name='company_id']").length!=0){
         readForm.find("[name='company_id']").val(company_id);
      } else{
         readForm.append("<input type='hidden' name='company_id' value='"+company_id+"'>");      
      }
      console.log("append됨");
      readForm.attr("action","/admin/company/companyList");
      //console.log("attr 넘어감");
      readForm.submit();

      }),
   
   $("#regBtn").click(function(){
      location.href = "/admin/company/companyRegister";
   }),
   
   $(".modify").click(function(){
      let readForm = $("#readForm");
      
         var str = "";
      var tdArr = new Array();   // 배열 선언
      var modify = $(this);

      var tr = modify.parent().parent();
      var td = tr.children();
      
      var company_id = td.eq(0).text();
      
      if(readForm.find("[name='company_id']").length!=0){
         readForm.find("[name='company_id']").val(company_id);
      } else{
         readForm.append("<input type='hidden' name='company_id' value='"+company_id+"'>");      
      }
      
      readForm.attr("action", "/admin/company/companyModify");
      readForm.attr("method", "post");
      readForm.submit();
   })
   

});