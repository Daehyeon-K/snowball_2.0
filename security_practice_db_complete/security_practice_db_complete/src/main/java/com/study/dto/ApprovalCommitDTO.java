package com.study.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApprovalCommitDTO {
	private String approval_commit_id;
	private String approval_commit_inter_check;
	private String approval_commit_final_check;
}
