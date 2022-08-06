package com.spring.yacamping.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.yacamping.dao.MemberDao;
import com.spring.yacamping.domain.MemberVO;
import com.spring.yacamping.service.MemberService;

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

	@Override
	public MemberVO readMember(String id) {
		MemberVO vo = null;
		
		try {
			vo = memberDao.readMember(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		memberDao.updateMember(vo);
	}


}