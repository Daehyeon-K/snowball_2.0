package com.study.mapper;

import java.util.List;

import com.study.dto.ApprovalFileDTO;
import com.study.dto.BoardFileDTO;
import com.study.dto.MailFileDTO;


public interface AttachMapper {
	//첨부파일 삽입
	public int insertFile(ApprovalFileDTO attach);

	// 게시판 첨부파일 삽입
	public int BoardFile(BoardFileDTO attach);
	// 게시판 첨부파일
	public List<BoardFileDTO> filelist(String board_id);

	//첨부파일 목록 
	public List<ApprovalFileDTO> list(String approval_id);
	//첨부파일 전체 삭제
	public int deleteAll(String approval_id);
	//어제날짜의 첨부파일 목록
	public List<ApprovalFileDTO> getOldFiles();



	// 메일 첨부파일 삽입
	public int MailFile(MailFileDTO attach);
	// 게시판 첨부파일
	public List<MailFileDTO> mailfile(String mail_id);






}
