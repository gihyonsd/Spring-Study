package com.spring.yacamping.mapper;

import java.util.List;

import com.spring.yacamping.domain.BoardVO;
import com.spring.yacamping.domain.Criteria;



public interface BoardMapper {
	
	
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public BoardVO read(Criteria cri);
	
	public int gettotalCount(Criteria cri);
	
	public List<BoardVO> getall(Criteria cri);

}
