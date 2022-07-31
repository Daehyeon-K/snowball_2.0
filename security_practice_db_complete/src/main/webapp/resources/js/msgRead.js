/**
 * 쪽지 리스트에서 하나를 골라서 보여줌(msg_list.jsp)
 */
 
//버튼 클릭시 Row 값 가져오기
$(function(){
	 $(".msgView").click(function(){
   let list_form = $(".msgViewForm");
   let msgview = $(this);
   
   // checkBtn.parent() : checkBtn의 부모는 <td>이다.
   // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
   let tr = msgview.parent().parent();
   let td = tr.children();
   
   console.log("클릭한 Row의 모든 데이터 : "+tr.text());
   
   let msg_id = td.eq(0).text();
   //var mem_id = td.eq(1).text();
   //var att_vac = td.eq(2).text();
   //var att_nos = td.eq(3).text();
   //var att_late = td.eq(4).text();
   
   console.log("var에 들어감");
   
   list_form.append("<input type='hidden' name='msg_id' value='"+msg_id+"'>")
   console.log("append됨");
   list_form.attr("action","/user/msg/msgRead");
   //console.log("attr 넘어감");
   list_form.submit();
   
})

let msgForm = $(".msgForm");

 $(".msgDelete").click(function(){
		msgForm.attr('action', "/user/msg/msgDelete");
		msgForm.submit();
	});
	
	
})












