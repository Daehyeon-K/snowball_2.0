package com.study.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dto.MemoDTO;
import com.study.mapper.MemoMapper;

@Service
public class MemoServiceImpl implements MemoService {
	@Autowired
	private MemoMapper mapper;
	
	@Override
	public MemoDTO memoReadRow(String mem_id) {
		return mapper.memoReadRow(mem_id);
	}

	@Override
	public boolean memoUpdate(@Param("memo_content") String memo_content, @Param("mem_id") String mem_id) {
		return mapper.memoUpdate(memo_content,mem_id)==1?true:false;
	}


}
