package com.spring.example.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.spring.example.domain.BoardVO;
import com.spring.example.domain.Criteria;
import com.spring.example.mapper.BoardMapper;
import com.spring.example.service.BoardService;

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
	public BoardVO get(int bno) {
		
		
		return mapper.read(bno);
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
	public void booking(BoardVO board) {
	
		mapper.insert(board);
	}
}
