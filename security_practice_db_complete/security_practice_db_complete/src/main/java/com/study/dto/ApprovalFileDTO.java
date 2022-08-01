package com.study.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApprovalFileDTO {
   private String approval_file_id; //uuid
   private String approval_id; // bno
   private String approval_file_dir; //upload_path
   private String approval_file_name; //filename
   private boolean approval_file_type; //filetype
}
