package com.study.mapper;

import java.util.List;

import com.study.dto.CriteriaDTO;
import com.study.dto.MemDTO;

public interface UserListMapper {
	public List<MemDTO> select(CriteriaDTO cri);
	public int totalCnt(); 
}
