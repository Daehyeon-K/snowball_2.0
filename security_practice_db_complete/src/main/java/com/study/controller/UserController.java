package com.study.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.dto.ApprovalCommitDTO;
import com.study.dto.ApprovalDTO;
import com.study.dto.ApprovalFileDTO;
import com.study.dto.AttDTO;
import com.study.dto.BoardDTO;
import com.study.dto.CommuteDTO;
import com.study.dto.CompanyDTO;
import com.study.dto.CriteriaDTO;
import com.study.dto.MailDTO;
import com.study.dto.MemGradeDTO;
import com.study.dto.PageDTO;
import com.study.dto.ReplyDTO;
import com.study.dto.ReplyPageDTO;
import com.study.service.ApprovalService;
import com.study.service.BoardService;
import com.study.service.CommuteService;
import com.study.service.CompanyService;
import com.study.service.DispatchService;
import com.study.service.HrService;
import com.study.service.MailService;
import com.study.service.MemoService;
import com.study.service.MsgService;
import com.study.service.ReplyService;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Slf4j
@RequestMapping("/user/*")
public class UserController {
	
	// 1. 사용자 - 결재 서비스
	@Autowired
	private ApprovalService approvalService;
	
	// 2. 사용자 - 업무지원 - 파견 - 전체 직원 근태리스트
	@Autowired
	private DispatchService dispatchService;
	
	
	// 3. 사용자 - 업무지원 - 파견(+인사) - 한 직원 근태리스트
	@Autowired
	private CommuteService commuteService;
	
	
	// 4. 사용자 - 업무지원 - 인사 - 전체 직원 근태리스트
	@Autowired
	private HrService hrService;
	
	// 5. 사용자 - 게시물
	@Autowired
	private BoardService boardService;
	
	
	// 6. 사용자 - 댓글
	@Autowired
	private ReplyService replyService;
	
	
	// 7. 사용자 - 이메일 전송 제외한 리스트 조회, 읽기모드만 권한 주기
	@Inject
	MailService mailService;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 결재 부분부터
	//사용자 - 결재 추가
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/approvalInsert")
	public String userApprovalInsert(Model model) {
		log.info("사용자가 결재 기안하기");
		
		List<MemGradeDTO> interMan = approvalService.getInterMan();
	      log.info("중간승인권자들 불러오기 희희");
	      model.addAttribute("interMan",interMan);
	      
	      List<MemGradeDTO> finalMan = approvalService.getFinalMan();
	      log.info("최종승인권자들 불러오기 희희");
	      model.addAttribute("finalMan",finalMan);
		
		return "/user/approval/approval_insert";
	}
	
	// 사용자 - 결재 추가 POST 부분
	//@PreAuthorize("isAuthenticated()")
	@PostMapping("/approvalInsert")
	public String registerPost(ApprovalDTO insertDto, MultipartFile[] uploadFile) {
	      log.info("기안폼등록"+insertDto);
	      
	      
	      List<ApprovalFileDTO> attachList = new ArrayList<ApprovalFileDTO>();
	      
	      // 업로드 기본 폴더 지정
	      String uploadBasicPath = "d:\\upload";
	      
	      // 업로드 세부 폴더 지정 / 날짜 기준으로 나눠주는 
	      String uploadFolderPath = getFolder();
	      
	      // 전체 업로드 패스 생성 / 파일 객체 생성 / "d:\\upload\\2022\06\08"
	      File uploadPath = new File(uploadBasicPath,uploadFolderPath);
	      
	      if(!uploadPath.exists()) { // 폴더가 없다면 폴더들 생성
	         uploadPath.mkdirs();
	      }
	      
	      String uploadFileName = "";
	      File save = null;
	      
	      for(MultipartFile f : uploadFile) {
	         log.info("파일명 : " + f.getOriginalFilename());
	         log.info("파일크기 : " + f.getSize());
	         
	         // 파일명 가져오기
	         String oriFileName = f.getOriginalFilename();
	         
	         //중복 파일명 해결하기
	         UUID uuid = UUID.randomUUID();
	         uploadFileName = uuid.toString()+"_"+oriFileName;
	         
	         //업로드 파일 객체 생성
	         ApprovalFileDTO fileDto = new ApprovalFileDTO();
	         fileDto.setApproval_file_dir(uploadFolderPath);
	         fileDto.setApproval_file_name(oriFileName);
	         fileDto.setApproval_file_id(uuid.toString());
	         
	
	         save = new File(uploadPath, uploadFileName);
	         try {      
	            if(checkImageType(save)) {
	               fileDto.setApproval_file_type(true);
	               
	               
	            //썸네일 저장
	            FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
	            InputStream in = f.getInputStream();
	            Thumbnailator.createThumbnail(in, thumbnail, 80, 80);
	            in.close();
	            thumbnail.close();
	            }
	            // 파일저장
	            f.transferTo(save);
	            
	            attachList.add(fileDto);
	            
	            
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
      }
      
      
      //첨부파일 정보 추가하기
      insertDto.setAttachList(attachList);
      
      
      approvalService.insert(insertDto);
      return "redirect:/user/approvalList";
	}
  	 // 결재 기안 끝
	
	
	// 썸네일 부분 - 메소드 사용
	// 썸네일 이미지 보여주기
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName) {
      log.info("이미지 요청" + fileName);
      
      File file = new File("d:\\upload\\"+fileName);
      
      ResponseEntity<byte[]> image = null;
      
      HttpHeaders header = new HttpHeaders();
      try {
         header.add("Content-Type", Files.probeContentType(file.toPath()));
         image = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
      
      } catch (IOException e) {
         e.printStackTrace();
      }
      return image;
   } // 썸네일 끝
   
   
    // 다운로드 부분
    // 다운로드
  	@GetMapping(path = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
  	public ResponseEntity<Resource> downloadFile(String fileName){
	     log.info("다운로드 요청 " + fileName);
	     
	     Resource resource = new FileSystemResource("d:\\upload\\" + fileName);
	     String resourceUidName = resource.getFilename();
	     //uuid 값 제거
	     String resourceName = resourceUidName.substring(resourceUidName.indexOf("_")+1);
	     
	     //Spring 객체 >> headers 추가 
	     HttpHeaders headers = new HttpHeaders();
	     
	     try {
	        headers.add("Content-Disposition", "attachment;filename=" + new String(resourceName.getBytes("utf-8"), "ISO-8859-1"));
	     } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	     }
	     
	     return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	} // 다운로드 끝
  	
  	
  	// 이미지 파일 확인
    private boolean checkImageType(File file) {
        try {
           String contentType = Files.probeContentType(file.toPath());
           return contentType.startsWith("image"); // image/jepg, image/gif, image/bmp, image/png
        } catch (IOException e) {
           e.printStackTrace();
        }
        return false;
     } // 이미지 끝
    
    
    // 폴더 생성 메소드
    private String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        // 오늘 날짜
        Date date = new Date();
        
        String str = sdf.format(date); // 2022-06-08
        
        // windows: \, unix: /
        return str.replace("-", File.separator); // 2022\06\08 = getFolder
     } // 폴더 생성 끝
    
    
    
    
    
    // 결재 리스트 부분
  	@GetMapping("/approvalList")
  	public String listGet(Model model, @ModelAttribute("cri") CriteriaDTO cri, Principal principal) {
        log.info("전체리스트현황 - cri: "+cri);
        
        String mem_id=principal.getName();
        log.info("mem_id: "+mem_id);
        /*String[] typeArr = {};*/
        List<ApprovalDTO> list = approvalService.select(cri,mem_id/*, typeArr*/);
        List<ApprovalCommitDTO> commitList = new ArrayList<ApprovalCommitDTO>();
        for (ApprovalDTO x:list) {
           commitList.add(approvalService.commitRead(x.getApproval_commit_id()));
        }

        int total = approvalService.totalCnt(cri,mem_id/*, typeArr*/);
        model.addAttribute("pageDto", new PageDTO(cri, total));
        model.addAttribute("list", list);
        model.addAttribute("commitList", commitList);
        
        return "/user/approval/approval_list";
  	}// 결재 리스트 끝
  	
  	
  	// 결재 수신 리스트 부분
    @GetMapping("/approvalCommitList")
     public String commitListGet(Model model, @ModelAttribute("cri") CriteriaDTO cri, Principal principal) {
       log.info("전체리스트현황 - cri: "+cri);
       
       String mem_id=principal.getName();
       log.info("mem_id: "+mem_id);
       /*String[] typeArr = {};*/
       List<ApprovalDTO> list = approvalService.commitSelect(cri,mem_id/*, typeArr*/);
       List<ApprovalCommitDTO> commitList = new ArrayList<ApprovalCommitDTO>();
       for (ApprovalDTO x:list) {
          commitList.add(approvalService.commitRead(x.getApproval_commit_id()));
       }

       int total = approvalService.totalCnt(cri,mem_id/*, typeArr*/);
       model.addAttribute("pageDto", new PageDTO(cri, total));
       model.addAttribute("list", list);
       model.addAttribute("commitList", commitList);
       
       return "/user/approval/approval_commit_list";
    } // 결재 수신 리스트 끝
  	
  	
  	
  	
  	// 첨부 파일 부분
  	@GetMapping("/getAttachList")
    public ResponseEntity<List<ApprovalFileDTO>> getAttachList(String approval_id) {
       log.info("첨부파일 "+approval_id);
          
       approvalService.attachList(approval_id);
          
       return new ResponseEntity<List<ApprovalFileDTO>>(approvalService.attachList(approval_id) ,HttpStatus.OK);
    } // 첨부파일 끝
  	
  	
  	// 결재 하나 불러오기 - READ
    @GetMapping("/approvalRead")
    public String readGet(Model model, String approval_id, String approval_commit_id, @ModelAttribute("cri") CriteriaDTO cri) {
       log.info("게시물 요청"+approval_id);
       
       ApprovalDTO dto =  approvalService.read(approval_id);
       ApprovalCommitDTO commitDto = approvalService.commitRead(approval_commit_id);
       model.addAttribute("dto",dto);
       model.addAttribute("commitDto",commitDto);
       
       return "/user/approval/approval_read";
    }
    
    
    // 결재 하나 불러오기 - READ (수신용)
    @GetMapping("/approvalCommitRead")
    public String commitReadGet(Model model, String approval_id, String approval_commit_id, @ModelAttribute("cri") CriteriaDTO cri) {
       log.info("게시물 요청"+approval_id);
       
       ApprovalDTO dto =  approvalService.read(approval_id);
       ApprovalCommitDTO commitDto = approvalService.commitRead(approval_commit_id);
       model.addAttribute("dto",dto);
       model.addAttribute("commitDto",commitDto);
       
       return "/user/approval/approval_commit_read";
    }
    
 // 결재 수신 - 승인
    @PostMapping("/approvalCommit")
    public String approvalCommit(Model model, String approval_commit_id, String approval_inter_id,String approval_final_id, Principal principal){
       log.info("결재 승인 @@@@@@@@@@@@@@");
       String user_id = principal.getName();
       String interFlag = approvalService.commitRead(approval_commit_id).getApproval_commit_inter_check();
       String finalFlag = approvalService.commitRead(approval_commit_id).getApproval_commit_final_check();
       if (interFlag.equals("중간반려")||finalFlag.equals("최종반려")) {
          log.info("이미 반려 됐는디?");
          return "redirect:/user/approvalCommitList";
       }
       
       if (user_id.equals(approval_inter_id)) {
          approvalService.approvalInterCommit(approval_commit_id);
          log.info("중간승인 성공 @@@@@@@@@@@@@@");
       }
       else if (user_id.equals(approval_final_id)) {
          String inter_chk = approvalService.commitRead(approval_commit_id).getApproval_commit_inter_check();
          if (inter_chk.equals("중간미승인")||inter_chk.equals("중간반려")) {
             log.info("중간승인 안되었어요~");
             return "redirect:/user/approvalCommitList";
          }
          // 중간 승인 필요 하다고 할지 아니면 최종에서 바로 된거라 할 지
          // 중간 승인 필요하면 여기에 조건문 + return으로 jsp 하나 만들어 내보내주면 됨
          // 승인 이후 반려 안되게도 해야 할 듯
          approvalService.approvalFinalCommit(approval_commit_id);
          log.info("최종승인 성공 @@@@@@@@@@@@@@");
       }
       
       return "redirect:/user/approvalCommitList";
    }
    
    // 결재 수신 - 반려
    @PostMapping("/approvalReject")
    public String approvalReject(Model model, String approval_commit_id, String approval_inter_id,String approval_final_id, String approval_reject, Principal principal){
       log.info("결재 반려 @@@@@@@@@@@@@@");
       String user_id = principal.getName();
       String interFlag = approvalService.commitRead(approval_commit_id).getApproval_commit_inter_check();
       String finalFlag = approvalService.commitRead(approval_commit_id).getApproval_commit_final_check();
       if (interFlag.equals("중간승인")||finalFlag.equals("최종승인")) {
          log.info("이미 승인 됐는디?");
          return "redirect:/user/approvalCommitList";
       }
       
       if (user_id.equals(approval_inter_id)) {
          approvalService.approvalInterReject(approval_commit_id);
          approvalService.approvalInterRejectContent(approval_commit_id, approval_reject);
          log.info("중간반려 성공 @@@@@@@@@@@@@@");
       }
       else if (user_id.equals(approval_final_id)) {
          String inter_chk = approvalService.commitRead(approval_commit_id).getApproval_commit_inter_check();
          if (inter_chk.equals("중간미승인")||inter_chk.equals("중간반려")) {
             log.info("중간승인 안되었어요~");
             return "redirect:/user/approvalCommitList";
          }
          // 중간 승인 필요 하다고 할지 아니면 최종에서 바로 된거라 할 지
          // 중간 승인 필요하면 여기에 조건문 + return으로 jsp 하나 만들어 내보내주면 됨
          approvalService.approvalFinalReject(approval_commit_id);
          approvalService.approvalFinalRejectContent(approval_commit_id, approval_reject);
          log.info("최종반려 성공 @@@@@@@@@@@@@@");
       }
       
       return "redirect:/user/approvalCommitList";
    }
    
  	///////////////////////////////////////////////////// 결재 부분 끝 //////////////////////////////////////////////////////////////////////////////////////
  	
    
    
    
    
    
    
    
	///////////////////////////////////////////////////// 업무지원 시작 ////////////////////////////////////////////////////////////////////////////////////////
	
    // 파견 - 전체 직원 근태리스트
    @GetMapping("/support/dispatch/att")
    public void dispatchList(Model model,@ModelAttribute("cri") CriteriaDTO cri) {
       log.info("파견직원리스트 요청");
       
       List<AttDTO> hrlist = dispatchService.hrList(cri);
       
       int total = dispatchService.totalCnt(cri);
       
       model.addAttribute("pageDto", new PageDTO(cri, total));
       model.addAttribute("hrlist", hrlist);
    }
    
    @PostMapping("/supprot/dispatch/att")
    public String dispatchListPost(@RequestParam("att_id") String att_id, Model model, RedirectAttributes rttr) {
    
       log.info("근태리스트 요청");
       
       rttr.addAttribute("att_id",att_id);
       model.addAttribute("att_id",att_id);
       
       return "redirect:/user/support/dispatch/attlist";
    }
    
    // 파견 - 직원 한 명 근태리스트
    @GetMapping("/support/dispatch/attlist")
    public void dispatchAttList(@RequestParam("att_id") String att_id, Model model) {
       
       log.info("근태리스트 요청"+att_id);
       
       List<CommuteDTO> comlist = commuteService.readCommute(att_id);
       model.addAttribute("comlist",comlist);
    }   

 
    
    // 인사 - 직원 리스트
    @GetMapping("/support/hr/att")
    public void hrList(Model model,@ModelAttribute("cri")CriteriaDTO cri) {
       log.info("인사직원리스트 요청");
       
       List<AttDTO> hrlist = hrService.hrList(cri);
       int total = hrService.totalCnt(cri);
       
       model.addAttribute("pageDto", new PageDTO(cri, total));
       
       model.addAttribute("hrlist", hrlist);
    }
    
    @PostMapping("/support/hr/att")
    public String hrListPost(@RequestParam("att_id") String att_id, Model model, RedirectAttributes rttr) {
       log.info("aaaa");
       
       rttr.addAttribute("att_id",att_id);
       model.addAttribute("att_id",att_id);
       
       return "redirect:/user/support/hr/attlist";
       
    }

    @GetMapping("/support/hr/attlist")
    public void attList(@RequestParam("att_id") String att_id,Model model) {
       log.info("근태리스트 요청"+att_id);
       
       List<CommuteDTO> comlist= commuteService.readCommute(att_id);
       model.addAttribute("comlist", comlist);
    }
///////////////////////////////////////////////////// 업무지원 끝 ////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	
    
 ////////////////////////////////////////////////////메인페이지 시작////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // 메인 페이지는 SecurityController 에서 처리 => 결이 오빠 거는 끝
    
 ////////////////////////////////////////////////////메인페이지 끝/////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    
    
    
    
    
    
    
 ////////////////////////////////////////////////////게시물 시작////////////////////////////////////////////////////////////////////////////////////////////////////////// 
    
    @GetMapping("/board/list")
    public void boardListGet(Model model, @ModelAttribute("cri") CriteriaDTO cri) {
       log.info("일단 list로 넘어옴");
       
       List<BoardDTO> boardList = boardService.selectBoardAll(cri);
       log.info("list 넣어줌");

       int total = boardService.totalCnt(cri);

       model.addAttribute("pageDto", new PageDTO(cri, total));
       model.addAttribute("boardList", boardList);
       log.info("model에 넣어줌");
    }

    @GetMapping("/board/create")
    public void boardcGet() {
       log.info("create 요청");
    }

    @PostMapping("/board/create")
    public String boardcPost(BoardDTO insertDto) {
       log.info("create post 요청");
       
       boardService.create(insertDto);
       
       return "redirect:/user/board/list";
    }

    @GetMapping({"/board/readrow","/board/modify"})
       public void readGet(String board_id,@ModelAttribute("cri") CriteriaDTO cri,Model model) {
          log.info("게시물 요청 "+board_id);
          log.info("게시물 요청 "+cri);
          
          BoardDTO dto = boardService.getRow(board_id);
          model.addAttribute("dto", dto);
       }
    
    @PostMapping("/board/modify")
    public String modify(BoardDTO updateDto, @ModelAttribute("cri") CriteriaDTO cri, RedirectAttributes rttr) {
       log.info("수정 완료" + updateDto);
       
       boardService.modify(updateDto);
       
       //수정 성공
       rttr.addAttribute("board_id", updateDto.getBoard_id());
       rttr.addAttribute("pageNum", cri.getPageNum());
       rttr.addAttribute("amount", cri.getAmount());   
       rttr.addAttribute("type", cri.getType());
       rttr.addAttribute("keyword", cri.getKeyword());
       
       return "redirect:/user/board/readrow";
    }
    
    @GetMapping("/board/delete")
    public String delete(String board_id) {
       log.info("게시물 삭제");
       
       boardService.delete(board_id);
    
    
       return "redirect:/user/board/list";
       
    }
////////////////////////////////////////////////////게시글 끝/////////////////////////////////////////////////////////////////////////////////////////////////////////    
    
    
    
    
    
    
    
    
    
    
    
    
    ////////////////////////////////////////////////////댓글 시작/////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    @PostMapping(path = "/replies/new")
    public ResponseEntity<String> create(@RequestBody Principal principal,String board_id, String reply_content){
       log.info("댓글 삽입 요청 "+board_id+principal.getName()+reply_content);
       
       return replyService.replyInsert(principal.getName(),board_id,reply_content)?new ResponseEntity<String>("success", HttpStatus.OK):
          new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    // 댓글 하나 가져오기 - /replies/rno + GET 
    // 성공시 ReplyDTO + 200   
    @GetMapping("/replies/{reply_id}")
    public ResponseEntity<ReplyDTO> get(@PathVariable("reply_id") String reply_id){
       log.info("댓글 가져오기 "+reply_id);
       return new ResponseEntity<ReplyDTO>(replyService.replyRow(reply_id), HttpStatus.OK);
    }
    
    // 댓글 수정 - /replies/1 + PUT + body(수정내용-json)
    // 성공시 success + 200, 실패시 fail + 500
    //@RequestMapping(path = "/{rno}", method = {RequestMethod.PUT,RequestMethod.PATCH})
    @PutMapping("/replies/{reply_id}")
    public ResponseEntity<String> create(@PathVariable("reply_id") String reply_id,@RequestBody ReplyDTO updateDto){
       
       log.info("댓글 수정 요청 "+updateDto);   
       
       updateDto.setReply_id(reply_id);      
       
       return replyService.replyUpdate(updateDto)?new ResponseEntity<String>("success", HttpStatus.OK):
          new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    // 댓글삭제 : /replies/rno + Delete
    // 성공시 success + 200, 실패시 fail + 500
    @DeleteMapping("/replies/{reply_id}")
    public ResponseEntity<String> remove(@PathVariable("reply_id") String reply_id){
       
       log.info("댓글 삭제 요청 "+ reply_id);         
       
       return replyService.replyDelete(reply_id)?new ResponseEntity<String>("success", HttpStatus.OK):
          new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    //댓글 리스트 : /replies/pages/bno/page + GET
    //성공시 댓글 리스트
    // http://localhost:9090/replies/pages/500/1
    @GetMapping("/replies/pages/{board_id}/{page}")
    public ResponseEntity<ReplyPageDTO> getList(@PathVariable("board_id") String board_id,@PathVariable("page") int page){
       log.info("댓글 리스트 요청 board_id="+board_id+", page = "+page);
       
       CriteriaDTO cri = new CriteriaDTO(page, 10);
       
       return new ResponseEntity<ReplyPageDTO>(replyService.getList(cri, board_id), HttpStatus.OK);
    }
////////////////////////////////////////////////////댓글 끝/////////////////////////////////////////////////////////////////////////////////////////////////////////    
    
    
    
    
    
    
    
    
    
///////////////////////////////////////////////////////////////////////////사용자에게는 메일 리스트-읽기만 가능해야하기 때문에 메일 전송은 adminController 에서////////////////////////////////////
    

    @GetMapping("/email/noticeList")
	   public String list(MailDTO mailDto,Model model) {
	      
	      log.info("공지 메일 리스트 요청");
	      
	      List<MailDTO> list = mailService.select(mailDto);
	      log.info("공지 메일 리스트를 받아서 리스트안에 담기");
	      
	      model.addAttribute("notice_list", list);
	      log.info("공지 메일 리스트를 담은 리스트를 --> notice_list로");
	      return "/user/email/notice_list"; //jsp 보여주기
	   }
    
	   
	   @GetMapping("/email/noticeRead")
	   public String readEmail(String mail_id, Model model) {
	      log.info("id로 공지 폼 읽기");
	      
	      MailDTO noticeRead = mailService.read(mail_id);
	      
	      model.addAttribute("noticeRead", noticeRead);
	      
	      return "/user/email/notice_read";
	   }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	
}
