package com.study.service;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dto.CommuteDTO;
import com.study.mapper.CommuteMapper;

@Service
public class CommuteServiceImpl implements CommuteService {
	
	@Autowired
	private CommuteMapper mapper;

	@Override
	public List<CommuteDTO> readCommute(String att_id) {
		return mapper.readCommute(att_id);
	}








}
