package com.spring.example.service;

import com.spring.example.VO.MemberVO;

public interface MemberService {
    public int Login(MemberVO vo) throws Exception;
    
    public void register(MemberVO vo) throws Exception;
}