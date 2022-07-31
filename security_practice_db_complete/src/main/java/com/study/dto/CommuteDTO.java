package com.study.dto;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommuteDTO {
	private String commute_id;
	private String att_id;
	private Timestamp commute_in;
	private Timestamp commute_out;
	private Timestamp commute_wot;
}
