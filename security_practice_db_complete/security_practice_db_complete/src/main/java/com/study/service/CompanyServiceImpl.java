package com.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.dto.CompanyDTO;
import com.study.mapper.CompanyMapper;


@Service
public class CompanyServiceImpl implements CompanyService {

   @Autowired
   private CompanyMapper companyMapper;
   
   @Override
   public List<CompanyDTO> select() {
      return companyMapper.select();
   }

   @Override
   public boolean register(CompanyDTO registerDto) {
      
      return companyMapper.register(registerDto) == 1?true:false;
   }

   @Override
   public CompanyDTO read(String company_id) {
      return companyMapper.read(company_id);
   }

   @Override
   public boolean delete(@RequestParam("company_id") String company_id) {
      
      return companyMapper.delete(company_id) == 1?true:false;
   }

   @Override
   public boolean modify(CompanyDTO modifyDto) {
      
      return companyMapper.modify(modifyDto)==1?true:false;
   }



}