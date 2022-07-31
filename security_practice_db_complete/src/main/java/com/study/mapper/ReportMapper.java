package com.study.mapper;

import java.util.List;

import com.study.dto.ApprovalDTO;


public interface ReportMapper {
	public List<ApprovalDTO> readall();
	public int register(ApprovalDTO registerDto);
}