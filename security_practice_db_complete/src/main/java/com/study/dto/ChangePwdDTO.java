package com.study.dto;

import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class ChangePwdDTO {
	@NotNull
	private String mem_id;
	@NotNull
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{8,20}$", message="비밀번호는 영문과 특수문자 숫자를 포함하며 8자리 이상, 20자리 이하여야 합니다.")
	private String mem_pwd;
	@NotNull
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{8,20}$", message="비밀번호는 영문과 특수문자 숫자를 포함하며 8자리 이상, 20자리 이하여야 합니다.")
	private String new_mem_pwd;
	@NotNull
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{8,20}$", message="비밀번호는 영문과 특수문자 숫자를 포함하며 8자리 이상, 20자리 이하여야 합니다.")
	private String cur_new_mem_pwd;
}
