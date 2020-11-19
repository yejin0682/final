package com.auction.dao;

import java.util.List;

import com.auction.vo.NoticeVo;

public interface NoticeDao {
	public void writeBoard(NoticeVo vo);
	
	public List<NoticeVo> selectBoard(int offset);
	public NoticeVo selectContent(int nbo);
	public List<NoticeVo> selectBoardAll();
//	public void updateHitCount(int nbo);

	public List<NoticeVo> searchTitleSize(String keyword);
	public List<NoticeVo> searchContentSize(String keyword);
	public List<NoticeVo> searchWriterSize(String keyword);
	public List<NoticeVo> searchTitleAndContentSize(String keyword);
	
	public List<NoticeVo> searchTitle(String keyword,int offset);
	public List<NoticeVo> searchContent(String keyword,int offset);
	public List<NoticeVo> searchWriter(String keyword,int offset);
	public List<NoticeVo> searchTitleAndContent(String keyword,int offset);

}
