package com.study.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.dto.AuthorityDTO;
import com.study.dto.ChangePwdDTO;
import com.study.dto.CriteriaDTO;
import com.study.dto.CustomUser;
import com.study.dto.MemDTO;
import com.study.mapper.AdminUserControlMapper;

@Service
public class AdminUserControlServiceImpl implements AdminUserControlService {
	
	// AdminUserControlMapper 주입시켜놓기
	@Autowired
	private AdminUserControlMapper mapper;
	
	// 사용자가 입력한 비밀번호를 암호화시켜주기
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	
//	@Override
//	public List<MemDTO> userList() {
//		return mapper.userList();
//	}
	
	@Override
	public List<MemDTO> userList(CriteriaDTO cri) {
		return mapper.userList(cri);
	}

	@Override
	public int totalCnt(CriteriaDTO cri) {
		return mapper.totalCnt(cri);
	}
	
	
	
	//mapper 에서 userInsert의 Mem 테이블과 authInsert의 Mem과 Authority 조인 테이블을 
	//동시에 접근해야 하기 때문에 둘 중 하나라도 실패하면 실행 불가로 만들어주기
	@Transactional 	@Override
	public boolean userInsert(MemDTO user) {
		// 비밀번호 암호화 여기서 처리해주기
		user.setMem_pwd(encoder.encode(user.getMem_pwd()));
		
		// 사용자 추가 성공하면 result 에 담기 => 회원가입 시켜주기
		boolean result = mapper.userInsert(user)==1;
		
		// 회원가입 시켜줬으면 이 때 권한도 같이 부여해주기
		AuthorityDTO auth = new AuthorityDTO(user.getMem_id(), "ROLE_USER");
		mapper.authInsert(auth);
		
//		// 관리자 처음에만 권한주기
//		auth = new AuthorityDTO(user.getMem_id(), "ROLE_ADMIN");
//		mapper.authInsert(auth);
		
		mapper.memoInsert(user);
		
		return result;
	}


	@Override
	public MemDTO getRow(String mem_id) {
		return mapper.read(mem_id);
	}


	@Override
	public boolean update(MemDTO updateDto) {
		return mapper.update(updateDto)==1?true:false;
	}


	@Override
	public boolean delete(String mem_id) {
		return mapper.delete(mem_id)==1?true:false;
	}


	





	
	
	@Override
	public boolean pwdChange(ChangePwdDTO change) {
		
		System.out.println("저장된 암호 잘 뽑은건지 확인 : "+mapper.pwdSelect(change.getMem_id()));
		
		// 사용자가 입력한 현재 비밀번호와 디비에 암호화로 저장된 비밀번호와 같은지 확인
		if(encoder.matches(change.getMem_pwd(), mapper.pwdSelect(change.getMem_id()))) {
			
			change.setNew_mem_pwd(encoder.encode(change.getNew_mem_pwd()));
			change.setCur_new_mem_pwd(encoder.encode(change.getCur_new_mem_pwd()));
			mapper.pwdChange(change);
			System.out.println("새 비밀번호 찍기 : "+change.getCur_new_mem_pwd());
			
			return true;
			
			// 현재 비밀번호가 일치한다면, 새 비밀번호와 새 비밀번호 확인과 일치하는지 확인
//			if(change.getNew_mem_pwd().equals(change.getCur_new_mem_pwd())) {
//				System.out.println("현재 비밀번호 찍기 : "+change.getMem_pwd());
//				// 다 일치한다면 비밀번호 변경하기
//				mapper.pwdChange(change);
//				System.out.println("새 비밀번호 찍기 : "+change.getNew_mem_pwd());
//				
//				// 변경한 비밀번호 다시 암호화하기
//				encoder.encode(change.getCur_new_mem_pwd());
//				System.out.println(change.getCur_new_mem_pwd());
//				
//				return true;
//			}	
			
			
		}
		return false;
	}
	

}
