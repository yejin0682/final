package com.auction.service;

import com.auction.vo.MemberVo;


public interface MemberService {
	void writeSignUp(MemberVo vo);	//회원 가입
	
	MemberVo loginCheck(MemberVo vo) throws Exception;	//로그인
	
	void memberUpdate(MemberVo vo);	//회원 정보 수정
	
	public int apiLogin(String id, String api);
	
	public void insertApi(MemberVo vo);
	
	MemberVo IdCheck(MemberVo vo) throws Exception;	//아이디 찾기
	
	MemberVo PwCheck(MemberVo vo) throws Exception;	//비밀번호 찾기
	
	void newPW(MemberVo vo);	//새 비밀번호 설정
	
	MemberVo sameID(String ID);	//아이디 중복 체크
}
