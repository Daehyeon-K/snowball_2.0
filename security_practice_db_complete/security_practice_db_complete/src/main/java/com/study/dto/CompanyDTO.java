package com.study.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompanyDTO {
	 private String company_id;
	 private String company_name;
	 private String company_phone;
     private String company_addr;
     private String company_man;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	 private Date company_partner_start;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	 private Date company_partner_end;
}
