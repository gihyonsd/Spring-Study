package com.spring.example.service;

import java.util.List;

import com.spring.example.domain.BoardVO;
import com.spring.example.domain.Criteria;


public interface BoardService {
	
	public BoardVO get(int bno);
	
	public List<BoardVO> getList(Criteria cri);
		
	public int getTotal(Criteria cri);
	
	public void booking(BoardVO board);
}
