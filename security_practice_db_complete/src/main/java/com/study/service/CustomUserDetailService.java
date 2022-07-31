package com.study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.study.dto.CustomUser;
import com.study.dto.MemDTO;
import com.study.mapper.AdminUserControlMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CustomUserDetailService implements UserDetailsService {
	
	@Autowired
	private AdminUserControlMapper mapper;
	

	@Override // 넘길 때 user 자체를 못 넘김 => return 할 때 UserDetails 로 넘겨야 함
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("mem_id 정보" + username);
		
		//로그인 정보 담기
		MemDTO user = mapper.login(username);
		
		log.info("인증 정보 "+user);
		
		return new CustomUser(user);
	}

}
