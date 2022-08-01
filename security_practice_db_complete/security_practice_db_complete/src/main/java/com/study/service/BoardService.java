package com.study.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.BoardDTO;
import com.study.dto.CriteriaDTO;

public interface BoardService {
	
	public List<BoardDTO> selectBoardAll(CriteriaDTO cri);
	
	public boolean create(BoardDTO insertDto);
	
	public BoardDTO getRow(String board_id);
	
	public BoardDTO read(String board_id);
	
	public boolean modify(BoardDTO updateDto);
	
	public boolean delete(String board_id);
	
//	public BoardDTO views(int board_id); // 조회수 메소드
	

	// 페이지 나누기 부분
	public List<BoardDTO> select(CriteriaDTO cri);
	public int totalCnt(CriteriaDTO cri); //처리할 인자 없으니까
	
}