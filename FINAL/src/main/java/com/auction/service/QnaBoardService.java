package com.auction.service;

import java.util.List;

import com.auction.vo.QnaBoardVo;

public interface QnaBoardService {
	public void wirteBoardService(QnaBoardVo vo);
	public List<QnaBoardVo> selectBoard(int offset);
	public QnaBoardVo selectContent(int qbno);
	public void updateHitcount(int qbno);
	public List<QnaBoardVo> selectBoardAll();
	public List<QnaBoardVo> selectFromId(String id);
	
	public List<QnaBoardVo> searchTitleSize(String keyword);
	public List<QnaBoardVo> searchContentSize(String keyword);
	public List<QnaBoardVo> searchWriterSize(String keyword);
	public List<QnaBoardVo> searchTitleAndContentSize(String keyword);
	
	public List<QnaBoardVo> searchTitle(String keyword,int offset);
	public List<QnaBoardVo> searchContent(String keyword,int offset);
	public List<QnaBoardVo> searchWriter(String keyword,int offset);
	public List<QnaBoardVo> searchTitleAndContent(String keyword,int offset);
	
	public void deleteBoard(int qbno);
	public void updateBoard(int qbno,String content);
}
