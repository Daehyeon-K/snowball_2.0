package com.study.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.CriteriaDTO;
import com.study.dto.MailDTO;

public interface MailMapper {
	public int emailToDB(MailDTO mailDto);
	//public List<MailDTO> select(MailDTO mailDto);
	public List<MailDTO> select(@Param("cri") CriteriaDTO cri);
	public int totalCnt(@Param("cri") CriteriaDTO cri/*, @Param("typeArr") String[] typeArr*/);
	public MailDTO read(String mail_id); 
}
