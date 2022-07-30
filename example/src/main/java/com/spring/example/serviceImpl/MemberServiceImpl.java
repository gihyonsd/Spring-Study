package com.spring.example.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.example.VO.MemberVO;
import com.spring.example.dao.MemberDao;
import com.spring.example.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

    @Autowired
    private MemberDao memberDao;

    @Override
    public int Login(MemberVO vo) throws Exception {
    
        return memberDao.Login(vo);

    }

	@Override
	public void register(MemberVO vo) throws Exception {
		memberDao.register(vo);
	}


}