package com.study.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.ApprovalDTO;
import com.study.dto.AuthorityDTO;
import com.study.dto.CriteriaDTO;
import com.study.dto.MemDTO;


// Mapper 인터페이스 여기서 xml 과 연동
public interface AdminUserControlMapper {
	// 사용자 리스트 보기
	public List<MemDTO> userList(CriteriaDTO cri);
//	public List<MemDTO> userList();

	// 페이지 갯수 구하기
	public int totalCnt(CriteriaDTO cri);
	
	// 사용자 회원가입시켜주기
	public int userInsert(MemDTO user);
	
	// 사용자에게 회원가입시켜주기 전에 권한부터 주기
	public int authInsert(AuthorityDTO auth);
	
	// 사용자가 로그인하기
	public MemDTO login(String mem_id);
	
	// 시용자 회원가입 될 때마다 메모 삽입해주기 자동으로
	public int memoInsert(MemDTO user);
	
	// 비밀번호 변경
//	public int pwdChange(@Param("mem_pwd") String mem_pwd, @Param("mem_id") String mem_id);
//	public int pwdChange(MemDTO changePwd);
	
	
	// 태현 - 
	public MemDTO read(String mem_id);
	public int update(MemDTO updateDto);
	public int delete(String mem_id);
}
