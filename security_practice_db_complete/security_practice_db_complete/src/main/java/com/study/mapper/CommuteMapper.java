package com.study.mapper;


import java.util.List;

import com.study.dto.CommuteDTO;
import com.study.dto.CriteriaDTO;

public interface CommuteMapper {
	public List<CommuteDTO> readCommute(String att_id);
}
