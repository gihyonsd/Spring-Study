package com.spring.yacamping.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.spring.yacamping.domain.BoardVO;
import com.spring.yacamping.domain.Criteria;
import com.spring.yacamping.mapper.BoardMapper;
import com.spring.yacamping.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Primary
@Service

@AllArgsConstructor
@Log4j
public class BoardServiceImpl implements BoardService{

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;


	@Override
	public BoardVO get(Criteria cri) {
		
		
		return mapper.read(cri);
	}
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		
		log.info("get List witg criteria: "+ cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get Total Count");
		
		return mapper.gettotalCount(cri);
		
	}

	@Override
	public List<BoardVO> getData(Criteria cri) {
		return mapper.getall(cri);
	}


}
