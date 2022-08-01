package com.study.service;

import java.util.List;

import com.study.dto.AttDTO;
import com.study.dto.CriteriaDTO;

public interface HrService {
	public List<AttDTO> hrList(CriteriaDTO cri);
	public int totalCnt(CriteriaDTO cri);
}
