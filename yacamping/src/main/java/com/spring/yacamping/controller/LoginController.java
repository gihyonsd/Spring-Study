package com.spring.yacamping.controller;



import java.io.PrintWriter;

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
import org.springframework.web.bind.annotation.ResponseBody;

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
    @RequestMapping(value = "/findid", method = RequestMethod.GET) 
    public String Findid() {
    	return "/common/findid";
    }
    @RequestMapping(value = "/findpassword", method = RequestMethod.GET) 
    public String FindPass() {
    	return "/common/findpassword";
    }
    @RequestMapping(value = "/Login", method = RequestMethod.GET)
    public String LoginPage(HttpServletRequest request) {
    	String referrer = request.getHeader("Referer");
    	request.getSession().setAttribute("prevPage", referrer);

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
                       , @RequestParam("password") String password, HttpServletRequest request,HttpServletResponse response, boolean rememberId, Model model) throws Exception {

        String path = "";
        String msg = "로그인 정보가 올바르지 않습니다.";
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
            path = (String)session.getAttribute("prevPage");
            return "redirect:" + path;
        } else {
        	model.addAttribute("msg", msg);
            path = "/common/LoginPage";
        }

        return path;
    }
    
    @RequestMapping(value = "/Logout", method = RequestMethod.GET)
    public String Logout(HttpServletRequest request) {
    	
    	HttpSession session = request.getSession();
        session.invalidate();
        String path = "";
        path = "redirect:/";
        return path; 
    	
    }
    
    @RequestMapping(value = "/register") 
    	public @ResponseBody String register(@RequestParam("nation") String nation, @RequestParam("phone") String phone, @ModelAttribute MemberVO vo) throws Exception {
    		vo.setPhone(nation + " " + phone);
    		memberServiceImpl.register(vo);
    	    return "<script>"
            + "alert(\"Welcome!! Yacamping!!\");"
            + "location.href=\"/\";"
            + "</script>";
    }
    
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = memberServiceImpl.idChk(vo);
		return result;
	}
	
	@RequestMapping(value = "/findid", method = RequestMethod.POST) 
	public String findidPost(MemberVO vo, Model model) throws Exception {
		MemberVO member = memberServiceImpl.findid(vo);
		
		if(member == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("id", member.getId());
		}
		return "/common/findid";
	}
	@RequestMapping(value = "/findpassword", method = RequestMethod.POST) 
	public String findpasswordPost(MemberVO vo, Model model) throws Exception {
		MemberVO member = memberServiceImpl.findpassword(vo);
		
		if(member == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("password", member.getPassword());
		}
		return "/common/findpassword";
		
	}
}