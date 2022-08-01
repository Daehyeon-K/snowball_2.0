/**
 * 
 */
$(function(){
	$(".btn-primary").click(function(){
		location.href="/user/approvalList";
	})
	
	$.getJSON({
	url : '/user/getAttachList',
	data: {
		approval_id : approval_id
	},
	success : function(data){
		console.log(data);
		showUploadFile(data);
	}
	
	})
	
	function showUploadFile(result) {
		//업로드 결과 영역 가져오기
		let uploadResult = $(".uploadResult ul")
		
		let str = "";
		
		$(result).each(function(idx,obj){
			if (obj.approval_file_type) {
				//썸네일 이미지 보여주기
				//썸네일 이미지 경로
				let fileCallPath = encodeURIComponent(obj.approval_file_dir + "\\s_" + obj.approval_file_id + "_" + obj.approval_file_name);
				
				
				// 원본 파일 이미지 경로
				let oriPath = obj.approval_file_dir + "\\" + obj.approval_file_id + "_" + obj.approval_file_name;
				oriPath = oriPath.replace(new RegExp(/\\/g), "/");
				
				//fileCallPath : 파라미터로 넘기는 방식, 인코딩 된 방식
				str += "<li data-path='" + obj.approval_file_dir + "' data-uuid='" + obj.approval_file_id + "' data-filename='" + obj.approval_file_name + "' data-type='" + obj.approval_file_type + "'>";
				str += "<a href=\"javascript:showImage(\'" + oriPath + "\')\">";
				str += "<img src='display?fileName=" + fileCallPath + "'></a>";
				str += "<div>" + obj.approval_file_name;
				str += "</div></li>";
				
			} else { //txt파일
			
				//다운로드 경로
				let fileCallPath = encodeURIComponent(obj.approval_file_dir + "\\" + obj.approval_file_id + "_" + obj.approval_file_name);

				str += "<li data-path='" + obj.approval_file_dir + "' data-uuid='" + obj.approval_file_id + "' data-filename='" + obj.approval_file_name + "' data-type='" + obj.approval_file_type + "'>";
				str += "<a href='/user/download?fileName=" + fileCallPath + "'>";
				str += "<img src='/resources/img/attach.png'></a>";
				str += "<div>" + obj.approval_file_name;
				str += "</div></li>";
				
			}
	
	
	});
	
		console.log("업로드 파일 경로");
		console.log(str);

		uploadResult.append(str);
	}//showIpladFile 종료
	
	
})