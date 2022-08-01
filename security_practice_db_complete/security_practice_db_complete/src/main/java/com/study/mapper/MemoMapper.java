package com.study.mapper;


import org.apache.ibatis.annotations.Param;

import com.study.dto.MemoDTO;

public interface MemoMapper {
	public MemoDTO memoReadRow(String mem_id);
	public int memoUpdate(@Param("memo_content") String memo_content, @Param("mem_id") String mem_id);
}
