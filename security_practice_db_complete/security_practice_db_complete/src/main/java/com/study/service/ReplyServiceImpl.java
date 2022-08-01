package com.study.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.dto.CriteriaDTO;
import com.study.dto.ReplyDTO;
import com.study.dto.ReplyPageDTO;
import com.study.mapper.BoardMapper;
import com.study.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private BoardMapper boardMapper;
	
	
	@Transactional
	@Override
	public boolean replyInsert(@Param("mem_id") String mem_id,@Param("board_id") String board_id,@Param("reply_content") String reply_content) {
		return mapper.replyInsert(mem_id,board_id,reply_content)==1?true:false;
	}


	@Override
	public ReplyDTO replyRow(String reply_id) {		
		return mapper.replyRow(reply_id);
	}


	@Override
	public boolean replyUpdate(ReplyDTO updateDto) {		
		return mapper.replyupdate(updateDto)==1?true:false;
	}


	@Transactional
	@Override
	public boolean replyDelete(String reply_id) {	
		
		// bno 알아내기
		ReplyDTO dto = mapper.replyRow(reply_id);		
		
		//원본글의 댓글 수 감소
		boardMapper.updateReplyCnt(dto.getBoard_id(), -1);
		
		return mapper.replydelete(reply_id)==1?true:false;
	}


	@Override
	public ReplyPageDTO getList(CriteriaDTO cri,String board_id) {		
		return new ReplyPageDTO(mapper.getCountBoard_id(board_id), mapper.getList(cri, board_id));
	}


	@Override
	public boolean getCountBoard_id(String board_id) {
		return false;
	}


	@Override
	public boolean deleteAll(String board_id) {
		return false;
	}



}










