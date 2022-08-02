package com.study.dto;

import java.util.List;

import lombok.Data;

@Data
public class ChangePwdDTO {
	private String mem_id;
	private String mem_pwd;
	private String new_mem_pwd;
	private String cur_new_mem_pwd;
}
