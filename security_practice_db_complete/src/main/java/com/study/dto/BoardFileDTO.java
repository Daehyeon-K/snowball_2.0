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
public class BoardFileDTO {
   private String board_file_id; //uuid
   private String board_id; // bno
   private String board_file_dir; //upload_path
   private String board_file_name; //filename
   private boolean board_file_type; //filetype
   
   
   
   
}
