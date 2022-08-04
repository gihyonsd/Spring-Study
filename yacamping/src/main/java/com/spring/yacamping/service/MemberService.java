package com.spring.yacamping.service;


import com.spring.yacamping.domain.MemberVO;

public interface MemberService {
    public int Login(MemberVO vo) throws Exception; 
    
    public void register(MemberVO vo) throws Exception;
    
	//회원정보 보기
	public MemberVO readMember(String id);
}