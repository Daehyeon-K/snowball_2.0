package com.study.service;



import java.util.List;

import com.study.dto.CommuteDTO;

public interface CommuteService {
	public List<CommuteDTO> readCommute(String att_id);
}
