package com.study.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dto.CriteriaDTO;
import com.study.dto.MsgDTO;
import com.study.mapper.MsgMapper;

@Service
public class MsgServiceImpl implements MsgService {
	
	@Autowired
	private MsgMapper mapper;
	
	
	
//	@Override
//	public List<MsgDTO> mSelect(String mem_id) {
//		return mapper.mSelect(mem_id);
//	}

	@Override
	public MsgDTO msgReadRow(String msg_id) {
		return mapper.msgReadRow(msg_id);
	}

	@Override
	public boolean msgInsert(@Param("mem_id") String mem_id ,@Param("receiver_id") String receiver_id, @Param("msg_content") String msg_content) {
		return mapper.msgInsert(mem_id,receiver_id,msg_content)==1?true:false;
	}

	@Override
	public boolean msgDelete(String msg_id) {
		return mapper.msgDelete(msg_id)==1?true:false;
		
	}

	@Override
	public List<MsgDTO> mSelect(String mem_id,int pageNum, int amount) {
		return mapper.mSelect(mem_id, pageNum, amount);
	}

	@Override
	public int totalCnt(CriteriaDTO cri, @Param("mem_id") String mem_id) {
		return mapper.totalCnt(cri,mem_id);
	} 

	
}
