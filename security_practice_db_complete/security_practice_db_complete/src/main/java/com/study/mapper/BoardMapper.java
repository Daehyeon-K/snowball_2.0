package com.study.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.BoardDTO;
import com.study.dto.CriteriaDTO;

public interface BoardMapper {

	public List<BoardDTO> viewAll(CriteriaDTO cri);

	public void updateReplyCnt(@Param("board_id") String board_id, @Param("amount") int amount ) ;
	
	public int create(BoardDTO insertDto);
	
	public BoardDTO readrow(String board_id);
	
	public int modify(BoardDTO updateDto);

	public int delete(String board_id);
	
	// 게시판 조회수
	//public BoardDTO boardCnt(int board_id);
	
	// 페이지 나누기 부분
	public List<BoardDTO> select(CriteriaDTO cri);
	public int totalCnt(CriteriaDTO cri); //처리할 인자 없으니까
}