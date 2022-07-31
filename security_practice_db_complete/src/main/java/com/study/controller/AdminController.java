package com.study.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.dto.ApprovalDTO;
import com.study.dto.CompanyDTO;
import com.study.dto.CriteriaDTO;
import com.study.dto.MailDTO;
import com.study.dto.MemDTO;
import com.study.dto.PageDTO;
import com.study.service.AdminUserControlService;
import com.study.service.ApprovalService;
import com.study.service.CompanyService;
import com.study.service.MailService;
import com.study.service.UserListService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/*")
public class AdminController {
	
	// 관리자가 사용자를 회원가입시켜주고 권한 부여해주고 리스트도 확인하기 위한 서비스 주입 - 사용자 관리
	@Autowired
	private AdminUserControlService controlService;
	
	// 페이지 나누기 서비스
	@Autowired
	private UserListService listService;
	
	// 관리자 - 원청 관리
	@Autowired
	private CompanyService companyService;
	
	
	// 관리자 - 이메일 전체 전송 => 이메일 전송 부분만
	@Inject
	MailService mailService;
	
	
	
	
	
	
	//관리자 - 직원 리스트
	@GetMapping("/mem/memList")
	public String adminMemList(Model model, @ModelAttribute("cri") CriteriaDTO cri) {
		log.info("관리자가 사용자 리스트 확인");
		
		List<MemDTO> mem = controlService.userList(cri);
		
		//전체 게시물 수 구하기
		int total = controlService.totalCnt(cri);
		
		model.addAttribute("pageDto", new PageDTO(cri, total));
        model.addAttribute("mem", mem);
		
		return "/admin/mem/mem_list";
	}
	
	
	//관리자 - 직원 추가 => 회원가입 부분
	@GetMapping("/mem/memInsert")
	public String userInsertGet() {
		log.info("관리자가 사용자 추가해주기");
		return "/admin/mem/mem_insert";
	}
	
	
	// 직원 추가하는 폼 처리하기 => 회원가입 부분!!!!! insertUser
	@PostMapping("/mem/memInsert")
	public String userInsert(MemDTO user) {
		log.info("직원 추가하기(회원가입)" + user);
		
		if(controlService.userInsert(user)) {
			return "redirect:/admin/mem/memList";
		}
		return "redirect:/admin/mem/memInsert";
	}
	
	
	
	
	   // 사용자 - 태현
//	   @PostMapping("/mem/memDelete")
//	   public String listPost(String mem_id,RedirectAttributes rttr) {
//	      rttr.addAttribute("mem_id",mem_id);
//	      
//	      return"redirect:/admin/mem/memRemove";
//	   }
	   
	   @GetMapping({"/mem/memRead","/mem/memModify"})
	   public void readGet(String mem_id, Model model) {
	      log.info("게시물 요청 "+mem_id);
//	      log.info("게시물 요청 "+cri);
	      
	      MemDTO dto = controlService.getRow(mem_id);
	      model.addAttribute("dto", dto);
	   }
	   
	   @PostMapping("/mem/memUpdate")
	   public String modify(MemDTO updateDto, RedirectAttributes rttr) {
	      log.info("게시물 수정 요청 "+updateDto);
//	      log.info("게시물 수정 요청 - cri "+cri);
	      
	      controlService.update(updateDto);
	      
	      //수정 성공
	      rttr.addAttribute("mem_id", updateDto.getMem_id());
//	      rttr.addAttribute("pageNum", cri.getPageNum());
//	      rttr.addAttribute("amount", cri.getAmount());   
//	      rttr.addAttribute("type", cri.getType());
//	      rttr.addAttribute("keyword", cri.getKeyword());
	      return "redirect:/admin/mem/memRead";
	   }
	   
	   @PostMapping("/mem/memRemove")
	   public String remove(String mem_id, RedirectAttributes rttr) {
	      log.info("게시물 삭제 요청 "+mem_id);
//	      log.info("게시물 삭제 요청-cri "+cri);
	      
	      
	      //DB작업 - 게시글 삭제 + 첨부파일 삭제 + 댓글 삭제
	      controlService.delete(mem_id);
	      
	      // 주소줄에 딸려보내는 방식
//	      rttr.addAttribute("pageNum", cri.getPageNum());
//	      rttr.addAttribute("amount", cri.getAmount());
//	      rttr.addAttribute("type", cri.getType());
//	      rttr.addAttribute("keyword", cri.getKeyword());
	      // 세션을 이용하는 방식
	      rttr.addFlashAttribute("result", "success");
	      
	      return "redirect:/admin/mem/memList";
	   }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////////////////////////원청 시작/////////////////////////////////////////////////////////////////////////////////////////////////////////    
	
	@GetMapping("/company/companyList")
	public void list(Model model) {
		log.info("원청 전체 리스트 요청");
		
		List<CompanyDTO> list = companyService.select();
		log.info("원청 전체 리스트 받아와서 담기");
		
		model.addAttribute("company_list", list);
		log.info("원청 전체 리스트 모델에 담기");
	}
	
	@PostMapping("/company/companyList")
	public String listPost(@RequestParam("company_id") String company_id,Model model, RedirectAttributes rttr) {
		log.info("원청 전체 리스트 요청 POST");
		
		rttr.addFlashAttribute("company_id", company_id);
		model.addAttribute("company_id", company_id);
		return "redirect:/admin/company/companyRead";
	}
	
	@GetMapping({"/company/companyRead","/company/companyModify"})
	public void read(String company_id, Model model) {
		log.info("company_id로 읽어오기"+company_id);
		
		CompanyDTO compDto = companyService.read(company_id);
		log.info("compDto start"+compDto.getCompany_partner_start());
		log.info("compDto end"+compDto.getCompany_partner_end());
		model.addAttribute("compDto", compDto);
		log.info("company_dto 만들기"+compDto);
	}
	
	@GetMapping("/company/companyRegister")
	public String register() {
		log.info("등록 폼 요청");
		return "/admin/company/companyRegister";
	}
	
	@PostMapping("/company/companyRegister")
	public String register(CompanyDTO registerDto) {
		log.info("원청 등록 폼 요청"+registerDto);
	
		companyService.register(registerDto);
	
	
		// register 등록 성공 시 list로
		return "redirect:/admin/company/companyList";
	
	}
	
	@GetMapping("/company/companyDelete")
	public String delete(@RequestParam("company_id") String company_id, RedirectAttributes rttr,Model model) {
		log.info("원청 삭제 요청");
		
		model.addAttribute("company_id",company_id);
		rttr.addAttribute("company_id", company_id);
		
		companyService.delete(company_id);
		
		// delete 성공 시, list로
		return "redirect:/admin/company/companyList";
	}
	
	
	@PostMapping("/company/companyUpdate")
	public String modifyPost(CompanyDTO compDto,RedirectAttributes rttr) {
		log.info("company_update post"+compDto);
		companyService.modify(compDto);
		log.info("수정 modify"+compDto);
		rttr.addAttribute("company_id", compDto.getCompany_id());
		log.info("redirect compid rttr");
		return "redirect:/admin/company/companyRead";
	}
	
////////////////////////////////////////////////////원청 끝/////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	
	
	
	
	
	
	
	
////////////////////////////////////////////////////메일 시작/////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	 @RequestMapping("/email/write.do") // 이메일 쓰기를 누르면 여기 메소드에서 매핑 됨
	   public String write() {
	      return "/admin/email/write"; // 다시 write jsp 페이지로 이동하고 jsp페이지에서 내용을 다 채운 뒤에 확인 버튼을 누르면 send.do로 넘어감
	   }
	   
	   @PostMapping("/email/send.do") 
	   public String send(@ModelAttribute MailDTO mailDto, Model model) { // 발송 버튼을 누르면 매핑 되는 메소드
	      
	      log.info("email"+mailDto);
	      
	      MailDTO mailDtoDB = new MailDTO();
	      
	      try {
	         String[] receiver_list = {}; 
	         receiver_list = mailDto.getReceiver_id().split(",|, | , ");
	         for (String receiver_addr:receiver_list) {
	            MailDTO mailDto_temp = mailDto;
	            mailDto_temp.setReceiver_id(receiver_addr);
	            
	            mailDtoDB = mailService.EmailService(mailDto_temp);
	         }
	         mailService.emailToDB(mailDtoDB);
	         // 얘가 반복
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         model.addAttribute("message", "이메일 전송 실패"); // 이메일 발송 실패 시 전송될 메세지
	      }
	      return "redirect:/user/email/noticeList";
	   }

		/*
		 * @GetMapping("/email/noticeList") public String list(MailDTO mailDto,Model
		 * model) {
		 * 
		 * log.info("공지 메일 리스트 요청");
		 * 
		 * List<MailDTO> list = mailService.select(mailDto);
		 * log.info("공지 메일 리스트를 받아서 리스트안에 담기");
		 * 
		 * model.addAttribute("notice_list", list);
		 * log.info("공지 메일 리스트를 담은 리스트를 --> notice_list로"); return
		 * "/admin/email/notice_list"; }
		 * 
		 * @GetMapping("/email/noticeRead") public String readEmail(String mail_id,
		 * Model model) { log.info("id로 공지 폼 읽기");
		 * 
		 * MailDTO noticeRead = mailService.read(mail_id);
		 * 
		 * model.addAttribute("noticeRead", noticeRead);
		 * 
		 * return "/admin/email/notice_read"; }
		 */
	
	
	
	
	
	
	
	
	
	
	
	
	
}
