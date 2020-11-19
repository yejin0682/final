package com.auction.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.auction.vo.NoticeVo;

public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<NoticeVo> selectBoard(int offset) {
		return sqlSession.selectList("com.auction.mapper.NoticeMapper.selectBoard", offset);
	}

	@Override
	public NoticeVo selectContent(int nbo) {
		return sqlSession.selectOne("com.auction.mapper.NoticeMapper.selectContent", nbo);
	}


	@Override
	public List<NoticeVo> selectBoardAll() {
		return sqlSession.selectList("com.auction.mapper.NoticeMapper.selectBoardAll");
	}

	@Override
	public void writeBoard(NoticeVo vo) {
		sqlSession.insert("com.auction.mapper.NoticeMapper.writeBoard", vo);
	}

//	@Override
//	public void updateHitCount(int nbo) {
//		sqlSession.update("com.auction.mapper.NoticeMapper.updateHitcount", nbo);
//	}
	@Override
	public List<NoticeVo> searchTitleSize(String keyword) {
		return sqlSession.selectList("com.auction.mapper.NoticeMapper.searchTitleSize",keyword);
	}
	
	@Override
	public List<NoticeVo> searchContentSize(String keyword) {
		return sqlSession.selectList("com.auction.mapper.NoticeMapper.searchContentSize",keyword);
	}
	
	@Override
	public List<NoticeVo> searchWriterSize(String keyword) {
		return sqlSession.selectList("com.auction.mapper.NoticeMapper.searchWriterSize",keyword);
	}
	
	@Override
	public List<NoticeVo> searchTitleAndContentSize(String keyword) {
		return sqlSession.selectList("com.auction.mapper.NoticeMapper.searchTitleAndContentSize", keyword);
	}

	@Override
	public List<NoticeVo> searchTitle(String keyword,int offset) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("offset", offset);
		return sqlSession.selectList("com.auction.mapper.NoticeMapper.searchTitle", map);
	}

	@Override
	public List<NoticeVo> searchContent(String keyword, int offset) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("offset", offset);
		return sqlSession.selectList("com.auction.mapper.NoticeMapper.searchContent", map);
	}

	@Override
	public List<NoticeVo> searchWriter(String keyword, int offset) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("offset", offset);
		return sqlSession.selectList("com.auction.mapper.NoticeMapper.searchWriter", map);
	}

	@Override
	public List<NoticeVo> searchTitleAndContent(String keyword, int offset) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("offset", offset);
		return sqlSession.selectList("com.auction.mapper.NoticeMapper.searchTitleAndContent", map);
	}
}
