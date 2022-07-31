package com.study.dto;

import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Service
@ToString
public class CriteriaDTO {
	private int pageNum; // 사용자가 선택한 페이지 번호, 1,2,3,4 ... 밑에 숫자 클릭
	private int amount; // 한 페이지당 보여줄 게시물 수 , 사용자가 선택한 게시물 갯수
	
	private String type; // 검색조건
	private String keyword; // 검색어
	
	public CriteriaDTO() { // 기본값은 pageNum=1, amount=10
		this(1,10);
	}

	public CriteriaDTO(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// 검색 조건을 String[]로 변경
	// 배열로 생성
	// split("") 공백으로 나누기
	public String[] getTypeArr() {
		return type==null?new String[] {}:type.split("");
	}
	
}
