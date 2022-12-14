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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.dto.ApprovalCommitDTO;
import com.study.dto.ApprovalDTO;
import com.study.dto.ApprovalFileDTO;
import com.study.dto.AttDTO;
import com.study.dto.BoardDTO;
import com.study.dto.BoardFileDTO;
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

	// 1. ????????? - ?????? ?????????
	@Autowired
	private ApprovalService approvalService;

	// 2. ????????? - ???????????? - ?????? - ?????? ?????? ???????????????
	@Autowired
	private DispatchService dispatchService;


	// 3. ????????? - ???????????? - ??????(+??????) - ??? ?????? ???????????????
	@Autowired
	private CommuteService commuteService;


	// 4. ????????? - ???????????? - ?????? - ?????? ?????? ???????????????
	@Autowired
	private HrService hrService;

	// 5. ????????? - ?????????
	@Autowired
	private BoardService boardService;


	// 6. ????????? - ??????
	@Autowired
	private ReplyService replyService;


	// 7. ????????? - ????????? ?????? ????????? ????????? ??????, ??????????????? ?????? ??????
	@Inject
	MailService mailService;
















	// ?????? ????????????
	//????????? - ?????? ??????
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/approvalInsert")
	public String userApprovalInsert(Model model) {
		log.info("???????????? ?????? ????????????");

		List<MemGradeDTO> interMan = approvalService.getInterMan();
		log.info("????????????????????? ???????????? ??????");
		model.addAttribute("interMan",interMan);

		List<MemGradeDTO> finalMan = approvalService.getFinalMan();
		log.info("????????????????????? ???????????? ??????");
		model.addAttribute("finalMan",finalMan);

		return "/user/approval/approval_insert";
	}
	
	@PostMapping("/approval/attach/create")
	public ResponseEntity<List<ApprovalFileDTO>> approvalAttachPost(MultipartFile[] uploadFile) {
		log.info("?????????????????? "+uploadFile.length);

		List<ApprovalFileDTO> attachList = new ArrayList<ApprovalFileDTO>();

		// ????????? ?????? ?????? ??????
		String uploadBasicPath = "c:\\upload";

		// ????????? ?????? ?????? ?????? / ?????? ???????????? ???????????? 
		String uploadFolderPath = getFolder();

		// ?????? ????????? ?????? ?????? / ?????? ?????? ?????? / "c:\\upload\\2022\06\08"
		File uploadPath = new File(uploadBasicPath,uploadFolderPath);

		if(!uploadPath.exists()) { // ????????? ????????? ????????? ??????
			uploadPath.mkdirs();
		}

		String uploadFileName = "";
		File save = null;

		for(MultipartFile f : uploadFile) {
			log.info("????????? : " + f.getOriginalFilename());
			log.info("???????????? : " + f.getSize());

			// ????????? ????????????
			String oriFileName = f.getOriginalFilename();

			//?????? ????????? ????????????
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString()+"_"+oriFileName;

			//????????? ?????? ?????? ??????
			ApprovalFileDTO fileDto = new ApprovalFileDTO();
			fileDto.setApproval_file_dir(uploadFolderPath);
			fileDto.setApproval_file_name(oriFileName);
			fileDto.setApproval_file_id(uuid.toString());


			save = new File(uploadPath, uploadFileName);
			try {      
				if(checkImageType(save)) {
					fileDto.setApproval_file_type(true);


					//????????? ??????
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
					InputStream in = f.getInputStream();
					Thumbnailator.createThumbnail(in, thumbnail, 80, 80);
					in.close();
					thumbnail.close();
				}
				// ????????????
				f.transferTo(save);

				attachList.add(fileDto);

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return new ResponseEntity<List<ApprovalFileDTO>>(attachList,HttpStatus.OK);
	}

	// ????????? - ?????? ?????? POST ??????
	//@PreAuthorize("isAuthenticated()")
	@PostMapping("/approvalInsert")
	public String registerPost(ApprovalDTO insertDto/*, MultipartFile[] uploadFile*/) {

		log.info("???????????????"+insertDto);

		/*
		 * List<ApprovalFileDTO> attachList = new ArrayList<ApprovalFileDTO>();
		 * 
		 * // ????????? ?????? ?????? ?????? String uploadBasicPath = "c:\\upload";
		 * 
		 * // ????????? ?????? ?????? ?????? / ?????? ???????????? ???????????? String uploadFolderPath = getFolder();
		 * 
		 * // ?????? ????????? ?????? ?????? / ?????? ?????? ?????? / "c:\\upload\\2022\06\08" File uploadPath = new
		 * File(uploadBasicPath,uploadFolderPath);
		 * 
		 * if(!uploadPath.exists()) { // ????????? ????????? ????????? ?????? uploadPath.mkdirs(); }
		 * 
		 * String uploadFileName = ""; File save = null;
		 * 
		 * for(MultipartFile f : uploadFile) { log.info("????????? : " +
		 * f.getOriginalFilename()); log.info("???????????? : " + f.getSize());
		 * 
		 * // ????????? ???????????? String oriFileName = f.getOriginalFilename();
		 * 
		 * //?????? ????????? ???????????? UUID uuid = UUID.randomUUID(); uploadFileName =
		 * uuid.toString()+"_"+oriFileName;
		 * 
		 * //????????? ?????? ?????? ?????? ApprovalFileDTO fileDto = new ApprovalFileDTO();
		 * fileDto.setApproval_file_dir(uploadFolderPath);
		 * fileDto.setApproval_file_name(oriFileName);
		 * fileDto.setApproval_file_id(uuid.toString());
		 * 
		 * 
		 * save = new File(uploadPath, uploadFileName); try { if(checkImageType(save)) {
		 * fileDto.setApproval_file_type(true);
		 * 
		 * 
		 * //????????? ?????? FileOutputStream thumbnail = new FileOutputStream(new
		 * File(uploadPath,"s_"+uploadFileName)); InputStream in = f.getInputStream();
		 * Thumbnailator.createThumbnail(in, thumbnail, 80, 80); in.close();
		 * thumbnail.close(); } // ???????????? f.transferTo(save);
		 * 
		 * attachList.add(fileDto);
		 * 
		 * 
		 * } catch (IllegalStateException e) { e.printStackTrace(); } catch (IOException
		 * e) { e.printStackTrace(); } }
		 * 
		 * 
		 * //???????????? ?????? ???????????? insertDto.setAttachList(attachList);
		 * 
		 */
		//??? ??????
		approvalService.insert(insertDto);
		return "redirect:/user/approvalList";
	}
	// ?????? ?????? ???


	// ????????? ?????? - ????????? ??????
	// ????????? ????????? ????????????
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("????????? ??????" + fileName);

		File file = new File("c:\\upload\\"+fileName);

		ResponseEntity<byte[]> image = null;

		HttpHeaders header = new HttpHeaders();
		try {
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			image = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return image;
	} // ????????? ???


	// ???????????? ??????
	// ????????????
	@GetMapping(path = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> downloadFile(String fileName){
		log.info("???????????? ?????? " + fileName);

		Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
		String resourceUidName = resource.getFilename();
		//uuid ??? ??????
		String resourceName = resourceUidName.substring(resourceUidName.indexOf("_")+1);

		//Spring ?????? >> headers ?????? 
		HttpHeaders headers = new HttpHeaders();

		try {
			headers.add("Content-Disposition", "attachment;filename=" + new String(resourceName.getBytes("utf-8"), "ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	} // ???????????? ???


	// ????????? ?????? ??????
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image"); // image/jepg, image/gif, image/bmp, image/png
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	} // ????????? ???


	// ?????? ?????? ?????????
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		// ?????? ??????
		Date date = new Date();

		String str = sdf.format(date); // 2022-06-08

		// windows: \, unix: /
		return str.replace("-", File.separator); // 2022\06\08 = getFolder
	} // ?????? ?????? ???





	// ?????? ????????? ??????
	@GetMapping("/approvalList")
	public String listGet(Model model, @ModelAttribute("cri") CriteriaDTO cri, Principal principal) {
		log.info("????????????????????? - cri: "+cri);

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
	}// ?????? ????????? ???


	// ?????? ?????? ????????? ??????
	@GetMapping("/approvalCommitList")
	public String commitListGet(Model model, @ModelAttribute("cri") CriteriaDTO cri, Principal principal) {
		log.info("????????????????????? - cri: "+cri);

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
	} // ?????? ?????? ????????? ???




	// ?????? ?????? ??????
	@GetMapping("/getAttachList")
	public ResponseEntity<List<ApprovalFileDTO>> getAttachList(String approval_id) {
		log.info("???????????? "+approval_id);

		approvalService.attachList(approval_id);

		return new ResponseEntity<List<ApprovalFileDTO>>(approvalService.attachList(approval_id) ,HttpStatus.OK);
	} // ???????????? ???


	// ?????? ?????? ???????????? - READ
	@GetMapping("/approvalRead")
	public String readGet(Model model, String approval_id, String approval_commit_id, @ModelAttribute("cri") CriteriaDTO cri) {
		log.info("????????? ??????"+approval_id);

		ApprovalDTO dto =  approvalService.read(approval_id);
		ApprovalCommitDTO commitDto = approvalService.commitRead(approval_commit_id);
		model.addAttribute("dto",dto);
		model.addAttribute("commitDto",commitDto);

		return "/user/approval/approval_read";
	}


	// ?????? ?????? ???????????? - READ (?????????)
	@GetMapping("/approvalCommitRead")
	public String commitReadGet(Model model, String approval_id, String approval_commit_id, @ModelAttribute("cri") CriteriaDTO cri) {
		log.info("????????? ??????"+approval_id);

		ApprovalDTO dto =  approvalService.read(approval_id);
		ApprovalCommitDTO commitDto = approvalService.commitRead(approval_commit_id);
		model.addAttribute("dto",dto);
		model.addAttribute("commitDto",commitDto);

		return "/user/approval/approval_commit_read";
	}

	// ?????? ?????? - ??????
	@PostMapping("/approvalCommit")
	public String approvalCommit(Model model, String approval_commit_id, String approval_inter_id,String approval_final_id, Principal principal){
		log.info("?????? ?????? @@@@@@@@@@@@@@");
		String user_id = principal.getName();
		String interFlag = approvalService.commitRead(approval_commit_id).getApproval_commit_inter_check();
		String finalFlag = approvalService.commitRead(approval_commit_id).getApproval_commit_final_check();
		if (interFlag.equals("????????????")||finalFlag.equals("????????????")) {
			log.info("?????? ?????? ??????????");
			return "redirect:/user/approvalCommitList";
		}

		if (user_id.equals(approval_inter_id)) {
			approvalService.approvalInterCommit(approval_commit_id);
			log.info("???????????? ?????? @@@@@@@@@@@@@@");
		}
		else if (user_id.equals(approval_final_id)) {
			String inter_chk = approvalService.commitRead(approval_commit_id).getApproval_commit_inter_check();
			if (inter_chk.equals("???????????????")||inter_chk.equals("????????????")) {
				log.info("???????????? ???????????????~");
				return "redirect:/user/approvalCommitList";
			}
			// ?????? ?????? ?????? ????????? ?????? ????????? ???????????? ?????? ????????? ??? ???
			// ?????? ?????? ???????????? ????????? ????????? + return?????? jsp ?????? ????????? ??????????????? ???
			// ?????? ?????? ?????? ???????????? ?????? ??? ???
			approvalService.approvalFinalCommit(approval_commit_id);
			log.info("???????????? ?????? @@@@@@@@@@@@@@");
		}

		return "redirect:/user/approvalCommitList";
	}

	// ?????? ?????? - ??????
	@PostMapping("/approvalReject")
	public String approvalReject(Model model, String approval_commit_id, String approval_inter_id,String approval_final_id, String approval_reject, Principal principal){
		log.info("?????? ?????? @@@@@@@@@@@@@@");
		String user_id = principal.getName();
		String interFlag = approvalService.commitRead(approval_commit_id).getApproval_commit_inter_check();
		String finalFlag = approvalService.commitRead(approval_commit_id).getApproval_commit_final_check();
		if (interFlag.equals("????????????")||finalFlag.equals("????????????")) {
			log.info("?????? ?????? ??????????");
			return "redirect:/user/approvalCommitList";
		}

		if (user_id.equals(approval_inter_id)) {
			approvalService.approvalInterReject(approval_commit_id);
			approvalService.approvalInterRejectContent(approval_commit_id, approval_reject);
			log.info("???????????? ?????? @@@@@@@@@@@@@@");
		}
		else if (user_id.equals(approval_final_id)) {
			String inter_chk = approvalService.commitRead(approval_commit_id).getApproval_commit_inter_check();
			if (inter_chk.equals("???????????????")||inter_chk.equals("????????????")) {
				log.info("???????????? ???????????????~");
				return "redirect:/user/approvalCommitList";
			}
			// ?????? ?????? ?????? ????????? ?????? ????????? ???????????? ?????? ????????? ??? ???
			// ?????? ?????? ???????????? ????????? ????????? + return?????? jsp ?????? ????????? ??????????????? ???
			approvalService.approvalFinalReject(approval_commit_id);
			approvalService.approvalFinalRejectContent(approval_commit_id, approval_reject);
			log.info("???????????? ?????? @@@@@@@@@@@@@@");
		}

		return "redirect:/user/approvalCommitList";
	}

	///////////////////////////////////////////////////// ?????? ?????? ??? //////////////////////////////////////////////////////////////////////////////////////








	///////////////////////////////////////////////////// ???????????? ?????? ////////////////////////////////////////////////////////////////////////////////////////

	// ?????? - ?????? ?????? ???????????????
	@GetMapping("/support/dispatch/att")
	public void dispatchList(Model model,@ModelAttribute("cri") CriteriaDTO cri) {
		log.info("????????????????????? ??????");

		List<AttDTO> hrlist = dispatchService.hrList(cri);

		int total = dispatchService.totalCnt(cri);

		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("hrlist", hrlist);
	}

	@PostMapping("/support/dispatch/att")
	public String dispatchListPost(@RequestParam("att_id") String att_id, Model model, RedirectAttributes rttr) {

		log.info("??????????????? ??????");


		rttr.addAttribute("att_id",att_id);
		model.addAttribute("att_id",att_id);

		return "redirect:/user/support/dispatch/attlist";
	}

	// ?????? - ?????? ??? ??? ???????????????
	@GetMapping("/support/dispatch/attlist")
	public void dispatchAttList(@RequestParam("att_id") String att_id, Model model) {

		log.info("??????????????? ??????"+att_id);

		List<CommuteDTO> comlist = commuteService.readCommute(att_id);
		model.addAttribute("comlist",comlist);
	}   



	// ?????? - ?????? ?????????
	@GetMapping("/support/hr/att")
	public void hrList(Model model,@ModelAttribute("cri")CriteriaDTO cri) {
		log.info("????????????????????? ??????");

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
		log.info("??????????????? ??????"+att_id);

		List<CommuteDTO> comlist= commuteService.readCommute(att_id);
		model.addAttribute("comlist", comlist);
	}
	///////////////////////////////////////////////////// ???????????? ??? ////////////////////////////////////////////////////////////////////////////////////////////////////////////


















	////////////////////////////////////////////////////??????????????? ??????////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// ?????? ???????????? SecurityController ?????? ?????? => ?????? ?????? ?????? ???

	////////////////////////////////////////////////////??????????????? ???/////////////////////////////////////////////////////////////////////////////////////////////////////////











	////////////////////////////////////////////////////????????? ??????////////////////////////////////////////////////////////////////////////////////////////////////////////// 

	@GetMapping("/board/list")
	public void boardListGet(Model model, @ModelAttribute("cri") CriteriaDTO cri) {
		log.info("?????? list??? ?????????");

		List<BoardDTO> boardList = boardService.selectBoardAll(cri);
		log.info("list ?????????");

		int total = boardService.totalCnt(cri);

		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("boardList", boardList);
		log.info("model??? ?????????");
	}

	@GetMapping("/board/create")
	public void boardcGet() {
		log.info("create ??????");
	}

	@PostMapping("/board/create")
	public String boardcPost(BoardDTO insertDto) {
		log.info("create post ?????? ");

		System.out.println(insertDto);
	
		
		//????????? ??????
		boardService.boardInsert(insertDto);
		return "redirect:/user/board/list";

	}
	
	
	@PostMapping("/attach/create")
	public ResponseEntity<List<BoardFileDTO>> attachPost(MultipartFile[] uploadFile) {
		log.info("?????????????????? "+uploadFile.length);

		List<BoardFileDTO> attachList = new ArrayList<BoardFileDTO>();

		// ????????? ?????? ?????? ??????
		String uploadBasicPath = "c:\\boardupload";

		// ????????? ?????? ?????? ?????? / ?????? ???????????? ???????????? 
		String uploadFolderPath = getFolder();

		// ?????? ????????? ?????? ?????? / ?????? ?????? ?????? / "c:\\upload\\2022\06\08"
		File uploadPath = new File(uploadBasicPath,uploadFolderPath);

		if(!uploadPath.exists()) { // ????????? ????????? ????????? ??????
			uploadPath.mkdirs();
		}

		String uploadFileName = "";
		File save = null;

		for(MultipartFile f : uploadFile) {
			log.info("????????? : " + f.getOriginalFilename());
			log.info("???????????? : " + f.getSize());

			// ????????? ????????????
			String oriFileName = f.getOriginalFilename();

			//?????? ????????? ????????????
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString()+"_"+oriFileName;

			//????????? ?????? ?????? ??????
			BoardFileDTO fileDto = new BoardFileDTO();
			fileDto.setBoard_file_dir(uploadFolderPath);
			fileDto.setBoard_file_name(oriFileName);
			fileDto.setBoard_file_id(uuid.toString());


			save = new File(uploadPath, uploadFileName);
			try {      
				if(checkImageType(save)) {
					fileDto.setBoard_file_type(true);


					//????????? ??????
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
					InputStream in = f.getInputStream();
					Thumbnailator.createThumbnail(in, thumbnail, 80, 80);
					in.close();
					thumbnail.close();
				}
				// ????????????
				f.transferTo(save);

				attachList.add(fileDto);

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return new ResponseEntity<List<BoardFileDTO>>(attachList,HttpStatus.OK);
	}
	
	
	// ????????? ?????? - ????????? ??????
	// ????????? ????????? ????????????
	@GetMapping("/board/display")
	public ResponseEntity<byte[]> boardFile(String fileName) {
		log.info("????????? ??????" + fileName);

		File file = new File("c:\\boardupload\\"+fileName);

		ResponseEntity<byte[]> image = null;

		HttpHeaders header = new HttpHeaders();
		try {
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			image = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return image;
	} // ????????? ???

	// ???????????? ??????
	// ????????????
	@GetMapping(path = "/board/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> board_downloadFile(String fileName){
		log.info("???????????? ?????? " + fileName);

		Resource resource = new FileSystemResource("c:\\boardupload\\" + fileName);
		String resourceUidName = resource.getFilename();
		//uuid ??? ??????
		String resourceName = resourceUidName.substring(resourceUidName.indexOf("_")+1);

		//Spring ?????? >> headers ?????? 
		HttpHeaders headers = new HttpHeaders();

		try {
			headers.add("Content-Disposition", "attachment;filename=" + new String(resourceName.getBytes("utf-8"), "ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	} // ???????????? ???

	// ????????? ?????? ??????
	private boolean boardCheckImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image"); // image/jepg, image/gif, image/bmp, image/png
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	} // ????????? ???


	// ?????? ?????? ?????????
	private String boardGetFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		// ?????? ??????
		Date date = new Date();

		String str = sdf.format(date); // 2022-06-08

		// windows: \, unix: /
		return str.replace("-", File.separator); // 2022\06\08 = getFolder
	} // ?????? ?????? ???

	// ?????? ?????? ??????
	@GetMapping("/board/getAttachList")
	public ResponseEntity<List<BoardFileDTO>> boardgetAttachList(String board_id) {
		log.info("???????????? "+board_id);

		boardService.attachList(board_id);

		return new ResponseEntity<List<BoardFileDTO>>(boardService.attachList(board_id) ,HttpStatus.OK);

	} // ???????????? ???

	@GetMapping({"/board/readrow","/board/modify"})
	public void readGet(String board_id,@ModelAttribute("cri") CriteriaDTO cri,Model model) {
		log.info("????????? ?????? "+board_id);
		log.info("????????? ?????? "+cri);

		BoardDTO dto = boardService.getRow(board_id);
		model.addAttribute("dto", dto);
	}

	@PostMapping("/board/modify")
	public String modify(BoardDTO updateDto, @ModelAttribute("cri") CriteriaDTO cri, RedirectAttributes rttr) {
		log.info("?????? ??????" + updateDto);

		boardService.modify(updateDto);

		//?????? ??????
		rttr.addAttribute("board_id", updateDto.getBoard_id());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());   
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/user/board/readrow";
	}

	@GetMapping("/board/delete")
	public String delete(String board_id) {
		log.info("????????? ??????");

		boardService.delete(board_id);


		return "redirect:/user/board/list";

	}
	////////////////////////////////////////////////////????????? ???/////////////////////////////////////////////////////////////////////////////////////////////////////////    












	////////////////////////////////////////////////////?????? ??????/////////////////////////////////////////////////////////////////////////////////////////////////////////

	@PostMapping(path = "/replies/new")
	public ResponseEntity<String> create(@RequestBody ReplyDTO reply){
		log.info("?????? ?????? ?????? "+reply.getMem_id()+reply.getBoard_id()+reply.getReply_content());

		return replyService.replyInsert(reply)?new ResponseEntity<String>("success", HttpStatus.OK):
			new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// ?????? ?????? ???????????? - /replies/rno + GET 
	// ????????? ReplyDTO + 200   
	@GetMapping("/replies/{reply_id}")
	public ResponseEntity<ReplyDTO> get(@PathVariable("reply_id") String reply_id){
		log.info("?????? ???????????? "+reply_id);
		return new ResponseEntity<ReplyDTO>(replyService.replyRow(reply_id), HttpStatus.OK);
	}

	// ?????? ?????? - /replies/1 + PUT + body(????????????-json)
	// ????????? success + 200, ????????? fail + 500
	//@RequestMapping(path = "/{rno}", method = {RequestMethod.PUT,RequestMethod.PATCH})
	@PutMapping("/replies/{reply_id}")
	public ResponseEntity<String> create(@PathVariable("reply_id") String reply_id,@RequestBody ReplyDTO updateDto){

		log.info("?????? ?????? ?????? "+updateDto);   

		updateDto.setReply_id(reply_id);      

		return replyService.replyUpdate(updateDto)?new ResponseEntity<String>("success", HttpStatus.OK):
			new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// ???????????? : /replies/rno + Delete
	// ????????? success + 200, ????????? fail + 500
	@DeleteMapping("/replies/{reply_id}")
	public ResponseEntity<String> remove(@PathVariable("reply_id") String reply_id){

		log.info("?????? ?????? ?????? "+ reply_id);         

		return replyService.replyDelete(reply_id)?new ResponseEntity<String>("success", HttpStatus.OK):
			new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	//?????? ????????? : /replies/pages/bno/page + GET
	//????????? ?????? ?????????
	// http://localhost:9090/replies/pages/500/1
	@GetMapping("/replies/pages/{board_id}/{page}")
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("board_id") String board_id,@PathVariable("page") int page){
		log.info("?????? ????????? ?????? board_id="+board_id+", page = "+page);

		CriteriaDTO cri = new CriteriaDTO(page, 10);

		return new ResponseEntity<ReplyPageDTO>(replyService.getList(cri, board_id), HttpStatus.OK);
	}
	////////////////////////////////////////////////////?????? ???/////////////////////////////////////////////////////////////////////////////////////////////////////////    









	///////////////////////////////////////////////////////////////////////////?????????????????? ?????? ?????????-????????? ?????????????????? ????????? ?????? ????????? adminController ??????////////////////////////////////////


	@GetMapping("/email/noticeList")
	public String list(Model model, @ModelAttribute("cri") CriteriaDTO cri/*MailDTO mailDto,Model model*/) {

		log.info("?????? ?????? ????????? ??????");

		List<MailDTO> list = mailService.select(cri);
		log.info("?????? ?????? ???????????? ????????? ??????????????? ??????");

		int total = mailService.totalCnt(cri);
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("notice_list", list);
		log.info("?????? ?????? ???????????? ?????? ???????????? --> notice_list???");
		return "/user/email/notice_list"; //jsp ????????????
	}


	@GetMapping("/email/noticeRead")
	public String readEmail(String mail_id, Model model) {
		log.info("id??? ?????? ??? ??????");

		MailDTO noticeRead = mailService.read(mail_id);

		model.addAttribute("noticeRead", noticeRead);

		return "/user/email/notice_read";
	}















}