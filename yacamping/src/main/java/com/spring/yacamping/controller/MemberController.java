package com.spring.yacamping.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.yacamping.domain.MemberVO;
import com.spring.yacamping.serviceImpl.MemberServiceImpl;
@Controller
public class MemberController {
	@Autowired
	MemberServiceImpl service;
	

    
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String info(HttpSession session, Model model) throws Exception{
		String path = "";
		model.addAttribute("member", service.readMember((String)session.getAttribute("id")));
		
		path = "/common/mypage";
		return path;
		
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST) 
  	public String update(MemberVO vo) throws Exception {
  		service.updateMember(vo);
  		return "redirect:/mypage";
  }

}
