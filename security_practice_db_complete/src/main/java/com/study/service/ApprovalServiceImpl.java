package com.study.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.dto.ApprovalCommitDTO;
import com.study.dto.ApprovalDTO;
import com.study.dto.ApprovalFileDTO;
import com.study.dto.CriteriaDTO;
import com.study.dto.MemGradeDTO;
import com.study.mapper.ApprovalMapper;
import com.study.mapper.AttachMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ApprovalServiceImpl implements ApprovalService {

//	@Autowired
//	private ApprovalMapper mapper;
//	
//	@Autowired
//	private AttachMapper attachMapper;
//	
	
//	@Transactional
//	@Override
//	public void insert(ApprovalDTO insertDto) {
//		log.info("service---- "+insertDto);
//		//첨부 파일 개수만큼 루프돌기
//		
//		mapper.commit_insert(); // 승인 먼저 해주기
//	    mapper.insert(insertDto); // 승인 후 결재 기안하기
//		
//		if(insertDto.getAttachList() == null) {
//			return;
//		}
//		
//		insertDto.getAttachList().forEach(attach -> {
//			//attach.setApproval_id(insertDto.getApproval_id());
//			//첨부파일 삽입
//			attachMapper.insertFile(attach);
//		});
//	}
//
//	@Override
//	public List<ApprovalDTO> select(CriteriaDTO cri) {
//		return mapper.select(cri);
//	}
//
//	@Override
//	public int totalCnt(CriteriaDTO cri) {
//		return mapper.totalCnt(cri);
//	}
//
//	@Override
//	public ApprovalDTO read(String approval_id) {
//		return mapper.read(approval_id);
//	}
//	
//	@Override
//	public List<ApprovalFileDTO> attachList(String approval_id) {
//		return attachMapper.list(approval_id);
//	}
//
//	@Override
//	public boolean insertFile(ApprovalFileDTO attach) {
//		return attachMapper.insertFile(attach)==1?true:false;
//	}


	
	   @Autowired
	   private ApprovalMapper mapper;
	   
	   @Autowired
	   private AttachMapper attachMapper;
	   
	   /* 결재 기안, 조회 */
	   
	   
	   @Transactional
	   @Override
	   public void insert(ApprovalDTO insertDto) {
	      log.info("service---- "+insertDto);
	      //첨부 파일 개수만큼 루프돌기
	      mapper.commit_insert();
	      mapper.insert(insertDto);
	      
	      if(insertDto.getAttachList() == null) {
	         return;
	      }
	      
	      insertDto.getAttachList().forEach(attach -> {
	         //attach.setApproval_id(insertDto.getApproval_id());
	         //첨부파일 삽입
	         attachMapper.insertFile(attach);
	      });
	   }

	   @Override
	   public List<ApprovalDTO> select(@Param("cri") CriteriaDTO cri, @Param("mem_id") String mem_id/*, @Param("typeArr") String[] typeArr*/) {
	      return mapper.select(cri, mem_id/*, typeArr*/);
	   }

	   @Override
	   public int totalCnt(@Param("cri") CriteriaDTO cri, @Param("mem_id") String mem_id/*, @Param("typeArr") String[] typeArr*/) {
	      return mapper.totalCnt(cri,mem_id/*, typeArr*/);
	   }

	   @Override
	   public ApprovalDTO read(String att_id) {
	      return mapper.read(att_id);
	   }
	   
	   @Override
	   public List<ApprovalFileDTO> attachList(String approval_id) {
	      return attachMapper.list(approval_id);
	   }

	   @Override
	   public boolean insertFile(ApprovalFileDTO attach) {
	      return attachMapper.insertFile(attach)==1?true:false;
	   }

	   @Override
	   public ApprovalCommitDTO commitRead(String approval_commit_id) {
	      return mapper.commitRead(approval_commit_id);
	   }
	   
	   // 결재 수신 
	   @Override
	   public List<ApprovalDTO> commitSelect(@Param("cri") CriteriaDTO cri, @Param("mem_id") String mem_id/*, @Param("typeArr") String[] typeArr*/) {
	      return mapper.commitSelect(cri, mem_id/*, typeArr*/);
	   }

	   @Override
	   public boolean approvalInterCommit(String approval_commit_id) {
	      return mapper.approvalInterCommit(approval_commit_id)==1?true:false;
	   }

	   @Override
	   public boolean approvalFinalCommit(String approval_commit_id) {
	      return mapper.approvalFinalCommit(approval_commit_id)==1?true:false;
	   }

	   @Override
	   public boolean approvalInterReject(@Param("approval_commit_id") String approval_commit_id) {
	      return mapper.approvalInterReject(approval_commit_id)==1?true:false;
	   }

	   @Override
	   public boolean approvalFinalReject(@Param("approval_commit_inter_check") String approval_commit_id) {
	      return mapper.approvalInterReject(approval_commit_id)==1?true:false;
	   }
	   
	   @Override
	   public boolean approvalInterRejectContent(@Param("approval_commit_id") String approval_commit_id, @Param("approval_reject") String approval_reject) {
	      return mapper.approvalInterRejectContent(approval_commit_id, approval_reject)==1?true:false;
	   }

	   @Override
	   public boolean approvalFinalRejectContent(@Param("approval_commit_inter_check") String approval_commit_id, @Param("approval_reject") String approval_reject) {
	      return mapper.approvalInterRejectContent(approval_commit_id, approval_reject)==1?true:false;
	   }

	   @Override
	   public List<MemGradeDTO> getInterMan() {
	      return mapper.getInterMan();
	   }

	   @Override
	   public List<MemGradeDTO> getFinalMan() {
	      return mapper.getFinalMan();
	   }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


}
