package com.spring.example.dao;

 

import org.springframework.stereotype.Repository;
import com.spring.example.VO.MemberVO;

@Repository
public interface MemberDao {

    public int Login(MemberVO vo) throws Exception;
    public void register(MemberVO vo) throws Exception;
}