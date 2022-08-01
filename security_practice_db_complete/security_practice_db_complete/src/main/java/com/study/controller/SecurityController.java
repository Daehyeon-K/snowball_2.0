package com.study.controller;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.dto.CriteriaDTO;
import com.study.dto.CustomUser;
import com.study.dto.MemDTO;
import com.study.dto.MemoDTO;
import com.study.dto.MsgDTO;
import com.study.dto.PageDTO;
import com.study.service.AdminUserControlService;
import com.study.service.MemoService;
import com.study.service.MsgService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SecurityController {
	
	// 1. 메인 페이지 - 쪽지
	@Autowired
	private MsgService msgService;
	
	// 2. 메인 페이지 - 메모
	@Autowired
	private MemoService memoService;
	
	
	// 3. 인코드 도입하기
	@Autowired 
    private PasswordEncoder encoder;
	
	// 여기도 사용해야해서 - 비밀번호 변경
	@Autowired
	private AdminUserControlService controlService;
	
	
	
	@GetMapping("/login")
	public void login() {
		log.info("로그인 폼 요청");
	}
	
	
	// 로그인 에러 시 /loginError 로 이동시켜주기
	@GetMapping("/loginError")
	public String loginError(Model model) {
		log.info("로그인 틀림");
		model.addAttribute("loginError", "아이디나 비밀번호를 확인하세요.");
		return "login";
	}
	
	@GetMapping("/access-denied")
	public String accessDenied() {
		log.info("접근제한");
		return "accessdenied";
	}
	

	
	
	
	
	// 사용자 main 페이지
	@GetMapping("/user/index")
	public String userPage(Model model,Principal principal, @ModelAttribute("cri") CriteriaDTO cri) {
		log.info("user page 요청");
		log.info("쪽지리스트 요청");
		log.info("캘린더도 추가");
		log.info("메모도 추가");
		log.info("사용자 아이디 : "+principal.getName());
		
		List<MsgDTO> mList = msgService.mSelect(principal.getName(), cri.getPageNum(),cri.getAmount());
		int total = msgService.totalCnt(cri,principal.getName());
		
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("mList", mList);
		
		// 메모 읽어들이기 => 시큐리티 정보 아이디로 불러오기
		MemoDTO memoRead = memoService.memoReadRow(principal.getName()); // 로그인한 사람 거
		model.addAttribute("memoRead", memoRead);  // 로그인 한 사람의 메모 보여주기
		
		return "user";
	}
	
	// 사용자 main 페이지 => 메모 때문에 post 부분 처리
	@PostMapping("/user/index")
	public String memoUpdate(String memo_content,Principal principal) { 
		log.info("메모 수정 요청 ");
		memoService.memoUpdate(memo_content,principal.getName()); // 메모 수정 후 메인페이지 이동
		return "redirect:/user/index";
	}
	
	// 사용자 main 페이지 - 쪽지 부분
	@PostMapping("/user/msg/msgList")
	public String msgListPost(@RequestParam("msg_id") String msg_id, RedirectAttributes rttr) {
		log.info("메세지 리스트를 보내기");
		rttr.addAttribute("msg_id", msg_id);
		return "redirect:/user/msg/msgRead";
	}
	
	
	@GetMapping("/user/msg/msgRead")
	public String msgReadGet(String msg_id, Model model) {
		log.info("쪽지 내용 확인 요청");
		MsgDTO mRead = msgService.msgReadRow(msg_id);
		model.addAttribute("mRead", mRead);
		model.addAttribute("msg_id",msg_id);
		return "/user/msg/msg_read"; //read.jsp 보여주기
	}
	
	@GetMapping("/user/msg/msgInsert")
	public String msgInsertGet() {
		log.info("insert form 요청");
		return "/user/msg/msg_insert"; //메모 인서트 jsp 보여주기
	}
	
	@PostMapping("/user/msg/msgInsert")
	public String msgInsertPost(MsgDTO insertDto, Principal principal) {
		log.info("insert 확인");
		
		msgService.msgInsert(principal.getName(),insertDto.getReceiver_id(), insertDto.getMsg_content());
		
		return "redirect:/user/index";
		
	}
	
	@PostMapping("/user/msg/msgDelete")
	public String msgDelete(String msg_id, RedirectAttributes rttr) {
		log.info("delete 확인 요청");
		msgService.msgDelete(msg_id);
		return "redirect:/user/index";
	}
	
	
	
	
	
	
	
	
	
	// 비밀번호 변경하기
	@GetMapping("/pwdChange")
    public void pwdChangeGet() {
		log.info("비밀번호 변경 jsp");
    }

//    @PostMapping("/pwdChange")
//    public String pwdChange(String mem_pwd, Principal principal, RedirectAttributes rttr) {
//     
//    	log.info("비밀번호 바꾸기 => 현재 정보 : "+mem_pwd + principal.getName());
//    	
////    	controlService.pwdChange(changePwd);
//    	
//        return "redirect:/";
//    }

	
}













