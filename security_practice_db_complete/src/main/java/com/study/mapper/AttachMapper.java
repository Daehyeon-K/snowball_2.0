package com.study.mapper;

import java.util.List;

import com.study.dto.ApprovalFileDTO;


public interface AttachMapper {
	//첨부파일 삽입
	public int insertFile(ApprovalFileDTO attach);
	//첨부파일 목록 
	public List<ApprovalFileDTO> list(String approval_id);
	//첨부파일 전체 삭제
	public int deleteAll(String approval_id);
	//어제날짜의 첨부파일 목록
	public List<ApprovalFileDTO> getOldFiles();
}
