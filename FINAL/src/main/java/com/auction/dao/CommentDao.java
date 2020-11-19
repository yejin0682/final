package com.auction.dao;

import java.util.List;

import com.auction.vo.CommentVo;

public interface CommentDao {
	public void writeComment(CommentVo vo);
	public List<CommentVo> selectComment(int qbno);
	public int selectMaxCno();
	public void updateRef(int cno);
	public CommentVo topComment(int maxCno);
}
