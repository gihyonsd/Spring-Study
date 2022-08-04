package com.spring.yacamping.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.yacamping.domain.MemberVO;
import com.spring.yacamping.serviceImpl.MemberServiceImpl;

@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private MemberServiceImpl memberServiceImpl;

    
    @RequestMapping(value = "/Agree", method = RequestMethod.GET)
    public String agreePage() {
        return "/common/agree";
    }
    
    @RequestMapping(value = "/Login", method = RequestMethod.GET)
    public String LoginPage() {
        return "/common/LoginPage";
    }
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String joinPage() {
        return "/common/joinPage";
    }
    
	private boolean rememberId(boolean rememberId) {
		return rememberId;
	}
	
    @RequestMapping(value = "/Login", method = RequestMethod.POST)
    public String Login(@RequestParam("id") String id
                       , @RequestParam("password") String password, HttpServletRequest request,HttpServletResponse response, boolean rememberId) throws Exception {

        String path = "";
        
        MemberVO vo = new MemberVO();
        
		if(rememberId(rememberId)) {
			Cookie cookie = new Cookie("id", id);
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
        vo.setId(id);
        vo.setPassword(password);

        int result = memberServiceImpl.Login(vo);
        HttpSession session = request.getSession();
        session.setAttribute("id", id);
        session.setAttribute("password", password);

        if(result == 1) {
            path = "home";
        } else {
            path = "/common/LoginPage";
        }

        return path;

    }
    @RequestMapping(value = "/Logout", method = RequestMethod.GET)
    public String Logout(HttpServletRequest request) {
    	
    	HttpSession session = request.getSession();
        session.invalidate();
        String path = "";
        path = "home";
        return path; 
    	
    }
    
    @RequestMapping(value = "/register") 
    	public String register(@RequestParam("nation") String nation, @RequestParam("phone") String phone, @ModelAttribute MemberVO vo) throws Exception {
    		vo.setPhone(nation + " " + phone);
    		memberServiceImpl.register(vo);
    		String path = "";
    		path = "/common/LoginPage";
    		return path;
    }
}