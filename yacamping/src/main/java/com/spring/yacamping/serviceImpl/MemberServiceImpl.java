package com.spring.yacamping.serviceImpl;


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

	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = memberDao.idChk(vo);
		return result;
	}

	@Override
	public MemberVO findid(MemberVO vo) throws Exception {
		return memberDao.findid(vo);
	}

	@Override
	public MemberVO findpassword(MemberVO vo) throws Exception {
		return memberDao.findpassword(vo);
	}

	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		memberDao.memberDelete(vo);
	}
	
	//회원 탈퇴 패스워드 체크
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = memberDao.passChk(vo);
		return result;
	}


}