package com.spring.yacamping.dao;

 


import org.springframework.stereotype.Repository;

import com.spring.yacamping.domain.MemberVO;

@Repository
public interface MemberDao {

    public int Login(MemberVO vo) throws Exception;
    public void register(MemberVO vo) throws Exception;
    public MemberVO readMember(String id) throws Exception;
    public void updateMember(MemberVO vo) throws Exception;
	// 아이디 중복체크
	public int idChk(MemberVO vo) throws Exception;
	//아이디 찾기
	public MemberVO findid(MemberVO vo) throws Exception;
	//비밀번호 찾기
	public MemberVO findpassword(MemberVO vo) throws Exception;
	// 회원 탈퇴
	public void memberDelete(MemberVO vo) throws Exception;
	// 회원 탈퇴 패스워드 체크
	public int passChk(MemberVO vo) throws Exception;
}