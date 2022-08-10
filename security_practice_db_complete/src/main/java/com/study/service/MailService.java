package com.study.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.BoardFileDTO;
import com.study.dto.CriteriaDTO;
import com.study.dto.MailDTO;
import com.study.dto.MailFileDTO;

public interface MailService {
	public void EmailService11(MailDTO mailDto);
	public MailDTO EmailService(MailDTO mailDto);
	public boolean emailToDB(MailDTO mailDto);
	public List<MailDTO> select(@Param("cri") CriteriaDTO cri);
	public int totalCnt(@Param("cri") CriteriaDTO cri/*, @Param("typeArr") String[] typeArr*/);
	public MailDTO read(String mail_id);
	
	//첨부파일 첨부
	public void MailFileInsert(MailDTO insertDto);
	
	//첨부파일 가져오기
	public List<MailFileDTO> attachList(String mail_id);
}
