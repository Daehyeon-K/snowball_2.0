package com.study.dto;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApprovalDTO {
	private String approval_id;
	private String mem_id;
    private String approval_type_id;
    private String approval_commit_id;
    private String approval_inter_id;
    private String approval_final_id;
    private String approval_reject;
    private String approval_content;

    
    //첨부파일 정보
    private List<ApprovalFileDTO> attachList;
 

}
