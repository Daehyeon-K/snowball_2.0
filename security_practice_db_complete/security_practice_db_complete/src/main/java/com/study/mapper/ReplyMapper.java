package com.study.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.CriteriaDTO;
import com.study.dto.ReplyDTO;

public interface ReplyMapper {
	public int replyInsert(@Param("mem_id") String mem_id,@Param("board_id") String board_id,@Param("reply_content") String reply_content);
	
	public ReplyDTO replyRow(String reply_id);
	
	public int replyupdate(ReplyDTO updateDto);
	
	public int replydelete(String reply_id);
	
	public List<ReplyDTO> getList(@Param("cri")CriteriaDTO cri,@Param("board_id") String board_id);
	
	public int getCountBoard_id(String board_id);
	
	public int deleteAll(String board_id);
	
}
