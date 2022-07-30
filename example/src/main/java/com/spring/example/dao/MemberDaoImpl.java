package com.spring.example.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.spring.example.VO.MemberVO;

public class MemberDaoImpl implements MemberDao {
	private static final String Namespace = "com.spring.example.dao.MemberDao";
	
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

}
