package com.study.service;

import java.util.List;

import com.study.dto.CriteriaDTO;
import com.study.dto.MemDTO;

public interface UserListService {
	public List<MemDTO> select(CriteriaDTO cri);
	public int totalCnt(); 
}
