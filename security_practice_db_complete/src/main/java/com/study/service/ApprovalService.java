package com.study.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.ApprovalCommitDTO;
import com.study.dto.ApprovalDTO;
import com.study.dto.ApprovalFileDTO;
import com.study.dto.CriteriaDTO;
import com.study.dto.MemGradeDTO;

public interface ApprovalService {
//	//public List<ApprovalDTO> selectAll(CriteriaDTO cri);
//	public void insert(ApprovalDTO insertDto);
//	public List<ApprovalDTO> select(CriteriaDTO cri);
//    public int totalCnt(CriteriaDTO cri);
//    public ApprovalDTO read(String approval_id);
//    public boolean insertFile(ApprovalFileDTO attach);
//    
//	//첨부파일
//	public List<ApprovalFileDTO> attachList(String approval_id);
	
	
	public void insert(ApprovalDTO insertDto);
    public List<ApprovalDTO> select(@Param("cri") CriteriaDTO cri, @Param("mem_id") String mem_id/*, @Param("typeArr") String[] typeArr*/);
    public int totalCnt(@Param("cri") CriteriaDTO cri, @Param("mem_id") String mem_id/*, @Param("typeArr") String[] typeArr*/);
    public ApprovalDTO read(String approval_id);
    public boolean insertFile(ApprovalFileDTO attach);
    public ApprovalCommitDTO commitRead(String approval_commit_id); // 결재 승인 정보 가져오기
    
   //첨부파일
   public List<ApprovalFileDTO> attachList(String approval_id);
   
   // 결재 수신 
   public List<ApprovalDTO> commitSelect(@Param("cri") CriteriaDTO cri, @Param("mem_id") String mem_id/*, @Param("typeArr") String[] typeArr*/);
   public boolean approvalInterCommit(String approval_commit_id);
   public boolean approvalFinalCommit(String approval_commit_id);
   public boolean approvalInterReject(@Param("approval_commit_id") String approval_commit_id);
   public boolean approvalFinalReject(@Param("approval_commit_id") String approval_commit_id);
   public boolean approvalInterRejectContent(@Param("approval_commit_id") String approval_commit_id, @Param("approval_reject") String approval_reject);
   public boolean approvalFinalRejectContent(@Param("approval_commit_id") String approval_commit_id, @Param("approval_reject") String approval_reject);
   
   // 중간승인권자 불러오기
   public List<MemGradeDTO> getInterMan();
   
   // 최종승인권자 불러오기
   public List<MemGradeDTO> getFinalMan();

}
