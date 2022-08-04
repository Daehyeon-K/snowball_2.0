package com.study.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/error")
public class ErrorController {
	
	// 오류 페이지 작성
	@GetMapping("/400")
	public String error400(HttpServletResponse res, Model model) {
		log.info("400 에러");
		model.addAttribute("code", "error_400");
		return "/error/400";
	}
	@GetMapping("/404")
	public String error404(HttpServletResponse res, Model model) {
		log.info("404 에러");
		model.addAttribute("code", "error_404");
		return "/error/404";
	}
	@GetMapping("/405")
	public String error405(HttpServletResponse res, Model model) {
		log.info("405 에러");
		model.addAttribute("code", "error_405");
		return "/error/405";
	}
	@GetMapping("/500")
	public String error500(HttpServletResponse res, Model model) {
		log.info("500 에러");
		model.addAttribute("code", "error_500");
		return "/error/500";
	}
		
	
}
