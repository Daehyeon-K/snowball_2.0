package com.study.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.CriteriaDTO;
import com.study.dto.ReplyDTO;
import com.study.dto.ReplyPageDTO;

public interface ReplyService {
	public boolean replyInsert(@Param("mem_id") String mem_id,@Param("board_id") String board_id,@Param("reply_content") String reply_content);
	
	public ReplyDTO replyRow(String reply_id);
	
	public boolean replyUpdate(ReplyDTO updateDto);
	
	public boolean replyDelete(String reply_id);

	
	public ReplyPageDTO getList(CriteriaDTO cri, String board_id);
	
	public boolean getCountBoard_id(String board_id);
	
	public boolean deleteAll(String board_id);
	
}
