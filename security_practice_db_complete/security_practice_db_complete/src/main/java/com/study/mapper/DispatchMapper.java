package com.study.mapper;

import java.util.List;

import com.study.dto.AttDTO;
import com.study.dto.CriteriaDTO;

public interface DispatchMapper {
	public List<AttDTO> hrList(CriteriaDTO cri);
	public int totalCnt(CriteriaDTO cri);
}
