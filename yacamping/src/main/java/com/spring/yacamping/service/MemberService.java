package com.spring.yacamping.service;


import com.spring.yacamping.domain.MemberVO;

public interface MemberService {
    public int Login(MemberVO vo) throws Exception; 
    
    public void register(MemberVO vo) throws Exception;
    
	//회원정보 보기
	public MemberVO readMember(String id);
	
	public void updateMember(MemberVO vo) throws Exception;
	
	//아이디 중복체크
	public int idChk(MemberVO vo) throws Exception;
	
	public MemberVO findid(MemberVO vo) throws Exception;
	
	public MemberVO findpassword(MemberVO vo) throws Exception;
	
	//회원 탈퇴
	public void memberDelete(MemberVO vo) throws Exception;
	
	//회원 탈퇴 패스워드 체크
	public int passChk(MemberVO vo) throws Exception;

}