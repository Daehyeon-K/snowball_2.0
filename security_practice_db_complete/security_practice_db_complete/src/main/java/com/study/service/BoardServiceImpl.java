package com.study.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.study.dto.BoardDTO;
import com.study.dto.CriteriaDTO;
import com.study.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper mapper;

	
	@Override
	public boolean create(BoardDTO insertDto) {
		return mapper.create(insertDto)==1?true:false;
	}

	@Override
	public BoardDTO getRow(String board_id) {
		return mapper.readrow(board_id);
	}

	@Override
	public BoardDTO read(String board_id) {
		return mapper.readrow(board_id);
	}
	
	@Override
	public boolean modify(BoardDTO updateDto) {
		return mapper.modify(updateDto)==1?true:false;
	}
	
	@Override
	public boolean delete(String board_id) {
		return mapper.delete(board_id)==1?true:false;
	}
	
//	// 조회수
//	@Transactional(isolation = Isolation.READ_COMMITTED)
//	@Override
//	public BoardDTO boardCnt(int board_id) {
//			mapper.boardCnt(board_id);
//		return mapper.views(board_id);
//	}

	// 페이지 나누기 부분
	@Override
	public List<BoardDTO> select(CriteriaDTO cri) {
		return mapper.select(cri);
	}


	@Override
	public List<BoardDTO> selectBoardAll(CriteriaDTO cri) {
		return mapper.viewAll(cri);
	}


	@Override
	public int totalCnt(CriteriaDTO cri) {
		return mapper.totalCnt(cri);
	}

	


	


	








	

	


	



}
