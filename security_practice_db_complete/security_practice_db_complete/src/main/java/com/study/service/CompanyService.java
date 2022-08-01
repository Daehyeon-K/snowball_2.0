package com.study.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.study.dto.CompanyDTO;

public interface CompanyService {
   public List<CompanyDTO> select();
   public boolean register(CompanyDTO registerDto);
   public CompanyDTO read(String company_id);
   public boolean delete(String company_id);
   public boolean modify(CompanyDTO modifyDto);
}