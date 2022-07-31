package com.study.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.study.dto.CriteriaDTO;
import com.study.dto.MemDTO;

public interface MemMapper {
	public List<MemDTO> select(CriteriaDTO cri);
	public int insert(MemDTO insertDto);
	public MemDTO read(String mem_id);
	public int update(MemDTO updateDto);
	public int delete(String mem_id);
	public int totalCnt(CriteriaDTO cri);	
}

















