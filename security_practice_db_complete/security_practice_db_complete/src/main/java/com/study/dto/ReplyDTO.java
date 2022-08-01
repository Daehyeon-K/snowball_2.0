package com.study.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReplyDTO {
	private String  reply_id;
	private String  mem_id;
	private String  board_id;
	private String reply_content;
	private Date reply_regdate;
	private Date reply_updatedate;
}
