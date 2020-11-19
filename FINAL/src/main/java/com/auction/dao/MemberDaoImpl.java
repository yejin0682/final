package com.auction.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.auction.vo.MemberVo;


@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	SqlSession sqlSession;
	
	@Override		//회원가입
	public void write(MemberVo vo) {
		sqlSession.insert("com.auction.mapper.SignUpMapper.insert", vo);
	}
	
	@Override
	public MemberVo login(MemberVo vo) {
		return sqlSession.selectOne("com.auction.mapper.SignUpMapper.login", vo);
//		if(voDB == null) {
//			return false;
//		}
//		if(vo.getID().equals(voDB.getID()) && vo.getPW().equals(voDB.getPW())) {
//			return true;
//		}else {
//			return false;
//		}
	}
		
	
	@Override		//회원 정보 수정
	public void memberUpdate(MemberVo vo) {
		sqlSession.update("com.auction.mapper.SignUpMapper.memberUpdate", vo);
	}

	@Override
	public int apiLogin(String id, String api) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("api", api);
		return sqlSession.selectOne("com.auction.mapper.SignUpMapper.apiLogin", map);
	}

	@Override
	public void insertApi(MemberVo vo) {
		sqlSession.insert("com.auction.mapper.SignUpMapper.insertApi", vo);
	}
	
	@Override
	public MemberVo IdCheck(MemberVo vo) {
		return sqlSession.selectOne("com.auction.mapper.SignUpMapper.IDcheck", vo);
	}
	
	@Override
	public MemberVo PwCheck(MemberVo vo) {
		return sqlSession.selectOne("com.auction.mapper.SignUpMapper.PWcheck", vo);
	}
	
	@Override
	public void newPW(MemberVo vo) {
		sqlSession.update("com.auction.mapper.SignUpMapper.newPW", vo);
	}
	
	@Override
	public MemberVo sameID(String ID) {
		return sqlSession.selectOne("com.auction.mapper.SignUpMapper.sameId", ID);
		
	}
}
