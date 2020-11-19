package com.auction.dao;

import com.auction.vo.MemberVo;

public interface MemberDao {
	void write(MemberVo vo);	//회원가입
	
	MemberVo login(MemberVo vo);	//로그인
	
	void memberUpdate(MemberVo vo);	//회원 정보 수정
	
	public int apiLogin(String id,String api);
	
	public void insertApi(MemberVo vo);
	
	MemberVo IdCheck(MemberVo vo);	//아이디 찾기
	
	MemberVo PwCheck(MemberVo vo);	//비밀번호 찾기
	
	void newPW(MemberVo vo);
	
	MemberVo sameID(String ID);	//아이디 중복 체크
}
