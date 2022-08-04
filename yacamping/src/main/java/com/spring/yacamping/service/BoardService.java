package com.spring.yacamping.service;

import java.util.List;

import com.spring.yacamping.domain.BoardVO;
import com.spring.yacamping.domain.Criteria;


public interface BoardService {
	
	public BoardVO get(Criteria cri);
	
	public List<BoardVO> getList(Criteria cri);
		
	public int getTotal(Criteria cri);
	
	public List<BoardVO> getData(Criteria cri);
	
}
