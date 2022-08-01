package com.study.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemDTO {
//	private String mem_id;
//	private String grade_id;
//	private String company_id;
//	private String dept_id;
//	private String mem_name;
//	private String mem_phone;
//	private String mem_mail;
//	private String mem_gender;
//	private String mem_birth;
//	private String mem_addr;
//	private int mem_sal;
//	private String mem_pwd;
//	private String mem_con_start;
//	private String mem_con_end;
//	private String mem_dcon_start;
//	private String mem_dcon_end;
//	private boolean enabled;
	
	
	// 태현
   private String mem_id;
   private String grade_id;
   private String company_id;
   private String dept_id;
   private String mem_name;
   private String mem_phone;
   private String mem_mail;
   private String mem_gender;
   
   @DateTimeFormat(pattern = "yyyy-MM-dd")
   private Date mem_birth;
   
   private String mem_addr;
   private int mem_sal;
   private String mem_pwd;
   
   @DateTimeFormat(pattern = "yyyy-MM-dd")
   private Date mem_con_start;
   @DateTimeFormat(pattern = "yyyy-MM-dd")
   private Date mem_con_end;
   @DateTimeFormat(pattern = "yyyy-MM-dd")
   private Date mem_dcon_start;
   @DateTimeFormat(pattern = "yyyy-MM-dd")
   private Date mem_dcon_end;
   private boolean enabled;
	
	
	// 직원 권한 정보 => 권한을 여러개 담기 위해 리스트로 담아서 가지고 있는 것인데
	// 우리는 한 사람 당 ROLE_USER 만 필요하기 때문에 리스트까진 필요 없지만
	// 리스트로 해도 상관없기 때문에 해볼 예정
	private List<AuthorityDTO> authorities;
}
