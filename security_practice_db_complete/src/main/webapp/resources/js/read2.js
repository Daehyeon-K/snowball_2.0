/**
 * 
 */
$(function(){
	$(".btn-primary").click(function(){
		location.href="/user/board/create";
	})
	
	$.getJSON({
	url : '/user/board/getAttachList',
	data: {
		board_id : board_id
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
			if (obj.board_file_type) {
				//썸네일 이미지 보여주기
				//썸네일 이미지 경로
				let fileCallPath = encodeURIComponent(obj.board_file_dir + "\\s_" + obj.board_file_id + "_" + obj.board_file_name);
				
				
				// 원본 파일 이미지 경로
				let oriPath = obj.board_file_dir + "\\" + obj.board_file_id + "_" + obj.board_file_name;
				oriPath = oriPath.replace(new RegExp(/\\/g), "/");
				
				//fileCallPath : 파라미터로 넘기는 방식, 인코딩 된 방식
				str += "<li data-path='" + obj.board_file_dir + "' data-uuid='" + obj.board_file_id + "' data-filename='" + obj.board_file_name + "' data-type='" + obj.board_file_type + "'>";
				str += "<a href='/user/board/download?fileName="+fileCallPath+"'>";				
				str += "<img src='/user/board/display?fileName=" + fileCallPath + "'></a>";
				str += "<div>" + obj.board_file_name;
				str += "</div></li>";
				
			} else { //txt파일
			
				//다운로드 경로
				let fileCallPath = encodeURIComponent(obj.board_file_dir + "\\" + obj.board_file_id + "_" + obj.board_file_name);

				str += "<li data-path='" + obj.board_file_dir + "' data-uuid='" + obj.board_file_id + "' data-filename='" + obj.board_file_name + "' data-type='" + obj.board_file_type + "'>";
				str += "<a href='/user/board/download?fileName=" + fileCallPath + "'>";
				str += "<img src='/resources/img/attach.png'></a>";
				str += "<div>" + obj.board_file_name;
				str += "</div></li>";
				
			}
	});
	
		console.log("업로드 파일 경로");
		console.log(str);

		uploadResult.append(str);
	}//showIpladFile 종료
})