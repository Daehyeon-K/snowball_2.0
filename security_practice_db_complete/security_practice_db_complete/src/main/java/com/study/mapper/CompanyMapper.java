package com.study.mapper;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.study.dto.CompanyDTO;

public interface CompanyMapper {
   public List<CompanyDTO> select();
   public int register(CompanyDTO registerDto);
   public CompanyDTO read(String company_id);
   public int delete(String company_id);
   public int modify(CompanyDTO modifyDto);
   
}