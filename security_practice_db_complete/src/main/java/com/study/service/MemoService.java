package com.study.service;



import org.apache.ibatis.annotations.Param;

import com.study.dto.MemoDTO;

public interface MemoService {
	public MemoDTO memoReadRow(String mem_id);
	public boolean memoUpdate(@Param("memo_content") String memo_content, @Param("mem_id") String mem_id);
}
