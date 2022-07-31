package com.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dto.CriteriaDTO;
import com.study.dto.MemDTO;
import com.study.mapper.UserListMapper;

@Service
public class UserListServiceImpl implements UserListService {
	
	@Autowired
	private UserListMapper mapper;
	

	@Override
	public List<MemDTO> select(CriteriaDTO cri) {
		return mapper.select(cri);
	}

	@Override
	public int totalCnt() {
		return mapper.totalCnt();
	}

}
