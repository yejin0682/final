package com.auction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.MemberDao;
import com.auction.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;
	
	@Override	//회원가입
	public void writeSignUp(MemberVo vo) {
		dao.write(vo);
	}
	
	@Override
	public MemberVo loginCheck(MemberVo vo) throws Exception{
//		dao.login(vo);
		return dao.login(vo);
	}
	
	@Override	//회원 정보 수정
	public void memberUpdate(MemberVo vo) {
		dao.memberUpdate(vo);
	}

	@Override
	public int apiLogin(String id, String api) {
		return dao.apiLogin(id, api);
	}

	@Override
	public void insertApi(MemberVo vo) {
		dao.insertApi(vo);
	}
	
	@Override
	public MemberVo IdCheck(MemberVo vo)throws Exception{
		return dao.IdCheck(vo);
	}
	
	@Override
	public MemberVo PwCheck(MemberVo vo)throws Exception{
		return dao.PwCheck(vo);
	}
	
	@Override
	public void newPW(MemberVo vo) {
		dao.newPW(vo);
	}
	
	@Override
	public MemberVo sameID(String ID) {
		return dao.sameID(ID);
	}
}
