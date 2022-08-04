package com.study.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MailFileDTO {
	private String mail_file_id;
	private String mail_id;
	private String mail_file_dir;
	private String mail_file_name;
	private String mail_file_type;
}
