package com.spring.yacamping.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.yacamping.domain.BookingVO;
import com.spring.yacamping.domain.KakaoBookingVO;
import com.spring.yacamping.domain.MemberVO;
import com.spring.yacamping.service.BookingService;
import com.spring.yacamping.serviceImpl.MemberServiceImpl;
@Controller
public class MemberController {
	@Autowired
	MemberServiceImpl service;
	@Autowired
	BookingService bookingservice;

    
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String info(HttpSession session, Model model, BookingVO vo, KakaoBookingVO kakao) throws Exception{
		String path = "";
		model.addAttribute("member", service.readMember((String)session.getAttribute("id")));
		vo.setId((String)session.getAttribute("id"));
		kakao.setId((String)session.getAttribute("id"));
		model.addAttribute("list", bookingservice.getBookingList(vo));
		model.addAttribute("kakao", bookingservice.getKakaoList(kakao));
		path = "/common/mypage";
		return path;
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST) 
  	public String update(MemberVO vo) throws Exception {
  		service.updateMember(vo);
  		return "redirect:/mypage";
  }
	
	// 회원 탈퇴 get
	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {
		return "/common/memberDeleteView";
	}

	// 회원 탈퇴 post
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session) throws Exception {
		// 세션에있는 비밀번호
		String sessionPass = (String)session.getAttribute("password");
		// vo로 들어오는 비밀번호
		String voPass = vo.getPassword();
		if (!(sessionPass.equals(voPass))) {
			return "redirect:/memberDelete";
		}
		
		service.memberDelete(vo);
		session.invalidate();
		return "redirect:/";
	}
	// 회원 탈퇴 패스워드 체크
	@ResponseBody
	@RequestMapping(value="/passChk", method = RequestMethod.POST)
	public int passChk(MemberVO vo) throws Exception {
		int result = service.passChk(vo);
		return result;
	}

}
