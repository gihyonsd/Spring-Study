package com.spring.yacamping.dao;

 

import org.springframework.stereotype.Repository;

import com.spring.yacamping.domain.MemberVO;

@Repository
public interface MemberDao {

    public int Login(MemberVO vo) throws Exception;
    public void register(MemberVO vo) throws Exception;
    public MemberVO readMember(String id) throws Exception;
}