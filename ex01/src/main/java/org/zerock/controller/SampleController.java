package org.zerock.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;


import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	
	@RequestMapping("")
	public void basic() {
		log.info("basic...........");
	}
	
	@GetMapping("/basicGET")
	public void basicGet() {
		log.info("basic get...........");
	}
	
	@GetMapping("/ex01") 
	public void ex01(SampleDTO dto) {
		log.info(dto);
	}
	
	@GetMapping("/ex02")
	public void ex02( @RequestParam("name") String name, int age ) {
		log.info(name);
		log.info(age);
	}
	@GetMapping("/ex02List")
	public String ex02List(@RequestParam("ids")ArrayList<String> ids) {
		log.info("ids: " +ids);
		
		return "ex02List";
	}
	@GetMapping("/ex02Bean")
	public String ex02Bean(@ModelAttribute("sample")SampleDTOList list, Model model) {  //Model에 담는 데이터는 파라미터가 아니라 다른 곳에서 발생한 데이터를 담기 위한 용기
		log.info(list);
		
		model.addAttribute("result", "success");
		
		return "sample/ex02Bean";
	}
}
