package com.study.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.AuthorityDTO;
import com.study.dto.CriteriaDTO;
import com.study.dto.MemDTO;

public interface AdminUserControlService {

	// 사용자 리스트 보기
	public List<MemDTO> userList(CriteriaDTO cri);
	
	// 사용자 리스트 갯수 구하기
	public int totalCnt(CriteriaDTO cri);
	
	// 사용자 회원가입시켜주기
	// 이 때 권한 주는 메소드는 여기에 추가 x => userInsert 안에서 실행시켜줄거라
	public boolean userInsert(MemDTO user);
	
	// 비밀번호 변경
//	public boolean pwdChange(@Param("mem_pwd") String mem_pwd, @Param("mem_id") String mem_id);
//	public boolean pwdChange(MemDTO changePwd);
	
	
	// 태현
	public MemDTO getRow(String mem_id);
	public boolean update(MemDTO updateDto);
	public boolean delete(String mem_id);
}
