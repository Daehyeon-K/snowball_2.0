package com.study.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttDTO {
	private String att_id;
	private String mem_id;
	private int att_vac;
	private int att_nos;
	private int att_late;
}
