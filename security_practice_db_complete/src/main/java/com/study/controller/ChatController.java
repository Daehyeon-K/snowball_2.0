package com.study.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.study.dto.CustomUser;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {

	@GetMapping("/user/chatting/chat")
	public void chat(Model model) {
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + user.getUsername());
		
		model.addAttribute("userid", user.getUsername());
	}
}