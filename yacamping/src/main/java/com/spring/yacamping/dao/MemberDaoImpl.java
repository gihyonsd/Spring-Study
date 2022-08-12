package com.spring.yacamping.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.spring.yacamping.domain.MemberVO;

public class MemberDaoImpl implements MemberDao {
	private static final String Namespace = "com.spring.yacamping.dao.MemberDao";
	
	@Inject
	private SqlSession sql;
	
	@Override
	public int Login(MemberVO vo) throws Exception {
		return sql.selectOne(Namespace + ".Login", vo);
	}

	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert(Namespace + ".register", vo);
	}

	@Override
	public MemberVO readMember(String id) throws Exception {
		MemberVO vo = sql.selectOne(Namespace + ".readMember", id); //괄호안의 물음표를 콤마뒤에 쓰는거임
		return vo;
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		sql.update(Namespace + ".updateMember", vo);
	}

	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sql.selectOne(Namespace + ".idChk", vo);
		return result;
	}

	@Override
	public MemberVO findid(MemberVO vo) throws Exception {
		return sql.selectOne(Namespace + ".findid", vo);
	}

	@Override
	public MemberVO findpassword(MemberVO vo) throws Exception {
		return sql.selectOne(Namespace + ".findpassword", vo);
	}

	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		sql.delete(Namespace + ".memberDelete", vo);
	}

	// 회원 탈퇴 패스워드 체크
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = sql.selectOne(Namespace + ".passChk", vo);
		return result;
	}
	

}
