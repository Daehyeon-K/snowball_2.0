package com.study.service;

import java.util.List;

import com.study.dto.MailDTO;

public interface MailService {
	public void EmailService11(MailDTO mailDto);
	public MailDTO EmailService(MailDTO mailDto);
	public boolean emailToDB(MailDTO mailDto);
	public List<MailDTO> select(MailDTO mailDto);
	public MailDTO read(String mail_id);
}
