package com.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dto.AttDTO;
import com.study.dto.CriteriaDTO;
import com.study.mapper.HrMapper;

@Service
public class HrServiceImpl implements HrService {
	
	@Autowired
	private HrMapper mapper;

	@Override
	public List<AttDTO> hrList(CriteriaDTO cri) {
		return mapper.hrList(cri);
	}

	@Override
	public int totalCnt(CriteriaDTO cri) {
		return mapper.totalCnt(cri);
	}


}
