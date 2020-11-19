package com.auction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.NoticeDao;
import com.auction.vo.NoticeVo;
import com.auction.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeDao dao;
	
	@Override
	public List<NoticeVo> selectBoard(int offset) {
		return dao.selectBoard(offset);
	}

	@Override
	public NoticeVo selectContent(int nbo) {
		return dao.selectContent(nbo);
	}

	@Override
	public List<NoticeVo> selectBoardAll() {
		return dao.selectBoardAll();
	}

	@Override
	public void wirteBoardService(NoticeVo vo) {
		dao.writeBoard(vo);
	}
	
	@Override
	public List<NoticeVo> searchTitleSize(String keyword) {
		return dao.searchTitleSize(keyword);
	}
	
	@Override
	public List<NoticeVo> searchContentSize(String keyword) {
		return dao.searchContentSize(keyword);
	}
	
	@Override
	public List<NoticeVo> searchWriterSize(String keyword) {
		return dao.searchWriterSize(keyword);
	}
	
	@Override
	public List<NoticeVo> searchTitleAndContentSize(String keyword) {
		return dao.searchTitleAndContentSize(keyword);
	}

	@Override
	public List<NoticeVo> searchTitle(String keyword,int offset) {
		return dao.searchTitle(keyword,offset);
	}

	@Override
	public List<NoticeVo> searchContent(String keyword, int offset) {
		return dao.searchContent(keyword, offset);
	}

	@Override
	public List<NoticeVo> searchWriter(String keyword, int offset) {
		return dao.searchWriter(keyword, offset);
	}


	@Override
	public List<NoticeVo> searchTitleAndContent(String keyword, int offset) {
		return dao.searchTitleAndContent(keyword, offset);
	}

//	@Override
//	public void updateHitCount(int nbo) {
//		dao.updateHitCount(nbo);
//	}
}
