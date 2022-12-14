package com.study.dto;

import java.util.Date;
import java.util.List;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {
	private String board_id;
	private String mem_id;
	private String board_title;
	private String board_content;
	private Date board_regdate;
	private Date board_updatedate;
	private int board_cnt; // 조회수
	
	//첨부파일 정보
    private List<BoardFileDTO> attachList;
	
}
