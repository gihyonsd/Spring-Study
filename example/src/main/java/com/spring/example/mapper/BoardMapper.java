package com.spring.example.mapper;

import java.util.List;

import com.spring.example.domain.BoardVO;
import com.spring.example.domain.Criteria;



public interface BoardMapper {
	
	
	
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public BoardVO read(int bno);
	
	public int gettotalCount(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
}
