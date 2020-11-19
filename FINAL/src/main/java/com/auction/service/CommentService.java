package com.auction.service;

import java.util.List;

import com.auction.vo.CommentVo;

public interface CommentService {
	public void writeCommentService(CommentVo vo);
	public List<CommentVo> selectCommentService(int qbno);
	public int selectMaxCnoService();
	public void updateRefService(int cno);
	public CommentVo topComment(int maxCno);
}
