package com.study.mapper;

import java.util.List;

import com.study.dto.MailDTO;

public interface MailMapper {
	public int emailToDB(MailDTO mailDto);
	public List<MailDTO> select(MailDTO mailDto);
	public MailDTO read(String mail_id);
}
