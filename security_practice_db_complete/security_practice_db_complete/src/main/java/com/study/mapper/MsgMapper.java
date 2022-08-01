package com.study.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.ApprovalDTO;
import com.study.dto.CriteriaDTO;
import com.study.dto.MsgDTO;

public interface MsgMapper {
//	public List<MsgDTO> mSelect(String mem_id);
	
	// 페이지 나누기 떄문에
	public List<MsgDTO> mSelect(@Param("mem_id") String mem_id,@Param("pageNum") int pageNum,@Param("amount") int amount);
	public int totalCnt(CriteriaDTO cri, @Param("mem_id") String mem_id);
	
	
	public MsgDTO msgReadRow(String msg_id);
	public int msgInsert(@Param("mem_id") String mem_id ,@Param("receiver_id") String receiver_id, @Param("msg_content") String msg_content);
	public int msgDelete(String msg_id);
}
