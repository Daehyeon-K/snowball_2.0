package com.study.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
	// 페이지 나누기 정보
	// 페이지 숫자로 14를 눌렀다면 startPage 는 11, endPage 는 20 으로 나와야 함
	private int startPage; // 하단에 페이지 숫자 중에서 시작하는 숫자
	private int endPage;   // 하단에 페이지 숫자 중에서 끝나는 숫자
	private boolean prev; // 다음 보여줄거냐
	private boolean next; // 이전 보여줄거냐
	
	//전체 게시물 수
	private int total;
	private CriteriaDTO cri;
	
	public PageDTO(CriteriaDTO cri, int total) { 
		this.total = total; //초기화
		this.cri = cri; //초기화
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10; 
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil( (total/1.0) / cri.getAmount()));
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
