package com.spring.yacamping.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.yacamping.domain.BoardVO;
import com.spring.yacamping.domain.Criteria;
import com.spring.yacamping.service.BoardService;

@Controller
public class HomeController {
	@Autowired 
	private BoardService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,Criteria cri) {
		List<BoardVO> list = service.getData(cri);
		model.addAttribute("data", list);
		return "home";
	}
	
}
