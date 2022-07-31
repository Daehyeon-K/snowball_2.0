package com.study.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;


@Component
@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	// 로그인 성공 후 기본으로 이동하는("/") 핸들러 대신에 설정해주기 

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		// 부여된 권한 확인하기
		List<String> roleNames = new ArrayList<String>();
		authentication.getAuthorities().forEach(auth -> roleNames.add(auth.getAuthority()));
		
		log.info("roleNames"+roleNames);
		
		// 권한이 ROLE_USER 인 경우
		if(roleNames.contains("ROLE_USER")) {
			response.sendRedirect("/user/index");
			return;
		}
		
		// 권한이 ROLE_ADMIN 인 경우
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/user/index");
			return;
		}
		
		
		// 권한이 없는 경우
		response.sendRedirect("/");
		
		
	}

}
